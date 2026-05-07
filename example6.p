/* example6-loops.p
   Demonstrates loop constructs: DO WHILE and DO...TO...BY.
*/

MESSAGE "Example 6: Loop constructs" VIEW-AS ALERT-BOX.

DEFINE VARIABLE iCounter AS INTEGER NO-UNDO INITIAL 1.
DEFINE VARIABLE cMessage AS CHARACTER NO-UNDO.

/* DO WHILE loop - repeats until condition is false */
MESSAGE "DO WHILE Loop - counting from 1 to 5:" VIEW-AS ALERT-BOX.
ASSIGN iCounter = 1.
DO WHILE iCounter <= 5:
    ASSIGN cMessage = "Iteration: " + STRING(iCounter).
    DISPLAY cMessage.
    ASSIGN iCounter = iCounter + 1.
END.

DISPLAY SKIP "---" SKIP.

/* DO...TO...BY loop - iterates a specific number of times */
MESSAGE "DO...TO...BY Loop - even numbers from 2 to 10:" VIEW-AS ALERT-BOX.
DO iCounter = 2 TO 10 BY 2:
    ASSIGN cMessage = "Number: " + STRING(iCounter).
    DISPLAY cMessage.
END.

DISPLAY SKIP "---" SKIP.

/* DO loop with conditional exit */
MESSAGE "DO loop with LEAVE (early exit):" VIEW-AS ALERT-BOX.
ASSIGN iCounter = 1.
DO:
    IF iCounter > 3 THEN LEAVE.
    ASSIGN cMessage = "Count: " + STRING(iCounter).
    DISPLAY cMessage.
    ASSIGN iCounter = iCounter + 1.
END.

MESSAGE "Example 6 complete." VIEW-AS ALERT-BOX.
