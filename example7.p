/* example7-string-manipulation.p
   Demonstrates string manipulation functions: CONCATENATION, LENGTH, SUBSTRING, TRIM, REPLACE.
*/

MESSAGE "Example 7: String manipulation functions" VIEW-AS ALERT-BOX.

DEFINE VARIABLE cString1 AS CHARACTER NO-UNDO INITIAL "Hello".
DEFINE VARIABLE cString2 AS CHARACTER NO-UNDO INITIAL "World".
DEFINE VARIABLE cResult AS CHARACTER NO-UNDO.
DEFINE VARIABLE iLen AS INTEGER NO-UNDO.
DEFINE VARIABLE cTrimmed AS CHARACTER NO-UNDO.

/* String concatenation using + operator */
ASSIGN cResult = cString1 + " " + cString2.
DISPLAY "Concatenation: " cResult.

DISPLAY SKIP.

/* LENGTH function */
DEFINE VARIABLE cMessage AS CHARACTER NO-UNDO INITIAL "  Progress 4GL  ".
ASSIGN iLen = LENGTH(cMessage).
DISPLAY "Original string: '" cMessage "'".
DISPLAY "Length (with spaces): " iLen.

DISPLAY SKIP.

/* SUBSTRING function - extract part of string */
DEFINE VARIABLE cExtract AS CHARACTER NO-UNDO.
ASSIGN cExtract = SUBSTRING(cString1, 2, 3).
DISPLAY "Substring of '" cString1 "' starting at position 2, length 3: " cExtract.

DISPLAY SKIP.

/* TRIM function - remove leading/trailing spaces */
ASSIGN cTrimmed = TRIM(cMessage).
DISPLAY "Trimmed string: '" cTrimmed "'".
DISPLAY "Length (trimmed): " LENGTH(cTrimmed).

DISPLAY SKIP.

/* REPLACE function - replace characters */
ASSIGN cResult = REPLACE("apple,banana,cherry", ",", " | ").
DISPLAY "Original list: apple,banana,cherry".
DISPLAY "Replaced with |: " cResult.

DISPLAY SKIP.

/* CAPS and LC functions - change case */
DEFINE VARIABLE cUpperCase AS CHARACTER NO-UNDO.
DEFINE VARIABLE cLowerCase AS CHARACTER NO-UNDO.
ASSIGN 
    cUpperCase = CAPS(cString1)
    cLowerCase = LC(cString2).
DISPLAY "Uppercase: " cUpperCase.
DISPLAY "Lowercase: " cLowerCase.

MESSAGE "Example 7 complete." VIEW-AS ALERT-BOX.
