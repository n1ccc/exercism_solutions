CLASS zcl_isogram DEFINITION PUBLIC.

  PUBLIC SECTION.
    METHODS is_isogram
      IMPORTING
        VALUE(phrase)        TYPE string
      RETURNING
        VALUE(result) TYPE abap_bool.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_isogram IMPLEMENTATION.

  METHOD is_isogram.
    result = abap_true.
    do strlen( phrase ) times.
      data(index) = sy-index - 1.
      if count( val = to_lower( phrase ) sub = to_lower( phrase+index(1) ) ) > 1.
        if to_lower( phrase+index(1) ) CO 'abcdefghijklmnopqrstuvwxyz'.
          result = abap_false.
          exit.
        endif.
      endif.
    enddo.
  ENDMETHOD.

ENDCLASS.
