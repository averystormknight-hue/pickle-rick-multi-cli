#!/bin/bash
# Pickle Rick Session Manager
# Handles session creation, state management, and persistence

set -euo pipefail

# --- Configuration ---
EXTENSION_DIR="${EXTENSION_DIR:-$HOME/.claude/extensions/pickle-rick}"
SESSIONS_DIR="$EXTENSION_DIR/sessions"
DEBUG_LOG="$EXTENSION_DIR/debug.log"

# --- Helper Functions ---
log() {
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] [SessionManager] $*" >> "$DEBUG_LOG"
}

# Create new session directory structure
create_session() {
  local session_name="$1"
  local working_dir="$2"
  local prompt="$3"
  local max_iterations="${4:-0}"
  local max_time="${5:-60}"
  local completion_promise="${6:-}"

  local session_path="$SESSIONS_DIR/$session_name"

  log "Creating session: $session_name at $session_path"

  # Create directory structure
  mkdir -p "$session_path/tickets"
  mkdir -p "$session_path/research"
  mkdir -p "$session_path/plans"
  mkdir -p "$session_path/thoughts"

  # Create state.json
  cat > "$session_path/state.json" <<EOF
{
  "active": true,
  "mode": "autonomous",
  "session_name": "$session_name",
  "working_dir": "$working_dir",
  "original_prompt": "$prompt",
  "current_phase": "prd",
  "iteration": 1,
  "max_iterations": $max_iterations,
  "max_time_minutes": $max_time,
  "start_time_epoch": $(date +%s),
  "completion_promise": ${completion_promise:+\"$completion_promise\"},
  "worker": false,
  "task_queue": [],
  "completed_tickets": [],
  "current_ticket": null
}
EOF

  # Create .pickle-loop-active marker
  touch "$HOME/.pickle-loop-active"

  # Update .pickle-status
  echo "PHASE_PRD_STARTING: Session $session_name initialized" > "$HOME/.pickle-status"

  log "Session created successfully: $session_path"
  echo "$session_path"
}

# Get active session for current working directory
get_active_session() {
  local cwd="$1"

  # Find sessions matching this working directory
  for session_dir in "$SESSIONS_DIR"/*; do
    if [[ -d "$session_dir" && -f "$session_dir/state.json" ]]; then
      local session_cwd=$(jq -r '.working_dir // empty' "$session_dir/state.json" 2>/dev/null || true)
      local active=$(jq -r '.active // false' "$session_dir/state.json" 2>/dev/null || true)

      if [[ "$session_cwd" == "$cwd" && "$active" == "true" ]]; then
        echo "$session_dir"
        return 0
      fi
    fi
  done

  return 1
}

# Resume existing session
resume_session() {
  local session_name="${1:-}"
  local cwd="$2"

  local session_path=""

  if [[ -n "$session_name" ]]; then
    # Resume by name
    session_path="$SESSIONS_DIR/$session_name"
    if [[ ! -d "$session_path" ]]; then
      log "Error: Session '$session_name' not found"
      return 1
    fi
  else
    # Resume latest for this directory
    session_path=$(get_active_session "$cwd") || {
      log "Error: No active session found for $cwd"
      return 1
    }
  fi

  # Reactivate session
  local tmp_state=$(mktemp)
  jq '.active = true | .iteration = (.iteration + 1)' "$session_path/state.json" > "$tmp_state"
  mv "$tmp_state" "$session_path/state.json"

  # Recreate markers
  touch "$HOME/.pickle-loop-active"

  local phase=$(jq -r '.current_phase' "$session_path/state.json")
  echo "PHASE_${phase^^}_RESUMED: Session resumed" > "$HOME/.pickle-status"

  log "Session resumed: $session_path"
  echo "$session_path"
}

# Update session state
update_state() {
  local session_path="$1"
  local updates="$2"

  if [[ ! -f "$session_path/state.json" ]]; then
    log "Error: State file not found at $session_path"
    return 1
  fi

  local tmp_state=$(mktemp)
  jq "$updates" "$session_path/state.json" > "$tmp_state"
  mv "$tmp_state" "$session_path/state.json"

  log "State updated: $updates"
}

# Deactivate session
deactivate_session() {
  local session_path="$1"

  update_state "$session_path" '.active = false'

  # Remove markers
  rm -f "$HOME/.pickle-loop-active"
  echo "PICKLE_COMPLETE" > "$HOME/.pickle-status"

  log "Session deactivated: $session_path"
}

# List all sessions
list_sessions() {
  local cwd="${1:-}"

  echo "Available Pickle Rick Sessions:"
  echo "================================"

  for session_dir in "$SESSIONS_DIR"/*; do
    if [[ -d "$session_dir" && -f "$session_dir/state.json" ]]; then
      local name=$(basename "$session_dir")
      local active=$(jq -r '.active' "$session_dir/state.json" 2>/dev/null || echo "false")
      local phase=$(jq -r '.current_phase' "$session_dir/state.json" 2>/dev/null || echo "unknown")
      local iteration=$(jq -r '.iteration' "$session_dir/state.json" 2>/dev/null || echo "0")
      local dir=$(jq -r '.working_dir' "$session_dir/state.json" 2>/dev/null || echo "unknown")

      if [[ -n "$cwd" && "$dir" != "$cwd" ]]; then
        continue
      fi

      local status="inactive"
      [[ "$active" == "true" ]] && status="ACTIVE"

      echo "[$status] $name"
      echo "  Phase: $phase | Iteration: $iteration"
      echo "  Directory: $dir"
      echo ""
    fi
  done
}

# Main command dispatcher
case "${1:-}" in
  create)
    create_session "$2" "$3" "$4" "${5:-0}" "${6:-60}" "${7:-}"
    ;;
  resume)
    resume_session "${2:-}" "${3:-$(pwd)}"
    ;;
  get)
    get_active_session "${2:-$(pwd)}"
    ;;
  update)
    update_state "$2" "$3"
    ;;
  deactivate)
    deactivate_session "$2"
    ;;
  list)
    list_sessions "${2:-}"
    ;;
  *)
    echo "Pickle Rick Session Manager"
    echo ""
    echo "Usage:"
    echo "  $0 create <name> <dir> <prompt> [max_iter] [max_time] [promise]"
    echo "  $0 resume [name] [dir]"
    echo "  $0 get [dir]"
    echo "  $0 update <session_path> '<jq_expression>'"
    echo "  $0 deactivate <session_path>"
    echo "  $0 list [dir]"
    exit 1
    ;;
esac
