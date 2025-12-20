PROGRAM sandbox

    ! Output Formatting
    ! a10,
    ! a = character output
    ! 10 = 10 characters
    ! 
    ! i2,
    ! i = integer output
    ! 2 = length of character

    CHARACTER(len=*), PARAMETER :: equation_text = "84 + 13 = "
    INTEGER, PARAMETER :: equation = 84 + 13

    INTEGER :: i
    INTEGER :: integer_sum
    CHARACTER(len=8) :: integer_sum_text

    ! Output interpolation
    PRINT"(a10, i2)", equation_text, equation

    ! Do loop
    DO i=1, 9
        integer_sum = i + (i-1)
    END DO
    WRITE (integer_sum_char, "(i5)") integer_sum
    integer_sum_char = integer_sum_char
    PRINT"(a2)", integer_sum_char

END PROGRAM sandbox