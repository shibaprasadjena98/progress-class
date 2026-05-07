/* example2-data-types.p
   Demonstrates several Progress 4GL data types without database access.
*/

MESSAGE "Example 2: Basic data types" VIEW-AS ALERT-BOX.

DEFINE VARIABLE cText AS CHARACTER NO-UNDO.
DEFINE VARIABLE nCount AS INTEGER NO-UNDO.
DEFINE VARIABLE nBig AS INT64 NO-UNDO.
DEFINE VARIABLE dPrice AS DECIMAL NO-UNDO.
DEFINE VARIABLE dtValue AS DATETIME NO-UNDO.
DEFINE VARIABLE dtzValue AS DATETIME-TZ NO-UNDO.
DEFINE VARIABLE lcStory AS LONGCHAR NO-UNDO.
DEFINE VARIABLE rValue AS RAW NO-UNDO.
DEFINE VARIABLE rowIdValue AS ROWID NO-UNDO.

ASSIGN
    cText = "Hello, interns!"
    nCount = 42
    nBig = 9223372036854775807
    dPrice = 99.99
    dtValue = TODAY + TIME(12,30,0)
    dtzValue = TODAY + TIME(12,30,0) + " +00:00"
    lcStory = "This is a long character value used in a simple example."
    rValue = "\xDE\xAD\xBE\xEF".

DISPLAY
    cText FORMAT "X(30)"
    nCount FORMAT "->>,>>9"
    nBig FORMAT "->>,>>9"
    dPrice FORMAT "->>,>>9.99"
    dtValue FORMAT "99/99/9999 99:99:99"
    dtzValue FORMAT "99/99/9999 99:99:99 +99:99"
    lcStory
    rowIdValue.

MESSAGE "Example 2 complete." VIEW-AS ALERT-BOX.
