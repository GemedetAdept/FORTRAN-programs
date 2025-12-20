PROGRAM timestamp
use binary
use pseudorand
implicit none

! Program to generate unique codes, based on the generation of v1 UUIDs

integer*16:: from_binary
integer:: date_time(8)
character*10:: b(3)

! Initalizing variables to store the respective binary values
character*32:: year_bin, month_bin, day_bin, hour_bin,&
	& minute_bin, second_bin, millisec_bin

character*32:: YMD_concat
character*32:: HMSM_concat
character*64:: UTC_concat

character*32:: UTC_high, UTC_low
character*16:: UTC_middle
integer:: rand_holder
character*24:: rand_string
integer:: UTC_len
integer:: hour_int

call date_and_time(b(1), b(2), b(3), date_time)

print*, date_time

print*, ACHAR(10)

print*, "Year, Month, Day"
write(year_bin, '(B0.16)') date_time(1); print*, year_bin
write(month_bin, '(B0.8)') date_time(2); print*, month_bin
write(day_bin, '(B0.8)') date_time(3); print*, day_bin
YMD_concat = TRIM(year_bin)//TRIM(month_bin)//TRIM(day_bin)
print*, YMD_concat

print*, ACHAR(10)//"Hour, Minute, Second, Millisecond"
write(hour_bin, '(B0.8)') date_time(5); print*, hour_bin
write(minute_bin, '(B0.8)') date_time(6); print*, minute_bin
write(second_bin, '(B0.8)') date_time(7); print*, second_bin
write(millisec_bin, '(B0.8)') date_time(8); print*, millisec_bin
HMSM_concat = TRIM(hour_bin)//TRIM(minute_bin)//TRIM(second_bin)//&
	&TRIM(millisec_bin)
print*, HMSM_concat

print*, ACHAR(10)//hour_bin
hour_int = byte_to_int(hour_bin)
print*, hour_int

print*, ACHAR(10)//"Pseudorandom generator test:"
rand_holder = vms_rand(date_time(8))
print*, rand_holder
print '(Z0.7)', rand_holder

END PROGRAM timestamp