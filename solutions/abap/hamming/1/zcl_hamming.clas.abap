CLASS zcl_hamming DEFINITION PUBLIC.
  PUBLIC SECTION.
    METHODS hamming_distance
      IMPORTING
        first_strand  TYPE string
        second_strand TYPE string
      RETURNING
        VALUE(result) TYPE i
      RAISING
        cx_parameter_invalid.
ENDCLASS.

CLASS zcl_hamming IMPLEMENTATION.

  METHOD hamming_distance.
IF strlen( first_strand ) = strlen( second_strand ).

      DO strlen( first_strand ) TIMES.
      data(i) = sy-index - 1.
        IF first_strand+i(1) <> second_strand+i(1).
          result = result + 1.
        ENDIF.
      ENDDO.
    ELSE.
      RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
