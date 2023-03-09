Module binary
implicit none
private

public int_to_binary
contains
	Function int_to_binary(int_I) result(binary_O)
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
	End Function int_to_binary

	Function byte_to_int(byte_I) result(int_O)
		implicit none
		character*8, intent(in):: byte_I
		integer:: int_O

	End Function byte_to_int

End Module binary