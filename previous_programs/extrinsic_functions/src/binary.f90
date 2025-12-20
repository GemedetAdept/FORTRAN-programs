MODULE binary
implicit none
private

public int_to_binary
public byte_to_int
contains
	FUNCTION int_to_binary(int_I) result(binary_O)
		implicit none
		integer, intent(in):: int_I
		integer:: binary_O(32)
		integer:: k,j

		binary_O = 0
		j = int_I

		Do k=1, SIZE(binary_O)
			binary_O(k) = MOD(j, 2)
			j = j/2
		End Do
	END FUNCTION int_to_binary

	FUNCTION byte_to_int(byte_I) result(int_O)
		implicit none
		character*8:: byte_I
		integer:: int_O
		integer:: i

		int_O = 0

		DO i=0, 8, 1
			IF (byte_I(8-i:8-i) .EQ. "1") THEN
				int_O = int_O + 2**i
			ELSE
				int_O = int_O
			END IF
		END DO

	END FUNCTION byte_to_int

END MODULE binary