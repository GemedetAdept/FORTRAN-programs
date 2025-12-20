PROGRAM sandbox
IMPLICIT NONE

integer:: iter = 0
character:: input
integer:: vcounter = 0
integer:: hcounter = 0

DO WHILE (iter .LT. 10)
	READ(*,*) input

	IF (input .EQ. 'w') THEN
		vcounter = vcounter + 1

	ELSE IF (input .EQ. 's') THEN
		vcounter = vcounter - 1

	ELSE IF (input .EQ. 'd') THEN
		hcounter = hcounter + 1

	ELSE IF (input .EQ. 'a') THEN
		hcounter = hcounter -1
	END IF

	PRINT*, "Input: ", input
	PRINT*, "vCounter = ", vcounter
	PRINT*, "hCounter = ", hcounter
	iter = iter + 1
END DO

END PROGRAM sandbox