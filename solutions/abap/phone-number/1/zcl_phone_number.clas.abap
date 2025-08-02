CLASS zcl_phone_number DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS clean
      IMPORTING
        !number       TYPE string
      RETURNING
        VALUE(result) TYPE string
      RAISING
        cx_parameter_invalid.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_phone_number IMPLEMENTATION.
  METHOD clean.
    result = number.
    CONDENSE result NO-GAPS.

    REPLACE ALL OCCURRENCES OF '(' IN result WITH ''.
    REPLACE ALL OCCURRENCES OF ')' IN result WITH ''.
    REPLACE ALL OCCURRENCES OF '-' IN result WITH ''.
    REPLACE ALL OCCURRENCES OF '.' IN result WITH ''.
    REPLACE ALL OCCURRENCES OF '+' IN result WITH ''.

    DATA(lv_regex) = '^(1|)[2-9]\d{2}[2-9]\d{6}$'.
    FIND REGEX lv_regex IN result.

    IF sy-subrc <> 0.
      RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.

    if result(1) = '1'.
      result = result+1.
    endif.

  ENDMETHOD.
ENDCLASS.
