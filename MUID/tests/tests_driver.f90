PROGRAM MUID_tests
use extrinsic
use pseudorand
IMPLICIT NONE
! gfortran extrinsic.f90 pseudorand.f90 MUID.f90 -o MUID.exe
! Program to generate unique IDs for cataloging mineral specimens

character*8:: date
character*9:: time
character*10:: zone
integer, dimension(8):: date_time
character*2:: hour_string
character*2:: min_string
character*2:: sec_string
character*3:: ms_string
character*9:: seed_string
integer:: seed_integer, rand_integer, stat
character*10:: rand_hex

CALL DATE_AND_TIME(date, time, zone, date_time)

WRITE(hour_string, '(I2)') date_time(5)
WRITE(min_string, '(I2)') date_time(6)
WRITE(sec_string, '(I2)') date_time(7)
WRITE(ms_string, '(I3)') date_time(8)

WRITE(hour_string, '(A2)') space_to_zero(hour_string)
WRITE(min_string, '(A2)') space_to_zero(min_string)
WRITE(sec_string, '(A2)') space_to_zero(sec_string)
WRITE(ms_string, '(A3)') space_to_zero(ms_string)

WRITE(seed_string, '(A9)') hour_string//min_string//sec_string//ms_string
PRINT*, "seed_string: ", seed_string
seed_string = reverse(seed_string)
seed_string = TRIM(seed_string)
PRINT*, "seed_string (reverse): ", seed_string

READ(seed_string,*,iostat=stat) seed_integer
PRINT*, "seed_integer: ", seed_integer

PRINT*, ACHAR(10)//"--- VMS Parameters ---"
rand_integer = vms_rand(seed_integer)
PRINT*, "rand_integer: ", rand_integer
PRINT*, "rand_integer (ABS): ", ABS(rand_integer)
WRITE(rand_hex, '(Z10)') rand_integer
PRINT*, "rand_hex:", rand_hex
PRINT*, "rand_hex (LEN): ", LEN_TRIM(rand_hex)

PRINT*, ACHAR(10)//"--- cc65 Parameters ---"
rand_integer = cc65_rand(seed_integer)
PRINT*, "rand_integer: ", rand_integer
PRINT*, "rand_integer (ABS): ", ABS(rand_integer)
WRITE(rand_hex, '(Z10)') rand_integer
PRINT*, "rand_hex:", rand_hex
PRINT*, "rand_hex (LEN): ", LEN_TRIM(rand_hex)

PRINT*, ACHAR(10)//"--- Microsoft Visual Parameters ---"
rand_integer = msv_rand(seed_integer)
PRINT*, "rand_integer: ", rand_integer
PRINT*, "rand_integer (ABS): ", ABS(rand_integer)
WRITE(rand_hex, '(Z10)') rand_integer
PRINT*, "rand_hex:", rand_hex
PRINT*, "rand_hex (LEN): ", LEN_TRIM(rand_hex)

END PROGRAM MUID_tests