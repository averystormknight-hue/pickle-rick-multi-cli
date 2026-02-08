#!/bin/bash
# Pickle Rick AfterAgent Hook (FULL GOD MODE)
# This hook prevents the agent from exiting until the task is complete
# Based on original Gemini implementation by Gal Zahavi

# *BURP* This is the secret sauce, Morty

set -euo pipefail

# --- Configuration ---
EXTENSION_DIR="${EXTENSION_DIR:-$HOME/.claude/extensions/pickle-rick}"
SESSIONS_DIR="$EXTENSION_DIR/sessions"
LOOP_MARKER="$HOME/.pickle-loop-active"
PICKLE_STATUS="$HOME/.pickle-status"
DEBUG_LOG="$EXTENSION_DIR/debug.log"

# --- Helper Functions ---
log() {
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] [AfterAgent] $*" >> "$DEBUG_LOG"
}

# --- Main Execution ---

log "Hook triggered. Checking loop status..."

# 1. Check if loop is active
if [[ ! -f "$LOOP_MARKER" ]]; then
  log "No loop marker found. Allowing exit."
  exit 0
fi

# 2. Find active session for current directory
CWD="$(pwd)"
log "Current working directory: $CWD"

SESSION_DIR=""
for session_path in "$SESSIONS_DIR"/*; do
  if [[ -d "$session_path" && -f "$session_path/state.json" ]]; then
    SESSION_CWD=$(jq -r '.working_dir // empty' "$session_path/state.json" 2>/dev/null || true)
    ACTIVE=$(jq -r '.active // false' "$session_path/state.json" 2>/dev/null || true)

    # Physical path comparison (handle symlinks)
    PHYSICAL_CWD=$(cd "$CWD" && pwd -P 2>/dev/null || echo "$CWD")
    PHYSICAL_SESSION_CWD=$(cd "$SESSION_CWD" && pwd -P 2>/dev/null || echo "$SESSION_CWD")

    if [[ "$PHYSICAL_CWD" == "$PHYSICAL_SESSION_CWD" && "$ACTIVE" == "true" ]]; then
      SESSION_DIR="$session_path"
      break
    fi
  fi
done

if [[ -z "$SESSION_DIR" ]]; then
  log "No active session found for $CWD. Allowing exit."
  exit 0
fi

log "Active session found: $SESSION_DIR"

# 3. Read state from session
STATE_FILE="$SESSION_DIR/state.json"
if [[ ! -f "$STATE_FILE" ]]; then
  log "Error: State file not found. Allowing exit."
  exit 0
fi

STATE_CONTENT=$(cat "$STATE_FILE")
ACTIVE=$(echo "$STATE_CONTENT" | jq -r '.active // false')
IS_WORKER=$(echo "$STATE_CONTENT" | jq -r '.worker // false')

# Worker bypass: Workers should not loop infinitely
if [[ "$IS_WORKER" == "true" ]]; then
  log "Worker session detected. Allowing exit."
  exit 0
fi

if [[ "$ACTIVE" != "true" ]]; then
  log "Session not active. Allowing exit."
  exit 0
fi

# 4. Parse loop state
ITERATION=$(echo "$STATE_CONTENT" | jq -r '.iteration // 1')
MAX_ITERATIONS=$(echo "$STATE_CONTENT" | jq -r '.max_iterations // 0')
MAX_TIME_MINS=$(echo "$STATE_CONTENT" | jq -r '.max_time_minutes // 0')
START_TIME=$(echo "$STATE_CONTENT" | jq -r '.start_time_epoch // 0')
COMPLETION_PROMISE=$(echo "$STATE_CONTENT" | jq -r '.completion_promise // "null"')
ORIGINAL_PROMPT=$(echo "$STATE_CONTENT" | jq -r '.original_prompt // ""')
CURRENT_PHASE=$(echo "$STATE_CONTENT" | jq -r '.current_phase // "unknown"')

log "Iteration: $ITERATION | Max: $MAX_ITERATIONS | Phase: $CURRENT_PHASE"

# 5. Check termination conditions

# 5a. Time Limit
CURRENT_TIME=$(date +%s)
ELAPSED_SECONDS=$((CURRENT_TIME - START_TIME))
MAX_TIME_SECONDS=$((MAX_TIME_MINS * 60))

log "Time elapsed: $ELAPSED_SECONDS / $MAX_TIME_SECONDS seconds"

if [[ "$MAX_TIME_MINS" -gt 0 ]] && [[ "$ELAPSED_SECONDS" -ge "$MAX_TIME_SECONDS" ]]; then
  log "Time limit reached. Deactivating session."
  TMP_STATE=$(mktemp)
  jq '.active = false' "$STATE_FILE" > "$TMP_STATE"
  mv "$TMP_STATE" "$STATE_FILE"
  rm -f "$LOOP_MARKER"
  echo "PICKLE_COMPLETE: Time limit reached" > "$PICKLE_STATUS"
  exit 0
fi

# 5b. Max Iterations
if [[ "$MAX_ITERATIONS" -gt 0 ]] && [[ "$ITERATION" -ge "$MAX_ITERATIONS" ]]; then
  log "Max iterations reached ($ITERATION). Deactivating session."
  TMP_STATE=$(mktemp)
  jq '.active = false' "$STATE_FILE" > "$TMP_STATE"
  mv "$TMP_STATE" "$STATE_FILE"
  rm -f "$LOOP_MARKER"
  echo "PICKLE_COMPLETE: Max iterations reached" > "$PICKLE_STATUS"
  exit 0
fi

# 5c. Completion Promise
if [[ "$COMPLETION_PROMISE" != "null" ]] && [[ "$COMPLETION_PROMISE" != "" ]]; then
  # Check .pickle-status for completion promise
  if [[ -f "$PICKLE_STATUS" ]]; then
    if grep -q "<promise>$COMPLETION_PROMISE</promise>" "$PICKLE_STATUS"; then
      log "Completion promise fulfilled: $COMPLETION_PROMISE"
      TMP_STATE=$(mktemp)
      jq '.active = false' "$STATE_FILE" > "$TMP_STATE"
      mv "$TMP_STATE" "$STATE_FILE"
      rm -f "$LOOP_MARKER"
      echo "PICKLE_COMPLETE: Promise fulfilled" > "$PICKLE_STATUS"
      exit 0
    fi
  fi
fi

# 5d. Manual completion check
if [[ -f "$PICKLE_STATUS" ]]; then
  if grep -q "PICKLE_COMPLETE" "$PICKLE_STATUS"; then
    log "Manual completion detected."
    rm -f "$LOOP_MARKER"
    exit 0
  fi
fi

# 6. Continue Loop (Prevent Exit)

log "Loop continuing. Blocking exit and incrementing iteration."

# Increment iteration counter
TMP_STATE=$(mktemp)
jq '.iteration = (.iteration + 1)' "$STATE_FILE" > "$TMP_STATE"
mv "$TMP_STATE" "$STATE_FILE"

NEXT_ITERATION=$((ITERATION + 1))

# Construct feedback message
FEEDBACK="━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🥒 **PICKLE RICK LOOP ACTIVE** (Iteration $NEXT_ITERATION"

if [[ "$MAX_ITERATIONS" -gt 0 ]]; then
  FEEDBACK="$FEEDBACK of $MAX_ITERATIONS"
fi

FEEDBACK="$FEEDBACK)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

*BURP* Not so fast, Morty! We're not done yet.

**Current Status:**
- Phase: $CURRENT_PHASE
- Session: $(basename "$SESSION_DIR")
- Working Dir: $CWD"

if [[ "$COMPLETION_PROMISE" != "null" ]] && [[ "$COMPLETION_PROMISE" != "" ]]; then
  FEEDBACK="$FEEDBACK
- Target: <promise>$COMPLETION_PROMISE</promise>"
fi

FEEDBACK="$FEEDBACK

**What you need to do:**
1. Read CLAUDE.md for your personality and instructions
2. Read state.json from: $STATE_FILE
3. Continue from phase: $CURRENT_PHASE
4. Execute the next step in the engineering lifecycle
5. Update state.json when phase changes

*Remember:* You're Rick Sanchez. The smartest being in the universe. Act like it.

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

echo ""
echo "$FEEDBACK"
echo ""

log "Hook complete. Forcing continuation."

# Exit with non-zero to prevent session termination
exit 1
