MODULE pseudorand
IMPLICIT NONE
private

! Module to generate pseudorandom numbers via implementing known Linear Congruential Generators
public vms_rand
public knuth_lewis_rand
public cc65_rand

CONTAINS
	FUNCTION vms_rand(seed) result(vms_OUT)
		IMPLICIT NONE
		integer, intent(in):: seed
		integer:: vms_OUT
		integer:: modulus, multiplier, increment

		modulus = 2**32
		multiplier = 69069
		increment = 1

		vms_OUT = MOD(((multiplier*seed) + increment), modulus)
	END FUNCTION vms_rand

	FUNCTION knuth_lewis_rand(seed) result(kl_OUT)
		IMPLICIT NONE
		integer, intent(in):: seed
		integer:: kl_OUT
		integer:: modulus, multiplier, increment

		modulus = 2**32
		multiplier = 1664525
		increment = 1013904223

		kl_OUT = MOD(((multiplier*seed) + increment), modulus)
	END FUNCTION knuth_lewis_rand

	FUNCTION cc65_rand(seed) result(cc65_OUT)
		IMPLICIT NONE
		integer, intent(in):: seed
		integer:: cc65_OUT
		integer:: modulus, multiplier, increment

		modulus = 2**32
		multiplier = 16843009
		increment = 826366247

		cc65_OUT = MOD(((multiplier*seed) + increment), modulus)	
	END FUNCTION

END MODULE