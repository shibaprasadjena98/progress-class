/* example5-if-then-else.p
   Demonstrates conditional logic with IF...THEN...ELSE statements.
*/

MESSAGE "Example 5: Conditional logic with IF...THEN...ELSE" VIEW-AS ALERT-BOX.

DEFINE VARIABLE iAge AS INTEGER NO-UNDO INITIAL 20.
DEFINE VARIABLE dBalance AS DECIMAL NO-UNDO INITIAL 1500.00.
DEFINE VARIABLE cStatus AS CHARACTER NO-UNDO.

/* Simple IF...THEN...ELSE */
IF iAge >= 18 THEN
    cStatus = "Adult"
ELSE
    cStatus = "Minor".

DISPLAY "Age: " iAge SKIP "Status: " cStatus.

/* IF...THEN...ELSE with DO blocks for multiple statements */
IF dBalance > 1000 THEN
    DO:
        cStatus = "Good Balance".
        DISPLAY "Your balance is healthy: " dBalance FORMAT ">>,>>9.99".
    END.
ELSE
    DO:
        cStatus = "Low Balance".
        DISPLAY "Your balance is low: " dBalance FORMAT ">>,>>9.99".
    END.

/* IF...THEN function to assign a value */
DEFINE VARIABLE cAgeCategory AS CHARACTER NO-UNDO.
ASSIGN cAgeCategory = IF iAge < 18 THEN "Teen" ELSE "Adult".

DISPLAY "Age Category: " cAgeCategory.

MESSAGE "Example 5 complete." VIEW-AS ALERT-BOX.
