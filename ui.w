/* Variable Definitions */

DEFINE VARIABLE cName AS CHARACTER NO-UNDO
    VIEW-AS FILL-IN SIZE 25 BY 1.

DEFINE VARIABLE iAge AS INTEGER NO-UNDO
    VIEW-AS FILL-IN SIZE 10 BY 1.

DEFINE VARIABLE cDept AS CHARACTER NO-UNDO
    VIEW-AS COMBO-BOX
    LIST-ITEMS "HR","IT","Finance","Admin"
    SIZE 20 BY 1.

DEFINE VARIABLE cGender AS CHARACTER NO-UNDO
    VIEW-AS RADIO-SET
    RADIO-BUTTONS
        "Male", "M",
        "Female", "F"
    HORIZONTAL.

DEFINE VARIABLE lActive AS LOGICAL NO-UNDO
    VIEW-AS TOGGLE-BOX LABEL "Active Employee".

DEFINE VARIABLE cComments AS CHARACTER NO-UNDO
    VIEW-AS EDITOR SIZE 40 BY 4.

/* Buttons */

DEFINE BUTTON btnSave LABEL "Save".
DEFINE BUTTON btnExit LABEL "Exit".

/* Frame Definition */

DEFINE FRAME frEmp
    cName     LABEL "Employee Name"
    iAge      LABEL "Age"
    cDept     LABEL "Department"
    cGender   LABEL "Gender"
    lActive
    cComments LABEL "Comments"
    btnSave
    btnExit
WITH
    TITLE "Employee Entry Form"
    CENTERED
    SIDE-LABELS.

// SAVE

ON CHOOSE OF btnSave IN FRAME frEmp DO:

    MESSAGE
        "Employee Saved Successfully!"
        SKIP
        "Name: " cName:SCREEN-VALUE
        SKIP
        "Age: " iAge:SCREEN-VALUE
        SKIP
        "Department: " cDept:SCREEN-VALUE
        SKIP
        "Gender: " cGender:SCREEN-VALUE
    VIEW-AS ALERT-BOX INFO BUTTONS OK.

END.

// EXIT

ON CHOOSE OF btnExit IN FRAME frEmp DO:

    MESSAGE
        "Exiting Application..."
    VIEW-AS ALERT-BOX INFO BUTTONS OK.

    APPLY "CLOSE":U TO THIS-PROCEDURE.

END.



ENABLE
    cName
    iAge
    cDept
    cGender
    lActive
    cComments
    btnSave
    btnExit
WITH FRAME frEmp.

/* Wait for User Actions */

WAIT-FOR CLOSE OF THIS-PROCEDURE.
