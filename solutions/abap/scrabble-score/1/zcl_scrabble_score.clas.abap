CLASS zcl_scrabble_score DEFINITION PUBLIC .

  PUBLIC SECTION.
    METHODS score
      IMPORTING
        input         TYPE string OPTIONAL
      RETURNING
        VALUE(result) TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.


CLASS zcl_scrabble_score IMPLEMENTATION.
  METHOD score.
    DATA(length) = strlen( input ).
    DO length TIMES.
      DATA(index) = sy-index - 1.
      DATA(abc) = input+index(1).
      TRANSLATE abc TO UPPER CASE.
      CASE abc.
        WHEN 'A' OR 'E' OR 'I' OR 'O' OR 'U' OR 'U' OR 'L' OR 'N' OR 'R' OR 'S' OR 'T'.
          result = result + 1.
        WHEN 'D' OR 'G'.
          result = result + 2.
        WHEN 'B' OR 'C' OR 'M' OR 'P'.
          result = result + 3.
        WHEN 'F' OR 'H' OR 'V' OR 'W' OR 'Y'.
          result = result + 4.
        WHEN 'K'.
          result = result + 5.
        WHEN 'J' OR 'X'.
          result = result + 8.
        WHEN 'Q' OR 'Z'.
          result = result + 10.
      ENDCASE.
    ENDDO.
  ENDMETHOD.

ENDCLASS.
