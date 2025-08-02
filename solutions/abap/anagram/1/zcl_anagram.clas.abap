CLASS zcl_anagram DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS anagram
      IMPORTING
        input         TYPE string
        candidates    TYPE string_table
      RETURNING
        VALUE(result) TYPE string_table.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_anagram IMPLEMENTATION.
  METHOD anagram.
    DATA candidate TYPE string.
    DATA candidate_string TYPE string.
    DATA input_string TYPE string.
    DATA is_anagram TYPE abap_bool.

    LOOP AT candidates INTO candidate.
      is_anagram = abap_true.
      candidate_string = to_lower( candidate ).
      input_string = to_lower( input ).

      IF candidate_string <> input_string AND strlen( candidate_string ) = strlen( input_string ).
        DO strlen( candidate_string ) TIMES.
          DATA(index) = sy-index - 1.
          DATA(count_candidate) = count( val = candidate_string sub = candidate_string+index(1) ).
          DATA(count_input) = count( val = input_string sub = candidate_string+index(1) ).

          IF count_candidate <> count_input.
            is_anagram = abap_false.
          ENDIF.
        ENDDO.

        IF is_anagram = abap_true.
          APPEND candidate TO result.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
