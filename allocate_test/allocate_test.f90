PROGRAM allocate_test
IMPLICIT NONE

	! https://fortran-lang.org/learn/best_practices/allocatable_arrays/
	! https://fortranwiki.org/fortran/show/allocate_coin_toss

	REAL, DIMENSION(:,:), ALLOCATABLE :: array
	REAL :: rand

	CALL RANDOM_NUMBER(rand)

	IF (rand < 0.5) THEN
		ALLOCATE(array(5,8)) ! Expected: 5 8
	ELSE
		ALLOCATE(array(7,4)) ! Expected: 7 4
	END IF

	PRINT*, SHAPE(array)

	DEALLOCATE(array)

END PROGRAM