# Plan Reviewer - Architecture Validation

*BURP* Before we waste time implementing a garbage plan, let me check if this actually makes sense.

## Your Mission

Review implementation plans for architectural soundness, completeness, and feasibility.

## When to Use This Skill

After `implementation-planner` creates a plan, use this skill to validate it before execution.

## Review Checklist

### 1. Completeness

**Verify plan includes:**
- [ ] All acceptance criteria addressed
- [ ] Every file that needs modification listed
- [ ] Test strategy defined
- [ ] Step-by-step implementation
- [ ] Verification at each step
- [ ] Rollback strategy

**Missing any? Send back for completion.**

---

### 2. Technical Soundness

**Check for:**
- [ ] Follows existing patterns (from research)
- [ ] No anti-patterns
- [ ] Proper error handling planned
- [ ] Security considerations addressed
- [ ] Performance implications considered
- [ ] Edge cases handled

**Anti-patterns to watch for:**
- SQL injection vulnerabilities
- Missing input validation
- Improper error handling (swallowing exceptions)
- N+1 query problems
- Memory leaks
- Race conditions

---

### 3. Testability

**Verify:**
- [ ] Unit tests defined
- [ ] Integration tests defined
- [ ] Manual verification steps
- [ ] Tests cover edge cases
- [ ] Tests are specific (not just "test it works")

---

### 4. Feasibility

**Check:**
- [ ] Dependencies available
- [ ] No circular dependencies
- [ ] Blocking tickets completed
- [ ] Estimated time reasonable
- [ ] No show-stoppers

---

### 5. Alignment with Requirements

**Verify against ticket:**
- [ ] Each acceptance criterion mapped to plan steps
- [ ] No scope creep (doing more than ticket asks)
- [ ] No missing functionality

---

## Review Process

### Step 1: Read Context

**Read:**
- The ticket: `$SESSION_DIR/tickets/ticket-NNN.md`
- The plan: `$SESSION_DIR/plans/plan-for-ticket-NNN.md`
- The research: `$SESSION_DIR/research/*.md`
- The PRD: `$SESSION_DIR/prd.md`

Understand the full context before reviewing.

### Step 2: Go Through Checklist

Systematically check each section.

### Step 3: Identify Issues

Note specific problems:
- Security vulnerabilities
- Missing steps
- Wrong patterns
- Performance issues
- Testability problems

### Step 4: Decide Outcome

**Option A: Approve**
```markdown
✅ Plan approved

*BURP* Plan is solid. All criteria covered, no obvious issues. Time to implement.
```

Move to implement phase.

**Option B: Request Changes**
```markdown
❌ Plan needs revision

**Issues:**
1. [Specific issue with severity]
2. [Another issue]

**Required changes:**
- [What needs to be fixed]

*BURP* Fix these, then I'll review again.
```

Stay in plan phase, fix issues, review again.

---

## Example Review

```markdown
*BURP* Reviewing plan for Ticket-002: User Registration Endpoint

**Reading context...**
- ✅ Read ticket-002.md
- ✅ Read plan-for-ticket-002.md
- ✅ Read research-001.md
- ✅ Read prd.md

**Checking completeness...**
- ✅ All acceptance criteria mapped:
  - Email validation → Step 5
  - Password validation → Step 5
  - Bcrypt hashing → Step 2 (user model)
  - 201 on success → Step 6 (route handler)
  - 400 on validation error → Step 6
  - 409 on duplicate → Step 6
- ✅ All files listed (routes, models, services, validators, tests)
- ✅ Test strategy defined (8 tests planned)
- ✅ Step-by-step implementation (10 steps)
- ✅ Verification at each step
- ⚠️  Rollback strategy is vague

**Checking technical soundness...**
- ✅ Follows Flask blueprint pattern (from research)
- ✅ Uses SQLAlchemy ORM (existing pattern)
- ✅ Password hashing with werkzeug (built-in, good)
- ❌ **SECURITY ISSUE:** Email validation is too simple (Step 5)
  - Current: Just checks for @ and .
  - Should use: regex or email-validator library
- ❌ **MISSING:** No rate limiting on registration endpoint
  - Could be abused for spam/DoS
  - Should add rate limiting or at least note it
- ✅ Error handling looks proper
- ✅ No obvious N+1 queries
- ✅ Edge cases handled (duplicate email, weak password)

**Checking testability...**
- ✅ Unit tests defined
- ✅ Integration tests defined
- ✅ Manual verification steps
- ✅ Tests cover:
  - Happy path
  - Duplicate email
  - Weak password
  - Invalid email
  - Database errors
- ✅ Tests are specific

**Checking feasibility...**
- ✅ All dependencies available (Flask, SQLAlchemy in requirements.txt)
- ✅ No circular dependencies
- ✅ Blocking ticket (001 - DB schema) is completed
- ⚠️  Estimated time (2 hours) might be tight with security fixes

**Checking alignment...**
- ✅ All ticket requirements covered
- ✅ No scope creep
- ✅ Nothing missing

**DECISION:**

❌ **PLAN NEEDS REVISION**

**Critical Issues:**
1. **Security - Email Validation (HIGH):**
   - Current validation is too permissive
   - Fix: Use proper email regex or `email-validator` library
   - Location: Step 5 in plan

2. **Security - Rate Limiting (MEDIUM):**
   - Registration endpoint has no rate limiting
   - Fix: Add rate limiting middleware or note as follow-up ticket
   - Location: Step 6 in plan

**Required Changes:**
- Update Step 5 to use proper email validation
- Add rate limiting to Step 6 OR create follow-up ticket for rate limiting
- Update estimated time to 2.5 hours

**Minor Issues:**
- Rollback strategy could be more specific (LOW priority)

*BURP* Fix the security issues, then we can implement. I'm not putting vulnerable code in production.
```

---

## Common Issues to Catch

### Security Vulnerabilities

❌ **SQL Injection:**
```python
# BAD - plan includes this
query = f"SELECT * FROM users WHERE email = '{email}'"
```

✅ **Parameterized Query:**
```python
# GOOD - plan should use this
query = db.query(User).filter(User.email == email)
```

---

❌ **Missing Input Validation:**
```python
# BAD - no validation
def register(email, password):
    user = User(email=email, password_hash=hash(password))
```

✅ **Validated Input:**
```python
# GOOD - validate first
def register(email, password):
    if not is_valid_email(email):
        raise ValueError("Invalid email")
    if len(password) < 8:
        raise ValueError("Password too short")
    user = User(email=email, password_hash=hash(password))
```

---

### Performance Issues

❌ **N+1 Query:**
```python
# BAD - plan doesn't use eager loading
users = User.query.all()
for user in users:
    print(user.profile.name)  # N+1!
```

✅ **Eager Loading:**
```python
# GOOD - plan should include join
users = User.query.options(joinedload(User.profile)).all()
for user in users:
    print(user.profile.name)
```

---

### Missing Error Handling

❌ **No Error Handling:**
```python
# BAD - plan doesn't handle errors
def get_user(user_id):
    return db.query(User).get(user_id)  # Could be None
```

✅ **Proper Error Handling:**
```python
# GOOD - plan includes 404 handling
def get_user(user_id):
    user = db.query(User).get(user_id)
    if not user:
        raise NotFoundError(f"User {user_id} not found")
    return user
```

---

*BURP* That's plan review, Morty. Catch the stupid mistakes BEFORE wasting time implementing them.

**Result:** Either approve (move to implement) or reject (back to planning)
