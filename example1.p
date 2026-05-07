/* example1.p
   Simple Progress 4GL variable declaration and display.
*/

MESSAGE "Example 1: Variable declaration" VIEW-AS ALERT-BOX.

DEFINE VARIABLE i AS INTEGER NO-UNDO.
DEFINE VARIABLE cName AS CHARACTER NO-UNDO.
DEFINE VARIABLE lActive AS LOGICAL NO-UNDO.
DEFINE VARIABLE dAmount AS DECIMAL NO-UNDO.

ASSIGN
    i = 10
    cName = "Progress 4GL"
    lActive = TRUE
    dAmount = 123.45.

DISPLAY i cName lActive dAmount.

MESSAGE "Example 1 complete." VIEW-AS ALERT-BOX.
