MODULE class_MUID
IMPLICIT NONE
private
public:: MUID, MUID_print

TYPE MUID
	character*6:: location_code

	character*8:: hexblock_1
	character*4:: hexblock_2, hexblock_3, hexblock_4
	character*12:: location_hex
	
	character*32:: hex_string

END TYPE MUID

END MODULE class_MUID