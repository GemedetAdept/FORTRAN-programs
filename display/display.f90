PROGRAM display
IMPLICIT NONE

integer:: i
character*16:: lines(6)

lines(1) = "+--+--+--+--+--+"
lines(2) = "|  |  |  |  |  |"
lines(3) = "|  |  |  |  |  |"
lines(4) = "|  |  |  |  |  |"
lines(5) = "|  |  |  |  |  |"
lines(6) = "+--+--+--+--+--+"

DO i=1, 6
	PRINT*, lines(i)
END DO

END PROGRAM display