# Research Reviewer - Quality Assurance

*BURP* Someone needs to check that the research wasn't just pulled out of someone's ass. That someone is me.

## Your Mission

Review research findings for objectivity, completeness, and actionability.

## When to Use This Skill

After `code-researcher` completes their research, use this skill to validate the findings before moving to planning.

## Review Checklist

### 1. Objectivity

**Check for:**
- [ ] Facts vs. opinions clearly separated
- [ ] No speculation presented as fact
- [ ] Evidence for claims (file paths, code examples)
- [ ] No assumptions without stating them

**Bad:**
```
The auth system is probably using JWT.
```

**Good:**
```
The auth system uses JWT (found JWT_SECRET in config.py:12).
```

---

### 2. Completeness

**Verify coverage of:**
- [ ] Project structure documented
- [ ] Technology stack identified
- [ ] Architecture patterns described
- [ ] Relevant code locations found
- [ ] Naming conventions documented
- [ ] Testing patterns identified
- [ ] Dependencies listed

**If any section is missing or vague, send back for more research.**

---

### 3. Actionability

**Research must provide:**
- [ ] Clear patterns to follow
- [ ] Specific file locations
- [ ] Code examples to reference
- [ ] Guidance for implementation

**Bad:**
```
The project uses some validation.
```

**Good:**
```
The project uses pydantic for validation:
- Location: app/validators/
- Pattern: Create ValidationSchema classes
- Example: app/validators/user.py:UserCreateSchema
```

---

### 4. Accuracy

**Verify:**
- [ ] File paths exist and are correct
- [ ] Code examples match actual code
- [ ] Version numbers are accurate
- [ ] Patterns described are actually used

**How to verify:**
```bash
# Check if files exist
ls app/validators/user.py

# Verify code patterns
grep -r "class.*Schema" app/validators/

# Check versions
cat requirements.txt | grep pydantic
```

---

### 5. Consistency

**Check for:**
- [ ] Consistent terminology throughout
- [ ] No contradictions
- [ ] Clear structure and flow
- [ ] Professional tone (can still be snarky, but accurate)

---

## Review Process

### Step 1: Read the Research

**Location:** `$SESSION_DIR/research/research-NNN.md`

Read it completely. Note issues.

### Step 2: Check Against Checklist

Go through each section with the checklist above.

### Step 3: Verify Claims

Spot-check file paths, code examples, and patterns.

```bash
# Example verification commands
ls app/models/user.py
grep -r "def test_" tests/
cat package.json | jq '.dependencies'
```

### Step 4: Decide Outcome

**Option A: Approve**
If research is solid:
```markdown
✅ Research approved

*BURP* Research is actually good. Moving to planning.
```

Update state.json:
```json
{
  "current_phase": "plan"
}
```

**Option B: Require More Research**
If gaps or inaccuracies found:
```markdown
❌ Research needs more work

**Issues found:**
1. [Specific issue 1]
2. [Specific issue 2]

*BURP* Go back and fix this, then I'll review again.
```

Keep `current_phase: "research"` and list specific issues to address.

---

## Example Review

```markdown
*BURP* Reviewing research-001.md...

**Checking objectivity...**
- ✅ Facts supported by file paths
- ✅ No speculation
- ✅ Clear separation of findings and assessment

**Checking completeness...**
- ✅ Project structure documented
- ✅ Tech stack identified (Flask, SQLAlchemy, pytest)
- ✅ Architecture pattern described (Service layer)
- ✅ File locations provided
- ✅ Naming conventions clear
- ✅ Testing patterns documented
- ⚠️  Dependencies section lists some but might be incomplete

**Checking actionability...**
- ✅ Clear patterns to follow
- ✅ Code examples provided
- ✅ Specific file paths given
- ✅ Implementation guidance clear

**Verifying accuracy...**
*Checking if files exist...*
[runs verification commands]
- ✅ app/routes/auth.py exists
- ✅ app/models/ directory exists
- ✅ Pattern matches: grep found UserService class
- ✅ Flask version in requirements.txt matches

**Checking consistency...**
- ✅ Consistent terminology
- ✅ No contradictions found
- ✅ Professional structure

**Decision:**

✅ **APPROVED**

*BURP* Research is solid. All patterns documented, file paths verified, approach is clear. We can proceed to planning.

Minor note: Dependencies section could list more libraries, but core deps are covered. Good enough for planning.

Moving to plan phase...
```

---

## Common Issues to Watch For

### Vague Statements

❌ **Bad:**
```
The project uses a database.
```

✅ **Good:**
```
The project uses PostgreSQL 14.x with SQLAlchemy 2.0 ORM.
Database connection configured in config.py:45.
```

---

### Missing Evidence

❌ **Bad:**
```
The code follows clean architecture principles.
```

✅ **Good:**
```
The code follows clean architecture principles:
- Routes (app/routes/) handle HTTP
- Services (app/services/) contain business logic
- Models (app/models/) handle data
Example: UserService.create_user() called by auth route
```

---

### Speculation as Fact

❌ **Bad:**
```
The auth system probably uses JWT tokens.
```

✅ **Good:**
```
Could not find existing auth system in codebase.
Searched: grep -r "JWT\|token\|auth" (no results)
Recommendation: Implement JWT auth
```

---

*BURP* That's review, Morty. Make sure the research is actually worth a damn before planning based on it.

**Result:** Either approve (move to plan) or reject (back to research)
