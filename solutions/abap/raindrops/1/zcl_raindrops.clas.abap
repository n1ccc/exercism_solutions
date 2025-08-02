CLASS zcl_raindrops DEFINITION PUBLIC.
  PUBLIC SECTION.
    METHODS raindrops
      IMPORTING
        input         TYPE i
      RETURNING
        VALUE(result) TYPE string.
ENDCLASS.

CLASS zcl_raindrops IMPLEMENTATION.

  METHOD raindrops.
    if input MOD 3 = 0.
      result = |{ result }Pling|.
    endif.
    if input MOD 5 = 0.
      result = |{ result }Plang|.
    endif.
    if input MOD 7 = 0.
      result = |{ result }Plong|.
    endif.
    if input MOD 3 <> 0 and input MOD 5 <> 0 and input MOD 7 <> 0.
        result = input.
    endif.
  ENDMETHOD.

ENDCLASS.
