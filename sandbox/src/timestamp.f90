Program timestamp
use binary
implicit none

! Program to generate unique codes, based on the generation of v1 UUIDs

integer*16:: from_binary
integer:: date_time(8)
character*10:: b(3)

! Initalizing variables to store the respective binary values
character*32:: year_bin, month_bin, day_bin, hour_bin,&
	& minute_bin, second_bin, millisec_bin

character*17:: YMD_concat
character*27:: HMSM_concat
character*44:: UTC_concat
character*8:: byte_holder

call date_and_time(b(1), b(2), b(3), date_time)

print*, "Year, Month, Day"
write(year_bin, '(B0)') date_time(1); print*, year_bin
write(month_bin, '(B0)') date_time(2); print*, month_bin
write(day_bin, '(B0)') date_time(3); print*, day_bin
write(YMD_concat,'(A17)') TRIM(year_bin)//TRIM(month_bin)//TRIM(day_bin)

print*, "Hour, Minute, Second, Millisecond"
write(hour_bin, '(B0)') date_time(5); print*, hour_bin
write(minute_bin, '(B0)') date_time(6); print*, minute_bin
write(second_bin, '(B0)') date_time(7); print*, second_bin
write(millisec_bin, '(B0)') date_time(8); print*, millisec_bin
write(HMSM_concat,'(A27)') TRIM(hour_bin)//TRIM(minute_bin)//TRIM(second_bin)//&
	&TRIM(millisec_bin)

write(UTC_concat,'(A44)') TRIM(YMD_concat)//TRIM(HMSM_concat)

print*, ACHAR(10), UTC_concat
byte_holder = UTC_concat(40:44)

print '(Z2)', "1111"


End Program timestamp