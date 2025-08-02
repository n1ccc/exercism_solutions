CLASS zcl_clock DEFINITION
  PUBLIC
  CREATE PUBLIC.

  PUBLIC SECTION.

    METHODS constructor
      IMPORTING
        !hours   TYPE i
        !minutes TYPE i DEFAULT 0.
    METHODS get
      RETURNING
        VALUE(result) TYPE string.
    METHODS add
      IMPORTING
        !minutes TYPE i.
    METHODS sub
      IMPORTING
        !minutes TYPE i.
    METHODS convert_hr
      RETURNING VALUE(result) TYPE i.
    METHODS convert_min
      RETURNING VALUE(result) TYPE i.
    METHODS fill_zero
      IMPORTING number        TYPE i
      RETURNING VALUE(result) TYPE string.

  PRIVATE SECTION.
data min type i.
ENDCLASS.



CLASS zcl_clock IMPLEMENTATION.

  METHOD add.
    min = min + minutes.
  ENDMETHOD.


  METHOD constructor.
    add( minutes + ( hours * 60 ) ).
  ENDMETHOD.


  METHOD get.
    result = |{ fill_zero( convert_hr( ) ) }:{ fill_zero( convert_min( ) ) }|.
  ENDMETHOD.


  METHOD sub.
    min = min - minutes.
  ENDMETHOD.
METHOD convert_hr.
    result = min DIV 60.
    result = result MOD 24.
  ENDMETHOD.

  METHOD convert_min.
    result = min MOD 60.
  ENDMETHOD.

  METHOD fill_zero.
    IF number < 10.
      result = |0{ number }|.
    ELSE.
      result = |{ number }|.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
