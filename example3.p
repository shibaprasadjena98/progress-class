/* example3-define-options.p
   Shows DEFINE VARIABLE options like NO-UNDO, INITIAL, FORMAT, LABEL, EXTENT, and LIKE.
*/

MESSAGE "Example 3: DEFINE VARIABLE options" VIEW-AS ALERT-BOX.

DEFINE VARIABLE nQty AS INTEGER NO-UNDO INITIAL 5 LABEL "Quantity".
DEFINE VARIABLE dRate AS DECIMAL NO-UNDO INITIAL 12.50 LABEL "Rate" FORMAT ">,>9.99".
DEFINE VARIABLE cStatus AS CHARACTER NO-UNDO INITIAL "Open" LABEL "Status" FORMAT "X(10)".
DEFINE VARIABLE nArray AS INTEGER EXTENT 4 NO-UNDO.
DEFINE VARIABLE nCopy AS INTEGER NO-UNDO LIKE nQty.

ASSIGN
    nArray[1] = 10
    nArray[2] = 20
    nArray[3] = 30
    nArray[4] = 40
    nCopy = nQty.

DISPLAY
    nQty LABEL "Qty"
    dRate
    cStatus
    nCopy LABEL "Copied Qty".

DISPLAY nArray[1] nArray[2] nArray[3] nArray[4].

MESSAGE "Example 3 complete." VIEW-AS ALERT-BOX.
