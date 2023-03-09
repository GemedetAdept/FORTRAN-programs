Program sandbox
implicit none
integer, parameter:: dp = selected_real_kind(31)

character*1:: esc = achar(27)
character*6:: ansi_purple = ""//achar(27)//"[35m "
character*4:: ansi_clear = ""//achar(27)//"[0m"

real:: har(10)
real:: pseudo_rand, modulus, multi, incr, seed
integer:: date_time(8)
character*10:: b(3)

real:: matrix(3,3) = 0.0
matrix(1, 1:3) = 1.0 ! top row
matrix(3, 1:3) = 1.0 ! bottom row
matrix(2, 1) = 1.0 ! center-left
matrix(2, 3) = 1.0 ! center-right

print*, matrix(1, 1:3)
print*, matrix(2, 1:3)
print*, matrix(3, 1:3)

! ANSI color code implementation for colored terminal output
write(1,*) ''//achar(27)//'[37m 37m '//achar(27)//'[0m'
print*, ""
print*, ''//achar(27)//'[29m 29m '//achar(27)//'[0m'
print*, ''//achar(27)//'[30m 30m '//achar(27)//'[0m'
print*, ''//achar(27)//'[31m 31m '//achar(27)//'[0m'
print*, ''//achar(27)//'[32m 32m '//achar(27)//'[0m'
print*, ''//achar(27)//'[33m 33m '//achar(27)//'[0m'
print*, ''//achar(27)//'[34m 34m '//achar(27)//'[0m'
print*, ''//achar(27)//'[35m 35m '//achar(27)//'[0m'
print*, ''//achar(27)//'[36m 36m '//achar(27)//'[0m'
print*, ''//achar(27)//'[37m 37m '//achar(27)//'[0m'


print*, ansi_purple//"Hello world!"//ansi_clear
print*, ''//achar(27)//'[36m Hello world! '//achar(27)//'[0m'


call date_and_time(b(1), b(2), b(3), date_time)

modulus = 2**32
multi = 69069
incr = 1
seed = date_time(8)

pseudo_rand = MOD(((multi*seed) + incr), modulus)
print*, pseudo_rand

End Program sandbox