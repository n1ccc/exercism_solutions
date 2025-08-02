CLASS zcl_collatz_conjecture DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS ret_steps IMPORTING num          TYPE i
                      RETURNING VALUE(steps) TYPE i
                      RAISING   cx_parameter_invalid.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_collatz_conjecture IMPLEMENTATION.
  METHOD ret_steps.
    if num <= 0.
      raise exception type cx_parameter_invalid.
    endif.
    data(calc_num) = num.
    while 1 < calc_num.
      steps = steps + 1.
      if calc_num MOD 2 = 0.
        calc_num = calc_num / 2.
      else.
        calc_num = ( calc_num * 3 ) + 1.
      endif.
    endwhile.
  ENDMETHOD.
ENDCLASS.
