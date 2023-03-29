MODULE pseudorand
IMPLICIT NONE
private
public vms_rand

CONTAINS
	FUNCTION vms_rand(seed_IN) result(vms_OUT)
		IMPLICIT NONE
		integer:: seed_IN, vms_OUT
		integer:: modulus, multiplier, increment

		modulus = 2**32
		multiplier = 69069
		increment = 1

		vms_OUT = MOD(((multiplier*seed_IN) + increment), modulus)
	END FUNCTION vms_rand

END MODULE pseudorand