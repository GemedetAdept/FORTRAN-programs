Program ionicradii
! Implementation of "soft" atomic radii calculations
! doi:10.1039/B410521B
use equations_module
implicit none
integer, parameter:: dp = selected_real_kind(31)

! Constant variable "k", dependant on type of compound
real(dp):: k_class
! Radii of the cation (M) and anion (X)
real(dp):: radii_M_A, radii_M_B, radii_X_A, radii_X_B
character*9:: ang = "Angstroms"

! Testing conversions between "A" and "B" radii
k_class = 5.0_dp/3.0_dp  ! k-value for "Group 1 halides"
radii_M_A = 0.752_dp  ! radii "A" of Li+

radii_M_B = cation_A_to_B(radii_M_A, k_class)
print*, "[cation_A_to_B] Expected: 1.439"
print '("k-value:", 1x, f8.5)', k_class
print '("A radii:", 1x, f6.3, 1x, a9)', radii_M_A, ang
print '("B radii:", 1x, f6.3, 1x, a9)', radii_M_B, ang
print*, ""

radii_M_B = 2.215_dp  ! radii "B" of K+
radii_M_A = cation_B_to_A(radii_M_B, k_class)
print*, "[cation_B_to_A] Expected: 1.754"
print '("k-value:", 1x, f8.5)', k_class
print '("B radii:", 1x, f6.3, 1x, a9)', radii_M_B, ang
print '("A radii:", 1x, f6.3, 1x, a9)', radii_M_A, ang

End Program ionicradii