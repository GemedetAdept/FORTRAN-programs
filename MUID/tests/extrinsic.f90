MODULE extrinsic
IMPLICIT NONE
private
public reverse
public space_to_zero

CONTAINS
	FUNCTION reverse(string_IN) result(reverse_OUT)
		IMPLICIT NONE
		character(len=*):: string_IN
		character(len=LEN(string_IN)):: reverse_OUT
		integer:: i, n, m

		n = LEN(string_IN)
		DO i=1, n, 1
			m = n-i+1
			reverse_OUT(m:m) = string_IN(i:i)
		END DO
	END FUNCTION reverse

	FUNCTION space_to_zero(string_IN) result(replaced_OUT)
		IMPLICIT NONE
		character(len=*):: string_IN
		character(len=LEN(string_IN)):: replaced_OUT
		integer:: i, n

		n = LEN(string_IN)
		DO i=1, n, 1
			IF (string_IN(i:i) .EQ. " ") THEN
				replaced_OUT(i:i) = "0"
			ELSE
				replaced_OUT(i:i) = string_IN(i:i)
			END IF
		END DO
	END FUNCTION space_to_zero

END MODULE extrinsic