Program timestamp
use binary
implicit none

! Program to generate unique codes, based on the generation of v1 UUIDs

integer*16:: from_binary
integer:: date_time(8)
character*10:: b(3)
integer:: unix = 1678418551

! Initalizing variables to store the respective binary values
character*32:: year_bin, month_bin, day_bin, hour_bin,&
	& minute_bin, second_bin, millisec_bin

character*48:: YMD_concat
character*64:: HMSM_concat
character*112:: UTC_concat
character*8:: byte_holder

call date_and_time(b(1), b(2), b(3), date_time)

print*, "Year, Month, Day"
write(year_bin, '(B0.16)') date_time(1); print*, year_bin
write(month_bin, '(B0.16)') date_time(2); print*, month_bin
write(day_bin, '(B0.16)') date_time(3); print*, day_bin
YMD_concat = TRIM(year_bin)//TRIM(month_bin)//TRIM(day_bin)
print*, YMD_concat

print*, ACHAR(10)//"Hour, Minute, Second, Millisecond"
write(hour_bin, '(B0.16)') date_time(5); print*, hour_bin
write(minute_bin, '(B0.16)') date_time(6); print*, minute_bin
write(second_bin, '(B0.16)') date_time(7); print*, second_bin
write(millisec_bin, '(B0.16)') date_time(8); print*, millisec_bin
HMSM_concat = TRIM(hour_bin)//TRIM(minute_bin)//TRIM(second_bin)//&
	&TRIM(millisec_bin)
print*, HMSM_concat

print*, ACHAR(10)//"UTC Time in binary: "
UTC_concat = TRIM(YMD_concat)//TRIM(HMSM_concat)
print*, UTC_concat

! Testing int_to_binary() function

print '(B0.8)', "!"

End Program timestamp