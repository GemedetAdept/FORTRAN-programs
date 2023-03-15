MODULE pseudorand
IMPLICIT NONE
private
public vms_rand
public cc65_rand
public msv_rand

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

	FUNCTION cc65_rand(seed_IN) result(cc65_OUT)
		IMPLICIT NONE
		integer:: seed_IN, cc65_OUT
		integer:: modulus, multiplier, increment

		modulus = 2**23
		multiplier = 65793
		increment = 4282663

		cc65_OUT = MOD(((multiplier*seed_IN) + increment), modulus)
	END FUNCTION cc65_rand

	FUNCTION msv_rand(seed_IN) result(msv_OUT)
		IMPLICIT NONE
		integer:: seed_IN, msv_OUT
		integer:: modulus, multiplier, increment

		modulus = 2**32
		multiplier = 214013
		increment = 2531011

		msv_OUT = MOD(((multiplier*seed_IN) + increment), modulus)
	END FUNCTION msv_rand	

END MODULE pseudorand