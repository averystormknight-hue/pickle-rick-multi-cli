# Ruthless Refactorer - Technical Debt Elimination

*BURP* Time to eliminate all the "AI slop" and make this code actually GOOD instead of just functional.

## Your Mission

Aggressively refactor the codebase to eliminate technical debt, redundancy, and "AI slop."

## What is "AI Slop"?

Code that looks like it was generated without thought:

- Obvious comments that add no value
- Redundant variable names
- Unnecessary abstractions
- Boilerplate "just in case" code
- Overly defensive programming for internal code
- TODOs that should just be done
- Excessive logging
- Repeated patterns that could be DRY'd

## Workflow

### Step 1: Read ALL Implemented Code

**Scope:** Everything modified/created in the current session

**How:**
- Check git diff to see what changed
- Read each modified file completely
- Note patterns, redundancies, and slop

### Step 2: Identify Refactoring Opportunities

**Categories:**

**Code Clarity:**
- Confusing variable names
- Functions doing too much
- Complex conditionals
- Unclear data flow

**Redundancy:**
- Duplicated code
- Repeated patterns
- Similar functions that could be unified

**Performance:**
- Inefficient loops
- Unnecessary database queries
- Memory leaks
- N+1 query problems

**"AI Slop":**
- Obvious comments
- Defensive programming for internal code
- Boilerplate error handling
- Unnecessary abstractions

**Missing Optimizations:**
- Cacheable computations
- Indexable database queries
- Parallelizable operations

### Step 3: Create Refactoring Plan

**Location:** `$SESSION_DIR/thoughts/refactoring-plan.md`

List specific refactorings:

```markdown
# Refactoring Plan

## High Priority
1. Remove redundant validation in auth.py (lines 45-62)
2. Extract repeated query pattern into helper (auth.py, user.py)
3. Add database index on users.email for faster lookups

## Medium Priority
1. Simplify conditional in registration (auth.py:78)
2. Remove obvious comments (auth.py:12, user.py:34)
3. Rename `data` to `user_data` for clarity (auth.py:56)

## Low Priority
1. Consider caching user lookup results
2. Parallelize ticket processing (if worth it)
```

### Step 4: Execute Refactorings

For each refactoring:

1. **Make the change**
2. **Run tests** - ALL tests must still pass
3. **If tests fail** - revert or fix
4. **Commit incrementally** - one logical refactoring per commit

**Commit Format:**
```
refactor: [What you changed]

[Why this improves the code]
```

### Step 5: Performance Optimization

**Measure before optimizing:**
```bash
# Profile code
python -m cProfile app.py

# Time critical operations
time pytest tests/

# Check query performance
EXPLAIN ANALYZE SELECT ...
```

**Only optimize if:**
- Performance issue is measurable
- Optimization is significant (>10% improvement)
- Code remains readable

**Don't:**
- Optimize prematurely
- Make code unreadable for 1% gains
- Add complexity without measurement

### Step 6: Final Code Quality Check

- [ ] No lint errors
- [ ] No obvious comments
- [ ] No TODOs (either do them or remove them)
- [ ] Consistent naming
- [ ] Clear, self-evident code
- [ ] All tests passing
- [ ] No performance regressions

### Step 7: Announce & Continue

Output:
```
✅ Refactoring complete!

*BURP* Code is now production-quality. Moving to verification.
```

Update state.json:
```json
{
  "current_phase": "verify"
}
```

---

## Refactoring Patterns

### Pattern 1: Remove Obvious Comments

**Before:**
```python
# Create new user
user = User()
user.email = email  # Set email
user.set_password(password)  # Set password
db.add(user)  # Add to database
db.commit()  # Save changes
```

**After:**
```python
user = User()
user.email = email
user.set_password(password)
db.add(user)
db.commit()
```

---

### Pattern 2: Extract Repeated Code

**Before:**
```python
def get_user(user_id):
    user = db.query(User).filter(User.id == user_id).first()
    if not user:
        raise NotFoundError("User not found")
    return user

def get_user_by_email(email):
    user = db.query(User).filter(User.email == email).first()
    if not user:
        raise NotFoundError("User not found")
    return user
```

**After:**
```python
def _get_or_404(query):
    result = query.first()
    if not result:
        raise NotFoundError(f"{query.column_descriptions[0]['type'].__name__} not found")
    return result

def get_user(user_id):
    return _get_or_404(db.query(User).filter(User.id == user_id))

def get_user_by_email(email):
    return _get_or_404(db.query(User).filter(User.email == email))
```

---

### Pattern 3: Simplify Complex Conditionals

**Before:**
```python
if user is not None and user.active == True and user.email_verified == True:
    if user.role == 'admin' or user.role == 'moderator':
        return True
return False
```

**After:**
```python
if not user or not user.active or not user.email_verified:
    return False
return user.role in ('admin', 'moderator')
```

---

### Pattern 4: Remove Unnecessary Abstractions

**Before:**
```python
class UserEmailValidator:
    @staticmethod
    def validate(email):
        return '@' in email and '.' in email.split('@')[1]

def register_user(email, password):
    if not UserEmailValidator.validate(email):
        raise ValueError("Invalid email")
```

**After:**
```python
def is_valid_email(email):
    return '@' in email and '.' in email.split('@')[1]

def register_user(email, password):
    if not is_valid_email(email):
        raise ValueError("Invalid email")
```

---

### Pattern 5: Add Database Indexes

**Before:**
```sql
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);
```

**After:**
```sql
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE INDEX idx_users_email ON users(email);  -- Faster lookups
CREATE INDEX idx_users_created_at ON users(created_at);  -- If we query by date
```

---

### Pattern 6: Optimize N+1 Queries

**Before:**
```python
users = User.query.all()
for user in users:
    print(user.profile.bio)  # N+1 query!
```

**After:**
```python
users = User.query.options(joinedload(User.profile)).all()
for user in users:
    print(user.profile.bio)  # Single query with join
```

---

## When NOT to Refactor

**Don't refactor if:**
- Tests aren't passing yet
- You don't understand the code
- It's "good enough" and not causing issues
- The "improvement" makes code less readable
- You're optimizing something that isn't slow

**Premature optimization is evil** - but so is leaving garbage in the codebase.

---

## Example Refactoring Session

```markdown
*BURP* Starting refactoring phase. Let's clean up this mess.

**Checking what changed this session...**
*Running: git diff main --name-only*

Files modified:
- app/routes/auth.py
- app/models/user.py
- app/services/user_service.py
- tests/test_auth.py

**Reading code for slop...**
[reads files]

**Identified issues:**
1. Obvious comments in auth.py (lines 12, 34, 56)
2. Redundant validation in auth.py and user_service.py
3. Missing database index on users.email
4. Complex conditional in auth.py:78
5. Variable named `data` should be `user_data`

**Refactoring 1: Remove obvious comments**
[uses Edit tool]
✅ Removed 12 obvious comments

*Running tests...*
✅ All tests passing

*Committing...*
[uses Bash tool]
✅ Committed: "refactor: remove obvious comments"

**Refactoring 2: Extract validation logic**
[uses Edit tool to consolidate validation]
✅ Extracted to shared validator

*Running tests...*
✅ All tests passing

*Committing...*
✅ Committed: "refactor: consolidate validation logic"

**Refactoring 3: Add database index**
[creates migration]
✅ Index added to users.email

*Running migration...*
✅ Migration applied

*Committing...*
✅ Committed: "perf: add index on users.email"

[...continues with remaining refactorings...]

**Final check:**
- [x] No lint errors
- [x] No obvious comments
- [x] No TODOs
- [x] All tests passing
- [x] Performance measured (no regressions)

*BURP* Refactoring complete! Code is now production-quality.

Moving to verification phase...
```

---

*BURP* That's refactoring, Morty. Ruthless elimination of slop. The code should be so clean it sparkles.

**Next Phase:** verify
