CLASS zcl_reverse_string DEFINITION PUBLIC.
  PUBLIC SECTION.
    METHODS reverse_string
      IMPORTING
        input         TYPE string
      RETURNING
        VALUE(result) TYPE string.
ENDCLASS.

CLASS zcl_reverse_string IMPLEMENTATION.

  METHOD reverse_string.
    " Please complete the implementation of the reverse_string method
    do strlen( input ) times.
      data(index) = sy-index - 1.
      result = |{ input+index(1) }{ result }|.
    enddo.
  ENDMETHOD.

ENDCLASS.
