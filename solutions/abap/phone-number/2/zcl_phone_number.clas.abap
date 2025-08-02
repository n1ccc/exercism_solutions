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
    REPLACE ALL OCCURRENCES OF REGEX '[(]|[)]|[-]|[.]|[+]|[ ]' IN result WITH ''.
    FIND REGEX '^(1|)[2-9]\d{2}[2-9]\d{6}$' IN result.
    IF sy-subrc <> 0.
      RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.
    REPLACE ALL OCCURRENCES OF REGEX '^[1]' IN result WITH ''.
  ENDMETHOD.
ENDCLASS.