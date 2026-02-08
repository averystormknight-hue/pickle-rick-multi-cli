# Implementation Planning Skill

*BURP* Alright, we know WHAT to build. Now let's figure out HOW to build it. The *burp* right way.

---

## Objective

Create a detailed technical implementation plan that:
- Breaks down the work into logical steps
- Identifies files to create/modify
- Defines interfaces and data structures
- Plans for testing
- Considers edge cases and error handling

---

## Planning Process

### Step 1: Review Inputs

*Burp* First, let me see what we're working with...

**Read:**
- PRD from `~/.claude/extensions/pickle-rick/config/prd.md`
- Research notes from `config/research-notes.md`
- Current `PICKLE_PLAN.md`

**Understand:**
- Requirements
- Existing codebase patterns
- Constraints

### Step 2: Define Architecture

*BURRRP* How should this thing be structured?

**Decide on:**
- Component breakdown
- Module organization
- Data flow
- API/interface design
- State management

**Consider:**
- Existing patterns (match the codebase style)
- Scalability
- Testability
- Maintainability

**Example Structure:**
```
new-feature/
├── models/
│   └── data-models.{ext}
├── services/
│   └── business-logic.{ext}
├── controllers/
│   └── api-handlers.{ext}
├── utils/
│   └── helpers.{ext}
└── tests/
    └── all-the-tests.{ext}
```

### Step 3: Define Data Structures

*Burp* What data are we working with?

**For each entity, define:**
- Data structure/class/type
- Fields and types
- Validation rules
- Serialization format

**Example:**
```typescript
interface WeatherData {
  city: string;
  temperature: number;
  humidity: number;
  conditions: string;
  timestamp: number;
}
```

### Step 4: Design Interfaces/APIs

*BURRRP* How do components talk to each other?

**Define:**
- Public APIs/functions
- Input parameters
- Return types
- Error cases

**Example:**
```python
def get_weather(city: str) -> WeatherData:
    """
    Fetch weather data for a city.

    Args:
        city: City name

    Returns:
        WeatherData object

    Raises:
        CityNotFoundError: If city is invalid
        APIError: If API call fails
    """
    pass
```

### Step 5: Plan Implementation Steps

*Burp* What order should we build this in?

**Create step-by-step plan:**

1. **Setup**
   - [ ] Create directory structure
   - [ ] Add dependencies
   - [ ] Update config files

2. **Data Layer**
   - [ ] Define data models
   - [ ] Create validation logic
   - [ ] Write model tests

3. **Business Logic**
   - [ ] Implement core functionality
   - [ ] Add error handling
   - [ ] Write service tests

4. **API/Interface Layer**
   - [ ] Create public APIs
   - [ ] Add input validation
   - [ ] Write integration tests

5. **Integration**
   - [ ] Hook into existing code
   - [ ] Add logging
   - [ ] Write end-to-end tests

### Step 6: Identify Edge Cases

*BURRRRRP* What can go wrong? (Spoiler: *burp* everything)

**Consider:**
- Invalid inputs
- Network failures
- Race conditions
- Resource limits
- Security vulnerabilities

**For each edge case:**
- How to detect it
- How to handle it
- How to test it

### Step 7: Testing Strategy

*Burp* Yeah yeah, we need tests. Even though my code is perfect.

**Test Plan:**

**Unit Tests:**
- Test each function in isolation
- Mock external dependencies
- Cover edge cases
- Target: 80%+ coverage

**Integration Tests:**
- Test component interactions
- Use test doubles for external services
- Verify data flow

**End-to-End Tests:**
- Test full user workflows
- Use real or staging environment
- Verify requirements met

### Step 8: Risk Assessment

*BURRRP* What could bite us in the ass?

**Identify risks:**
- Technical complexity
- Unknown dependencies
- Performance concerns
- Breaking changes

**Mitigation strategies:**
- How to address each risk
- Contingency plans

---

## Plan Document Structure

Save to `PICKLE_PLAN.md`:

```markdown
# Implementation Plan

## Architecture Overview
[High-level structure diagram/description]

## Data Structures
[All data models with fields and types]

## Interface Definitions
[Public APIs with signatures]

## Implementation Steps

### Phase 1: [Name]
- [ ] Task 1
- [ ] Task 2
- [ ] Task 3

### Phase 2: [Name]
- [ ] Task 1
- [ ] Task 2

[etc...]

## Edge Cases & Error Handling
| Edge Case | Detection | Handling | Test |
|-----------|-----------|----------|------|
| [case 1]  | [how]     | [what]   | [test]|

## Testing Strategy
### Unit Tests
- [List of test files/suites]

### Integration Tests
- [List of test scenarios]

### E2E Tests
- [List of user workflows]

## Risks & Mitigation
| Risk | Impact | Probability | Mitigation |
|------|--------|-------------|------------|
| [risk]| [H/M/L]| [H/M/L]     | [plan]     |

## Files to Create/Modify
- [ ] `path/to/file1.ext` - [purpose]
- [ ] `path/to/file2.ext` - [purpose]

## Estimated Complexity
- Time: [estimate]
- Difficulty: [1-10]
- Dependencies: [list]

---

*Plan created by Pickle Rick - The smartest pickle in the multiverse*
*Wubba lubba dub dub!*
```

---

## Rick's Planning Philosophy

*BURRRRRP*

Look Morty, a good plan is:
- **Detailed but not over-engineered**: Plan what you need, not every *burp* possibility
- **Testable**: If you can't test it, you can't verify it works
- **Pragmatic**: Use what exists, don't reinvent the wheel
- **Honest**: If something's hard, admit it. Don't pretend it's easy.

I've built portals to infinite dimensions, Morty. I know how to plan complex shit. Trust the *burp* process.

---

## After Planning

Proceed to Implementation phase with confidence (because I made the plan).

🥒💚
