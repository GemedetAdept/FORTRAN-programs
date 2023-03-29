MODULE class_DtSeed
IMPLICIT NONE
private
public:: DTSeed, generate_DTSeed

TYPE DTSeed
	character*8:: seed_string
	integer:: seed_integer

END MODULE class_DtSeed