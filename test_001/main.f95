Program Hello
implicit none

! Declaring variables
character*12:: simple_output
integer:: basic, next, i,j,k
character*16:: strconv1, strconv2
real, parameter:: pi = 3.14159
real:: pi2
logical:: truth = .true.
logical:: lie = .false.

! Array
integer:: array0(3)
integer:: array1(3)

! Derived type
type:: atom
character*2:: label
real:: number, weight
end type atom

type(atom):: chromium
chromium%label = "Cr"
chromium%number = 24.0
chromium%weight = 51.996

! Assigning variable values

array0 = (/ 2, 4, 6 /)
array1 = (/ 6, 2, 4 /)

simple_output = "Hello World!"
basic = 12
next = 42

write(strconv1,'(i12.1)') next
write(strconv2, '(i12.1)') basic

print*, simple_output
print*, adjustl(strconv2)
print*, adjustl(strconv1)
print*, truth
print*, lie
print*, "Pi to the 5th place: ", pi
print*, ""

print*, chromium

print*, "Array testing: "
print*, array0
print*, array1
print*, array0*array1

read*, i,j,k
print*, i,j,k

End Program Hello