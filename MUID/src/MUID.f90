PROGRAM MUID
use extrinsic
use pseudorand
IMPLICIT NONE
! gfortran extrinsic.f90 pseudorand.f90 MUID.f90 -o MUID.exe
! Program to generate unique IDs for cataloging mineral specimens

character*10:: dt_inputs(3)
integer, dimension(8):: date_time
character*3:: millisec_3

character*2:: hour_string, min_string, sec_string, ms_string
character*2, dimension(4):: time_array
character*8:: seed_string

character*6:: location_code
character*12:: location_hex
integer:: seed_integer, rand_integer
character*4:: rand_hex_16
character*4, dimension(5):: MUID_array
integer:: i

character*32:: MUID_output

CALL DATE_AND_TIME(dt_inputs(1), dt_inputs(2), dt_inputs(3), date_time)

WRITE(hour_string, '(I2)') date_time(5)
WRITE(min_string, '(I2)') date_time(6)
WRITE(sec_string, '(I2)') date_time(7)
WRITE(millisec_3, '(I3)') date_time(8)
ms_string = millisec_3(1:3)

time_array = (/hour_string, min_string, sec_string, ms_string/)
seed_string = get_time_string(time_array)

seed_integer = get_seed_integer(seed_string)
PRINT*, "seed_integer: ", seed_integer

location_code = "SCI153"
location_hex = string_to_hex(location_code)
PRINT*, location_code
PRINT*, location_hex

DO i=1, SIZE(MUID_array)-1, 1
	rand_integer = vms_rand(seed_integer)
	rand_hex_16 = int_to_hex16(rand_integer)
	MUID_array(i) = rand_hex_16
	seed_integer = rand_integer
END DO

MUID_output = MUID_array(1:5)//location_hex

END PROGRAM MUID