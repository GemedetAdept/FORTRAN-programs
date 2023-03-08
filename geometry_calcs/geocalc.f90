Program geocalc
! gfortran geocalc.f90 equations.f90 -o geocalc.exe
! ./geocalc
use equations
implicit none

! quadgon variables
real:: quad_w, quad_l

! trigon variables
real:: tri_A, tri_B, tri_C, tri_base, tri_height

! input variables
character*32:: mod_selection
character*32, dimension(4):: module_options

! output variables
real:: calc_sum
logical:: menu_loop = .true.

module_options = (/ "quadgon::area     ", "quadgon::perimeter", "trigon::area      ", "trigon::perimeter " /)

open (unit=22, file="geocalc_OUT.DAT", action="write", position="append")
10 print*, ""

print*, module_options
print*, "Enter module selection: "
read(*,*) mod_selection
print*, mod_selection
write(22,*) mod_selection

select case (mod_selection)
	case ("quadgon::area")
		print*, "Enter width and length (w, l): "
		read(*,*) quad_w, quad_l
		calc_sum = quad_area(quad_w, quad_l)
		print*, "Returns: ", calc_sum
		write(22,*) quad_w, quad_l, calc_sum
	case ("quadgon::perimeter")
		print*, "Enter width and length (w, l): "
		read(*,*) quad_w, quad_l
		calc_sum = quad_perimeter(quad_w, quad_l)
		print*, "Returns: ", calc_sum
		write(22,*) quad_w, quad_l, calc_sum
	case ("trigon::area")
		print*, "Enter base and height (b, h): "
		read(*,*) tri_base, tri_height
		calc_sum = tri_area(tri_base, tri_height)
		print*, "Returns: ", calc_sum
		write(22,*) tri_base, tri_height, calc_sum
	case ("trigon::perimeter")
		print*, "Enter sides A, B, and C (A, B, C): "
		read(*,*) tri_A, tri_B, tri_C
		calc_sum = tri_perimeter(tri_A, tri_B, tri_C)
		print*, "Returns: ", calc_sum
		write(22,*) tri_A, tri_B, tri_C, calc_sum
	case ("quit")
		menu_loop = .false.
end select

if (menu_loop .eqv. .true.) then
	GOTO 10
end if

End Program geocalc