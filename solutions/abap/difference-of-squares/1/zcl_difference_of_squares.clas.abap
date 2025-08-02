CLASS zcl_difference_of_squares DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS:
      ret_difference_of_squares IMPORTING num         TYPE i
                                RETURNING VALUE(diff) TYPE i,
      ret_sum_of_squares        IMPORTING num                   TYPE i
                                RETURNING VALUE(sum_of_squares) TYPE i,
      ret_square_of_sum         IMPORTING num                  TYPE i
                                RETURNING VALUE(square_of_sum) TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_difference_of_squares IMPLEMENTATION.
  METHOD ret_difference_of_squares.
    diff = ret_square_of_sum( num ) - ret_sum_of_squares( num ).
  ENDMETHOD.

  METHOD ret_sum_of_squares.
    do num times.
      sum_of_squares = sum_of_squares + ipow( base = ( sy-index ) exp = 2 ) .
    enddo.
  ENDMETHOD.

  METHOD ret_square_of_sum.
    do num times.
      square_of_sum = square_of_sum + ( sy-index ).
    enddo.
      square_of_sum = ipow( base = square_of_sum exp = 2 ).
  ENDMETHOD.
ENDCLASS.
