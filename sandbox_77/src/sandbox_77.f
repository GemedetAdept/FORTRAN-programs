      MODULE VOWELTYPE
      IMPLICIT NONE
        CONTAINS
          TYPE:: VOWEL
            CHARACTER*2:: char_val
          END TYPE VOWEL
      END MODULE VOWELTYPE

      PROGRAM VOWELS
      USE VOWELTYPE
      IMPLICIT NONE

        TYPE(VOWEL):: valid_vowel1
        TYPE(VOWEL):: valid_vowel2

        WRITE(*,*) TYPE(valid_vowel1)

      STOP 0
      END