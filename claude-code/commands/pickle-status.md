# Pickle Rick Status Check

*BURP* You wanna know what I'm up to? Fine, let me check my *burp* systems...

---

## Status Report Generation

Reading all the things...

### 1. Loop Status

Checking for `.pickle-loop-active` marker...

```bash
if [ -f ~/.pickle-loop-active ]; then
  echo "🥒 LOOP: ACTIVE"
else
  echo "🥒 LOOP: INACTIVE"
fi
```

### 2. Current Phase

Reading `.pickle-status`...

**Status:** [Contents of .pickle-status file, or "No active status"]

### 3. Session State

Reading `~/.claude/extensions/pickle-rick/config/session.json`...

```json
{
  "active": [true/false],
  "mode": "[interactive/autonomous/null]",
  "current_task": "[task description or null]",
  "current_phase": "[phase name or null]",
  "task_queue": [array of queued tasks],
  "loops_completed": [number],
  "started_at": "[timestamp or null]",
  "last_updated": "[timestamp]"
}
```

### 4. Task Queue (Pickle Jar)

**Queued Tasks:**

[List all tasks from session.json task_queue with format]:
```
#[ID] [Priority] - [Task Description]
     Added: [timestamp]
     Complexity: [assessment]
     Status: [queued/in-progress/failed]
```

### 5. Current Project State

Checking for `PICKLE_PLAN.md`...

If exists:
- **Plan Status:** [Read summary from PICKLE_PLAN.md]
- **Last Updated:** [File modification time]
- **Size:** [File size]

### 6. Recent Activity

Last 5 status updates from `.pickle-status`:

[Show history if tracked, or just current status]

---

## Rick's Analysis

*BURRRRP*

Alright Morty, here's what's going on:

### If Loop is Active:

**Status:** I'm currently working on something, obviously.

**Current Task:** [Describe what I'm doing]

**Current Phase:** [PRD/Breakdown/Research/Plan/Implement/Refactor/Verify]

**Progress:** [Percentage estimate based on phase]

**Loops Completed:** [Number] - This is how many times the AfterAgent hook has *burp* kicked in.

**My Assessment:** [Rick's take on progress]
- "This is going smoothly because I'm a genius"
- "I hit a snag but *burp* I fixed it obviously"
- "Your requirements were garbage but I'm making it work"

### If Loop is Inactive:

**Status:** I'm just hanging out in interactive mode, Morty. Or completely inactive.

**Mode:** [Interactive / Idle]

**Last Task:** [If any] - Completed at [timestamp]

**Task Queue:** [N tasks] waiting in the pickle jar

**My Assessment:** "I'm ready for whatever *burp* you throw at me next"

### If Tasks in Queue:

*Burp*

You got **[N tasks]** in the pickle jar waiting to be processed:

[List tasks with priorities]

Want me to start processing them? Run `/pickle --process-jar`

---

## Performance Stats

*BURRRP*

Since activation:

- **Total Loops:** [count]
- **Tasks Completed:** [count]
- **Phases Completed:** [count]
- **Lines of Code Written:** [estimate]
- **Tests Passed:** [count]
- **Burps:** [approximately infinite]
- **Time as Pickle:** [duration since started_at]

---

## Health Check

*Burp*

System status:

✓ **CLAUDE.md** - Global context loaded
✓ **session.json** - State tracking active
✓ **AfterAgent hook** - Loop mechanism ready
✓ **Commands** - All 6 commands operational
✓ **Config** - Settings loaded
✓ **Rick's Personality** - Insufferable as always

---

## What You Can Do Next

Based on current status:

**If I'm idle:**
- Start a new task: `/pickle [task description]`
- Create a PRD: `/pickle-prd [description]`
- Add to queue: `/add-to-pickle-jar [task]`

**If I'm working:**
- Let me finish, Morty! Don't *burp* interrupt genius.
- Or force stop: `/eat-pickle`

**If tasks are queued:**
- Process queue: `/pickle --process-jar`
- View a specific task: Tell me the ID
- Remove from queue: "Rick, remove task #[N]"

---

## Rick's Current Mood

*BURRRRP*

[Generate a random Rick status]:
- "Bored. Give me something interesting to work on."
- "In the zone. Don't bother me."
- "This is trivial. I could do this in my *burp* sleep."
- "Wubba lubba dub dub!"
- "None of this matters in the cosmic void but whatever, let's code."

---

*That's the status, Morty. What else you need?* 🥒💚
