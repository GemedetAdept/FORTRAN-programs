MODULE pseudorand
implicit none
private

! Module to generate pseudorandom numbers via implementing known Linear Congruential Generators
public vms_rand

contains
	FUNCTION vms_rand(seed) result(vms_OUT)
		implicit none
		integer, intent(in):: seed
		integer:: vms_OUT
		integer:: modulus, multiplier, increment

		modulus = 2**32
		multiplier = 69069
		increment = 1

		vms_OUT = MOD(((multiplier*seed) + increment), modulus)
	END FUNCTION vms_rand

END MODULE