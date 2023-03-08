Module equations
implicit none
private

public quad_perimeter
public quad_area
public tri_perimeter
public tri_area

contains
! Quadrilaterals
	function quad_perimeter(width, length)
		implicit none

		real:: quad_perimeter
		real:: width, length

		quad_perimeter = (2*width) + (2*length)
	end function quad_perimeter

	function quad_area(width, length)
		implicit none

		real:: quad_area
		real:: width, length

		quad_area = width*length
	end function quad_area

! Triangles
	function tri_perimeter(sideA, sideB, sideC)
		implicit none

		real:: sideA, sideB, sideC
		real:: tri_perimeter

		tri_perimeter = sideA + sideB + sideC
	end function tri_perimeter

	function tri_area(base, height)
		implicit none

		real:: base, height
		real:: tri_area

		tri_area = 0.5 * base * height
	end function tri_area

End Module equations