module funcmodule
    implicit none
    private
    public to_string
contains
    function to_string(number)
        implicit none

        !function result
        character*12:: to_string

        !dummy argument
        integer:: number

        write(to_string, '(i12.1)') number
        to_string = adjustl(to_string)
    end function to_string
end module funcmodule

program summation
    use funcmodule
    implicit none

    integer :: sum, a
    character*12:: intout

    print *, "This program performs summations. Enter 0 to stop."
    open (unit=10, file="SumData.DAT")
    sum = 0

    do
        print '(A4)', "Add:"
        read *, a
        if (a == 0) then
            exit
        else
            sum = sum + a
        end if
        intout = to_string(a)
        write (10,*) intout
    end do

    print *, "Summation = ", to_string(sum)
    write (10,*) "Summation = ", to_string(sum)
    close(10)
end program summation