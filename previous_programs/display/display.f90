PROGRAM display
IMPLICIT NONE

integer:: i
character*32:: lines(16)

lines(1) =  "  _______  ,-------------------."
lines(2) =  " /####   \;       #### ####### |"
lines(3) =  "|  ####  #\  ##################|"
lines(4) =  "| ### #### | # #######         |"
lines(5) =  "|  #    ## |####               |"
lines(6) =  "|####### # |  ######   # ####  |"
lines(7) =  "|#######  /       #############|"
lines(8) =  " \_______/;          #######   |"
lines(9) =  "           '-------------------."
lines(10) = "                                "
lines(11) = "                                "
lines(12) = "                                "
lines(13) = "                                "
lines(14) = "                                "
lines(15) = "                                "
lines(16) = "                                "

DO i=1, 16
	PRINT*, lines(i)
END DO

END PROGRAM display