/* example4-assign-values.p
   Demonstrates the ASSIGN statement for assigning values to variables.
*/

MESSAGE "Example 4: Assigning values to variables" VIEW-AS ALERT-BOX.

DEFINE VARIABLE cFirstName AS CHARACTER NO-UNDO.
DEFINE VARIABLE cLastName AS CHARACTER NO-UNDO.
DEFINE VARIABLE iAge AS INTEGER NO-UNDO.
DEFINE VARIABLE dSalary AS DECIMAL NO-UNDO.
DEFINE VARIABLE cFullName AS CHARACTER NO-UNDO.

/* Assign values to multiple variables at once */
ASSIGN
    cFirstName = "John"
    cLastName = "Doe"
    iAge = 25
    dSalary = 50000.00.

/* Calculate full name by concatenating strings */
ASSIGN cFullName = cFirstName + " " + cLastName.

DISPLAY
    "Employee Information" SKIP
    "Name: " cFullName SKIP
    "Age: " iAge SKIP
    "Salary: " dSalary FORMAT ">>,>>9.99".

MESSAGE "Example 4 complete." VIEW-AS ALERT-BOX.
