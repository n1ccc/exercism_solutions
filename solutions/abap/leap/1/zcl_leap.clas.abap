CLASS zcl_leap DEFINITION PUBLIC.
  PUBLIC SECTION.
    METHODS leap
      IMPORTING
        year          TYPE i
      RETURNING
        VALUE(result) TYPE abap_bool.
ENDCLASS.

CLASS zcl_leap IMPLEMENTATION.

  METHOD leap.
    if year MOD 4 = 0.
    result = abap_true.
    endif.
    
    if year MOD 100 = 0.
    result = abap_false.
    endif.
    
    if year MOD 400 = 0.
    result = abap_true.
    endif.
  ENDMETHOD.

ENDCLASS.
