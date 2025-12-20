! 2025-12-20 | GemedetAdept
! Memento mori ut memento vivere

PROGRAM graphics_test
IMPLICIT NONE
	
	INTEGER :: pos_x = 0
	INTEGER :: pos_y = 0
	CHARACTER :: input_key

	CHARACTER, DIMENSION(5,5) :: grid
	CHARACTER :: char_fill = "#"


	WRITE(*,*) "FORTRAN 90 | Graphics Test"

	DO WHILE (.TRUE.)
		! CALL EXECUTE_COMMAND_LINE("cls")

		WRITE(*,fmt="(A)", ADVANCE="no") "> " 
		READ(*,*) input_key

		IF (input_key .EQ. "x") THEN
			WRITE(*,*) "Exiting program..."
			EXIT
		ELSE
			CALL user_input(input_key, pos_x, pos_y)
		END IF

		CALL populate_grid(grid, char_fill)
		CALL print_grid(grid)
		WRITE(*,*) ""

		WRITE(*,"(A6, A1, I0)") "pos_x:", " ", pos_x
		WRITE(*,"(A6, A1, I0)") "pos_y:", " ", pos_y
		WRITE(*,*) ""

	END DO

END PROGRAM graphics_test

SUBROUTINE user_input(input_key, pos_x, pos_y)
IMPLICIT NONE

	CHARACTER :: input_key
	CHARACTER, PARAMETER :: key_up = "w"
	CHARACTER, PARAMETER :: key_down = "s"
	CHARACTER, PARAMETER :: key_right = "d"
	CHARACTER, PARAMETER :: key_left = "a"
	INTEGER :: pos_x, pos_y
	INTEGER :: offset

	SELECT CASE (input_key)
		CASE (key_up)
			pos_y = pos_y + 1
		CASE (key_down)
			pos_y = pos_y - 1
		CASE (key_right)
			pos_x = pos_x + 1
		CASE (key_left)
			pos_x = pos_x - 1
	END SELECT

END SUBROUTINE user_input

SUBROUTINE populate_grid(grid, char_fill)
IMPLICIT NONE

	CHARACTER, DIMENSION(5,5) :: grid
	CHARACTER :: char_fill
	INTEGER :: i, j

	DO i = LBOUND(grid, 1), UBOUND(grid, 1)
		DO j = LBOUND(grid, 2), UBOUND(grid, 2)
			grid(i, j) = char_fill
		END DO
	END DO

END SUBROUTINE populate_grid

SUBROUTINE print_grid(grid)
IMPLICIT NONE

	CHARACTER, DIMENSION(5,5) :: grid
	INTEGER :: i, j

	DO i = LBOUND(grid, 1), UBOUND(grid, 1)
		DO j = LBOUND(grid, 2), UBOUND(grid, 2)
			WRITE(*,fmt="(A)", ADVANCE="no") grid(i, j)
		END DO
		WRITE(*,*) ""
	END DO

END SUBROUTINE