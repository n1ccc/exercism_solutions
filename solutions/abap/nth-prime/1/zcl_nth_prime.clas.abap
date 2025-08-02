CLASS zcl_nth_prime DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS prime
      IMPORTING
        input         TYPE i
      RETURNING
        VALUE(result) TYPE i
      RAISING
        cx_parameter_invalid.
  PROTECTED SECTION.
  PRIVATE SECTION.
data primes type table of i.
ENDCLASS.


CLASS zcl_nth_prime IMPLEMENTATION.
  METHOD prime.
    IF input < 1.
      RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.

    DATA(number) = 2.

    WHILE lines( primes ) < input.
      DATA(div) = 2.
      DATA(is_prime) = abap_true.

      WHILE div < number.
        IF number MOD div = 0.
          is_prime = abap_false.
          EXIT.
        ENDIF.
        div = div + 1.
      ENDWHILE.

      IF is_prime = abap_true.
        APPEND number TO primes.
        result = number.
      ENDIF.

      number = number + 1.
    ENDWHILE.
  ENDMETHOD.


ENDCLASS.
