PROGRAM sandbox
IMPLICIT NONE

INTEGER :: file_unit, file_size
CHARACTER(LEN=:), ALLOCATABLE :: filename
CHARACTER(LEN=:), ALLOCATABLE :: buffer
LOGICAL :: file_exists

file_unit = 1
filename = "input.txt"

INQUIRE(FILE=filename, EXIST=file_exists)
INQUIRE(FILE=filename, SIZE=file_size)

ALLOCATE(CHARACTER(LEN=file_size) :: buffer)

IF(file_exists .EQV. .TRUE.) THEN
    OPEN(file_unit, FILE=filename, STATUS="OLD", ACTION="READ")
    READ(file_unit, "(A)") buffer
    CLOSE(file_unit, STATUS="KEEP")
END IF

buffer = TRIM(buffer)
WRITE(*,*) buffer

END PROGRAM sandbox