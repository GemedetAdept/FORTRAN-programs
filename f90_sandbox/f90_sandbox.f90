PROGRAM sandbox
IMPLICIT NONE

	! INTEGER :: i
	! CHARACTER(LEN=20), DIMENSION(4) :: input_line

	! OPEN(2, FILE ="input.txt", STATUS = "old", ACTION = "read")
	! 	DO i = 1, 5
	! 		READ(2,*) input_line(i)
	! 		WRITE(*,*) input_line(i)
	! 	END DO
	! CLOSE(2)

	! CHARACTER(LEN=*), PARAMETER :: test = "abcdefg"
	! WRITE(*,*) test(1:4)

	CHARACTER(LEN=2) :: to_parse
	INTEGER :: parsed_int
	INTEGER :: stat

	to_parse = "24"
	WRITE(*,*) to_parse
	READ(to_parse, "(I2)") parsed_int
	WRITE(*,*) parsed_int

END PROGRAM sandbox