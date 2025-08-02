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
    case color_code.
    when 'black'.
    value = 0.
    when 'brown'.
    value = 1.
    when 'red'.
    value = 2.
    when 'orange'.
    value = 3.
    when 'yellow'.
    value = 4.
    when 'green'.
    value = 5.
    when 'blue'.
    value = 6.
    when 'violet'.
    value = 7.
    when 'grey'.
    value = 8.
    when 'white'.
    value = 9.
    endcase.
  ENDMETHOD.

ENDCLASS.
