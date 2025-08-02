CLASS zcl_prime_factors DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES integertab TYPE STANDARD TABLE OF i WITH EMPTY KEY.
    METHODS factors
      IMPORTING
        input         TYPE int8
      RETURNING
        VALUE(result) TYPE integertab.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.


CLASS zcl_prime_factors IMPLEMENTATION.
  METHOD factors.
    data(devisor) = 2.
    data(number) = input.

    while 1 < number.
    if number MOD devisor = 0.
      number = number / devisor.
      append devisor to result.
    else.
      devisor = devisor + 1.
    endif.
    endwhile.
  ENDMETHOD.


ENDCLASS.
