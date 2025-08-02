CLASS zcl_rle DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS encode IMPORTING input         TYPE string
                   RETURNING VALUE(result) TYPE string.

    METHODS decode IMPORTING input         TYPE string
                   RETURNING VALUE(result) TYPE string.

ENDCLASS.


CLASS zcl_rle IMPLEMENTATION.

  METHOD encode.
  CHECK input IS NOT INITIAL.
    DATA(count) = 1.

    DO strlen( input ) - 1 TIMES.
      DATA(act) = sy-index - 1.
      DATA(next) = sy-index.

      IF input+act(1) = input+next(1).
        count = count + 1.
      ELSE.
        IF count > 1.
          result = |{ result }{ count }{ input+act(1) }|.
        ELSE.
          result = |{ result }{ input+act(1) }|.
        ENDIF.

        count = 1.
      ENDIF.
    ENDDO.

    IF count > 1.
      result = |{ result }{ count }{ input+next(1) }|.
    ELSE.
      result = |{ result }{ input+next(1) }|.
    ENDIF.
  ENDMETHOD.


  METHOD decode.

    DO strlen( input ) TIMES.
      DATA(act) = sy-index - 1.
      DATA number_string TYPE string.
      DATA number TYPE i.

      IF input+act(1) CA '0123456789'.
        number_string = |{ number_string }{ input+act(1) }|.
      ELSE.
        number = number_string.
        IF number IS INITIAL.
          number = 1.
        ENDIF.
        DO number TIMES.
          result = |{ result }{ input+act(1) }|.
        ENDDO.
        CLEAR: number_string.
      ENDIF.
    ENDDO.

  ENDMETHOD.

ENDCLASS.
