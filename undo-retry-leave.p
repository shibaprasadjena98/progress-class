DO TRANSACTION ON ERROR UNDO:

    FIND Customer WHERE CustNum = 999 EXCLUSIVE-LOCK.

    DISPLAY Customer.Name.

END.

DO TRANSACTION:

    CREATE Customer.

    ASSIGN
        Customer.Name = "Test Customer".

    MESSAGE "Rolling back transaction".

    UNDO.

END.

DEFINE VARIABLE iAge AS INTEGER NO-UNDO.

UPDATE iAge.

DO TRANSACTION:

    IF iAge < 18 THEN DO:

        MESSAGE "Age must be 18 or above".

        UNDO, LEAVE.

    END.

    MESSAGE "Employee Added Successfully".

END.

DEFINE VARIABLE iAge AS INTEGER NO-UNDO.

DO TRANSACTION ON ERROR UNDO, RETRY:

    UPDATE iAge.

    IF iAge < 18 THEN DO:

        MESSAGE "Invalid Age. Try Again!".

        UNDO, RETRY.

    END.

    MESSAGE "Valid Age Entered".

END.

DEFINE VARIABLE cName AS CHARACTER NO-UNDO.

REPEAT:

    UPDATE cName.

    IF cName = "" THEN DO:

        MESSAGE "Name cannot be empty".

        RETRY.

    END.

    LEAVE.

END.

REPEAT:

    UPDATE cName.

    DISPLAY cName.

END.

REPEAT:

    CREATE Customer.

    ASSIGN
        Customer.Name = "Test".

END.

REPEAT:

    DO TRANSACTION:

        CREATE Customer.

        ASSIGN
            Customer.Name = "Shiba".

    END.

END.

REPEAT:

    UPDATE iAge.

    IF iAge < 18 THEN
        UNDO.

END.
