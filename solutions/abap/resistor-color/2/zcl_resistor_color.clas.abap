CLASS zcl_resistor_color DEFINITION PUBLIC CREATE PUBLIC.
  PUBLIC SECTION.
    METHODS resistor_color
      IMPORTING
        color_code   TYPE string
      RETURNING
        VALUE(value) TYPE i.
ENDCLASS.

CLASS zcl_resistor_color IMPLEMENTATION.

  METHOD resistor_color.
    data color_list type table of string with key table_line.
    color_list = value #( ( 'black' ) ( 'brown' ) ( 'red' ) ( 'orange' ) ( 'yellow' ) 
                          ( 'green' ) ( 'blue' ) ( 'violet' ) ( 'grey' ) ( 'white' ) ).
    read table color_list with table key table_line = color_code transporting no fields.
    value = sy-tabix - 1.
  ENDMETHOD.

ENDCLASS.
