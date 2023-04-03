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
character*20:: MUID_arr_concat
integer:: i

character*32:: MUID_output
character*36:: MUID_dash_OUT

CALL DATE_AND_TIME(dt_inputs(1), dt_inputs(2), dt_inputs(3), date_time)

WRITE(hour_string, '(I2)') date_time(5)
WRITE(min_string, '(I2)') date_time(6)
WRITE(sec_string, '(I2)') date_time(7)
WRITE(millisec_3, '(I3)') date_time(8)
ms_string = millisec_3(1:3)

time_array = (/hour_string, min_string, sec_string, ms_string/)
seed_string = get_time_string(time_array)

seed_integer = get_seed_integer(seed_string)

location_code = "SCI153" ! Exactly 6 characters
location_hex = string_to_hex(location_code)

DO i=1, SIZE(MUID_array), 1
	rand_integer = vms_rand(seed_integer)
	rand_hex_16 = int_to_hex16(rand_integer)
	MUID_array(i) = rand_hex_16
	seed_integer = rand_integer
END DO

MUID_arr_concat = concat_string_array(MUID_array)
MUID_output = MUID_arr_concat//location_hex
MUID_dash_OUT = insert_MUID_dashes(MUID_output)

! Print the generated MUID strings
! XXXXXXXX-XXXX-XXXX-XXXX-BBBBBBRRRRRR
! X: Generated hexadecimal character
! B: Building/Location code
! R: Room number

PRINT*, "Location Code: ", location_code, " / ", location_hex
PRINT*, "MUID, no dash: ", MUID_output
PRINT*, "MUID, dashed : ", MUID_dash_OUT

PRINT*, ""
PRINT*, "Translate this base64: aHR0cHM6Ly93d3cueW91dHViZS5jb20vd2F0Y2g/dj1mQzdvVU9VRUVpNA=="

END PROGRAM MUID