# Progress 4GL Basics: Variables and Datatypes

## Background: 3GL vs 4GL

Progress 4GL is a fourth-generation language (4GL) designed to simplify business application development. In contrast, third-generation languages (3GLs) are more procedural and require more explicit coding for control flow, data access, and low-level operations.

### Common 3GL languages

- C
- Java
- Python
- COBOL
- Pascal

## History of Progress 4GL

- Developed by Progress Software Corporation in the early 1983.
- Designed to work with the Progress database and simplify enterprise application development.
- Originally called Progress 4GL, later rebranded as OpenEdge ABL (Advanced Business Language).
- Key strengths: rapid development, integrated database access, and strong business logic support.

> Display a message on the screen before work begins:
>
> ```progress
> MESSAGE "Starting Progress 4GL variable and datatype basics" VIEW-AS ALERT-BOX.
> ```
>
## 1. Variable Declaration

Use `DEFINE VARIABLE` to declare a local variable in Progress 4GL / OpenEdge ABL.

```progress
DEFINE VARIABLE i AS INTEGER NO-UNDO.
DEFINE VARIABLE cName AS CHARACTER NO-UNDO.
DEFINE VARIABLE dAmount AS DECIMAL NO-UNDO.
DEFINE VARIABLE lActive AS LOGICAL NO-UNDO.
```

## 2. Common Data Types

- `CHARACTER` — text/string
- `INTEGER` — whole numbers
- `INT64` — 64-bit integer
- `DECIMAL` — numeric with decimals
- `LOGICAL` — true/false
- `DATE` — calendar date
- `DATETIME` — date + time
- `DATETIME-TZ` — date/time with time zone
- `LONGCHAR` — long text string
- `ROWID` — row identifier
- `MEMPTR` — memory pointer
- `HANDLE` — object/stream handle
- `COM-HANDLE` — COM object handle
- `RAW` — binary data
- `BLOB` — binary large object
- `CLOB` — character large object
- `CLASS` — class reference or object handle

## 2.1 Default Initial Values

| Data Type | Default Initial Value |
|-----------|-----------------------|
| `CHARACTER` | `` (empty string) |
| `INTEGER` | 0 |
| `INT64` | 0 |
| `DECIMAL` | 0.00 |
| `LOGICAL` | FALSE |
| `DATE` | 01/01/0001 or blank depending on display settings |
| `DATETIME` | 01/01/0001 00:00:00 or blank |
| `DATETIME-TZ` | 01/01/0001 00:00:00 +00:00 or blank |
| `LONGCHAR` | `` (empty string) |
| `ROWID` | `` (empty string) |
| `MEMPTR` | ? (undefined until set) |
| `HANDLE` | ? (undefined until created) |
| `COM-HANDLE` | ? (undefined until created) |
| `RAW` | `` (empty raw buffer) |
| `BLOB` | ? (undefined until created) |
| `CLOB` | ? (undefined until created) |
| `CLASS` | ? (undefined until instantiated) |

## 2.2 Default Display Formats

| Data Type | Default Display Format |
|-----------|------------------------|
| `CHARACTER` | `X(0)` or standard string output |
| `INTEGER` | `->>,>>9` |
| `INT64` | `->>,>>9` |
| `DECIMAL` | `->>,>>9.99` |
| `LOGICAL` | `X(5)` (`TRUE`/`FALSE`) |
| `DATE` | `99/99/9999` or locale-specific date format |
| `DATETIME` | `99/99/9999 99:99:99` |
| `DATETIME-TZ` | `99/99/9999 99:99:99 +99:99` |
| `LONGCHAR` | `X(0)` or full text output |
| `ROWID` | `X(32)` or DB-specific rowid format |
| `MEMPTR` | `X(0)` or custom format when used |
| `HANDLE` | `X(0)` or object description when displayed |
| `COM-HANDLE` | `X(0)` or COM object description |
| `RAW` | `X(0)` or hexadecimal/binary output when formatted |
| `BLOB` | `X(0)` or binary output via conversion |
| `CLOB` | `X(0)` or large text output via conversion |
| `CLASS` | `X(0)` or class/object representation |

## 2.3 Examples

```progress
DEFINE VARIABLE hFile AS HANDLE NO-UNDO.
DEFINE VARIABLE dtz AS DATETIME-TZ NO-UNDO.
DEFINE VARIABLE i64 AS INT64 NO-UNDO.
DEFINE VARIABLE lcNotes AS LONGCHAR NO-UNDO.
DEFINE VARIABLE rID AS ROWID NO-UNDO.
DEFINE VARIABLE rawData AS RAW NO-UNDO.

MESSAGE "Default values and types defined." VIEW-AS ALERT-BOX.

ASSIGN
    i64 = 123456789012345
    lcNotes = "This is a very long character value."
    rID = "ABC123".

DISPLAY i64 lcNotes rID.
```

> Note: `BLOB`, `CLOB`, `COM-HANDLE`, and `CLASS` require more advanced handling and are not included in this basic first-session example.

## 3. Important DEFINE VARIABLE Options

- `NO-UNDO`
  - Prevents ABL from tracking changes for rollback.
  - Use for local variables unless transaction rollback is needed.

- `LIKE`
  - Inherits type and attributes from an existing variable or field.
  - Example: `DEFINE VARIABLE CustNum LIKE anotherIntegerVar NO-UNDO.`

- `INITIAL`
  - Sets a default starting value.
  - Example: `DEFINE VARIABLE total AS DECIMAL NO-UNDO INITIAL 0.00.`

- `FORMAT`
  - Controls display formatting for output.
  - Example: `DEFINE VARIABLE salary AS DECIMAL NO-UNDO FORMAT ">->>,>>9.99".`

- `LABEL`
  - Adds a friendly name for UI/debug display.
  - Example: `DEFINE VARIABLE startDate AS DATE NO-UNDO LABEL "Start Date".`

- `EXTENT`
  - Creates a fixed-size array.
  - Example: `DEFINE VARIABLE scores AS INTEGER EXTENT 5 NO-UNDO.`

- `SHARED`
  - Shares the variable across procedures in the same namespace.
  - Example: `DEFINE VARIABLE appMode AS CHARACTER SHARED NO-UNDO.`

## 4. Scope and Usage

- Local variables: declared inside the current procedure.
- Parameters: declared in procedure signatures.
- Shared variables: available across procedures in the same namespace.

## 5. Example with Multiple Options

```progress
DEFINE VARIABLE cFirstName AS CHARACTER NO-UNDO LABEL "First Name" FORMAT "X(20)" INITIAL "Unknown".
DEFINE VARIABLE nQty AS INTEGER NO-UNDO INITIAL 1.
DEFINE VARIABLE dPrice AS DECIMAL NO-UNDO FORMAT ">,>9.99" LABEL "Unit Price".
DEFINE VARIABLE bOK AS LOGICAL NO-UNDO INITIAL TRUE.
```

## 6. Best Practices

- Prefer `NO-UNDO` for local variables.
- Use `LIKE` when matching the type of another variable.
- Choose meaningful variable names.
- Use `LABEL` for clarity when outputting or debugging.
- Reserve `EXTENT` for fixed-size arrays only.

---

## Lesson 2: Working with Values and Logic

This section covers assigning values, strings, conditional logic, and loops—essential techniques for writing Progress 4GL programs.

### 7. Assigning Values to Variables

Use the `ASSIGN` statement to give values to variables. The `ASSIGN` keyword is optional for single assignments, but recommended for clarity and efficiency when assigning multiple variables.

```progress
DEFINE VARIABLE cFirstName AS CHARACTER NO-UNDO.
DEFINE VARIABLE cLastName AS CHARACTER NO-UNDO.

ASSIGN
    cFirstName = "John"
    cLastName = "Doe".
```

**See**: `example4-assign-values.p`

### 8. Conditional Logic: IF...THEN...ELSE

Use `IF...THEN...ELSE` to execute different code based on conditions.

**Basic syntax:**
```progress
IF condition THEN
    <statement>
ELSE
    <statement>.
```

**For multiple statements, use DO blocks:**
```progress
IF age >= 18 THEN
    DO:
        cStatus = "Adult".
        DISPLAY "You are an adult.".
    END.
ELSE
    DO:
        cStatus = "Minor".
        DISPLAY "You are a minor.".
    END.
```

**IF...THEN as a function (returns a value):**
```progress
ASSIGN cCategory = IF iAge < 18 THEN "Teen" ELSE "Adult".
```

**See**: `example5-if-then-else.p`

### 9. Looping: DO WHILE and DO...TO...BY

#### DO WHILE Loop
Repeats while a condition is true.

```progress
DEFINE VARIABLE iCounter AS INTEGER INITIAL 1 NO-UNDO.

DO WHILE iCounter <= 5:
    DISPLAY "Count: " iCounter.
    ASSIGN iCounter = iCounter + 1.
END.
```

#### DO...TO...BY Loop
Iterates a specific number of times with an increment.

```progress
DO iCounter = 1 TO 10 BY 2:
    DISPLAY iCounter.  /* Displays 1, 3, 5, 7, 9 */
END.
```

#### Early Exit with LEAVE
```progress
DO:
    IF iCounter > 5 THEN LEAVE.
    /* other statements */
END.
```

**See**: `example6-loops.p`

### 10. String Manipulation Functions

#### Concatenation (joining strings)
```progress
cFullName = cFirstName + " " + cLastName.
```

#### LENGTH - Count characters
```progress
iLen = LENGTH("Hello").  /* Returns 5 */
```

#### SUBSTRING - Extract part of a string
```progress
cPart = SUBSTRING("Hello", 2, 3).  /* Returns "ell" */
```

#### TRIM - Remove leading/trailing spaces
```progress
cTrimmed = TRIM("  Hello  ").  /* Returns "Hello" */
```

#### REPLACE - Replace characters
```progress
cResult = REPLACE("apple,banana", ",", "|").  /* Returns "apple|banana" */
```

#### CAPS and LC - Change case
```progress
cUpper = CAPS("hello").  /* Returns "HELLO" */
cLower = LC("HELLO").  /* Returns "hello" */
```

**See**: `example7-string-manipulation.p`

### 11. Key Operators and Comparisons

| Operator | Symbol | Example |
|----------|--------|---------|
| Equal | = | `IF x = 5` |
| Not equal | <> | `IF x <> 5` |
| Greater than | > | `IF x > 5` |
| Less than | < | `IF x < 5` |
| Greater or equal | >= | `IF x >= 5` |
| Less or equal | <= | `IF x <= 5` |
| AND | AND | `IF x > 0 AND y < 10` |
| OR | OR | `IF x = 1 OR x = 2` |
| NOT | NOT | `IF NOT lFlag` |

### 12. Lesson Summary for First Session

By the end of this first session, interns should understand:

1. How to define variables with `DEFINE VARIABLE`
2. Data types (CHARACTER, INTEGER, DECIMAL, LOGICAL, DATE, DATETIME, etc.)
3. Variable options (NO-UNDO, INITIAL, FORMAT, LABEL, EXTENT, LIKE)
4. How to assign values with the `ASSIGN` statement
5. Conditional logic with `IF...THEN...ELSE`
6. Creating loops with `DO WHILE` and `DO...TO...BY`
7. Basic string manipulation (concatenation, LENGTH, SUBSTRING, TRIM, REPLACE)
8. Comparison operators and logical operators

### 13. Recommended Practice Files

Run these example files in order:
- `example1-variable-declaration.p`
- `example2-data-types.p`
- `example3-define-options.p`
- `example4-assign-values.p`
- `example5-if-then-else.p`
- `example6-loops.p`
- `example7-string-manipulation.p`

### 14. Next Session Preview

Session 2 will cover:
- Understanding procedures and blocks
- Working with functions
- Error handling
- Introduction to data access (carefully, no databases yet)
