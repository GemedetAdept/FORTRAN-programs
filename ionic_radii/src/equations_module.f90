Module equations_module
implicit none
private
integer, parameter:: dp = selected_real_kind(31)
! The value here was calculated using the compute_C function
! I do not want to hard-code this value, but I'm not good enough with FORTRAN yet to do otherwise
real(dp), parameter:: c_value = 1.21228377_dp
! 1.21228377206225126734277956321594690

public cation_A_to_B
public cation_B_to_A
public anion_A_to_B
public anion_B_to_A
public compute_C
contains
	! Convert between the "A" and "B" type radii found in the paper
	Function cation_A_to_B(A_value, k_value)
		implicit none
		real(dp):: cation_A_to_B, k_value, k_inverse, A_value
		k_inverse = 1.0_dp/k_value

		cation_A_to_B = (A_value**k_value)+c_value
		cation_A_to_B = cation_A_to_B**k_inverse
	End Function cation_A_to_B

	Function cation_B_to_A(B_value, k_value)
		implicit none
		real(dp):: cation_B_to_A, k_value, k_inverse, B_value
		k_inverse = 1.0_dp/k_value

		cation_B_to_A = (B_value**k_value)-c_value
		cation_B_to_A = cation_B_to_A**k_inverse
	End Function cation_B_to_A

	Function anion_A_to_B(A_value, k_value)
		implicit none
		real(dp):: anion_A_to_B, k_value, k_inverse, A_value
		k_inverse = 1.0_dp/k_value


	End Function anion_A_to_B

	Function anion_B_to_A(B_value, k_value)
		implicit none
		real(dp):: anion_B_to_A, k_value, k_inverse, B_value
		k_inverse = 1.0_dp/k_value


	End Function anion_B_to_A

	! I have no idea why or how the paper arrived at this constant, "c"
	! It is only explained in a single paragraph, and no further
	! Although it works as described, the value itself is not plainly written
	! So, this finds it using the "A" and "B" soft radii of Li+1
	Function compute_C()
		implicit none

		real(dp):: Li_A, Li_B, k_value
		real(dp):: compute_C

		Li_A = 0.752_dp
		Li_B = 1.439_dp
		k_value = 5.0_dp/3.0_dp

		compute_C = (Li_B**k_value)-(Li_A**k_value)
	End Function compute_C

End Module equations_module