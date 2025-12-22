PROGRAM sandbox
IMPLICIT NONE

	INTEGER :: test
	WRITE(*,*) test

	CALL change(test)
	WRITE(*,*) test

END PROGRAM sandbox

SUBROUTINE change(int)
IMPLICIT NONE
	
	INTEGER :: int
	int = int + 1
	RETURN

END SUBROUTINE change