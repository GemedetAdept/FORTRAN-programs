MODULE extrinsic
IMPLICIT NONE
private
public reverse
public space_to_zero
public get_time_string
public get_seed_integer
public int_to_hex16
public string_to_hex
public concat_string_array
public insert_MUID_dashes

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

	FUNCTION get_time_string(time_array_IN) result(time_string_OUT)
		IMPLICIT NONE
		character*2, dimension(4):: time_array_IN
		character*8:: time_string_OUT
		character*2:: char_holder
		integer:: i, n

		n = 4
		DO i=1, 4, 1
			char_holder = time_array_IN(i)
			WRITE(char_holder, '(A2)') space_to_zero(char_holder)
			time_array_IN(i) = char_holder
		END DO

		time_string_OUT(1:2) = time_array_IN(1)
		time_string_OUT(3:4) = time_array_IN(2)
		time_string_OUT(5:6) = time_array_IN(3)
		time_string_OUT(7:8) = time_array_IN(4)
	END FUNCTION

	FUNCTION get_seed_integer(seed_string_IN) result(seed_int_OUT)
		IMPLICIT NONE
		character*8:: seed_string_IN, clean_seed
		integer:: seed_int_OUT, stat

		clean_seed = reverse(seed_string_IN)
		clean_seed = TRIM(clean_seed)

		READ(clean_seed,*,iostat=stat) seed_int_OUT
	END FUNCTION

	FUNCTION int_to_hex16(integer_IN) result(hex_16_OUT)
		IMPLICIT NONE
		integer:: integer_IN
		character*4:: hex_16_OUT
		character*10:: hex_40

		WRITE(hex_40, '(Z10)') integer_IN
		hex_40 = ADJUSTL(hex_40)
		hex_16_OUT = hex_40(1:4)
	END FUNCTION

	FUNCTION string_to_hex(string_IN) result(hex_OUT)
		IMPLICIT NONE
		character(len=*):: string_IN
		character*2, dimension(LEN(string_IN)):: hex_array
		character(len=(LEN(string_IN)*2)):: hex_OUT
		integer:: i

		DO i=1, LEN(string_IN), 1
			WRITE(hex_array(i), '(Z2)') string_IN(i:i)
		END DO

		hex_OUT(1:2) = hex_array(1)
		hex_OUT(3:4) = hex_array(2)
		hex_OUT(5:6) = hex_array(3)
		hex_OUT(7:8) = hex_array(4)
		hex_OUT(9:10) = hex_array(5)
		hex_OUT(11:12) = hex_array(6)
	END FUNCTION

	FUNCTION concat_string_array(array_IN) result(string_OUT)
		IMPLICIT NONE
		character*4, dimension(5):: array_IN
		character*20:: string_OUT

		string_OUT(1:4) = array_IN(1)
		string_OUT(5:8) = array_IN(2)
		string_OUT(9:12) = array_IN(3)
		string_OUT(13:16) = array_IN(4)
		string_OUT(17:20) = array_IN(5)
	END FUNCTION

	FUNCTION insert_MUID_dashes(MUID_IN) result(MUID_OUT)
		IMPLICIT NONE
		character*32:: MUID_IN
		character*36:: MUID_OUT
		
		MUID_OUT(1:8) = MUID_IN(1:8)
		MUID_OUT(9:9) = "-"
		MUID_OUT(10:13) = MUID_IN(9:12)
		MUID_OUT(14:14) = "-"
		MUID_OUT(15:18) = MUID_IN(13:16)
		MUID_OUT(19:19) = "-"
		MUID_OUT(20:23) = MUID_IN(17:20)
		MUID_OUT(24:24) = "-"
		MUID_OUT(25:36) = MUID_IN(21:32)
	END FUNCTION

END MODULE extrinsic