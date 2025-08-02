CLASS zcl_acronym DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS parse IMPORTING phrase         TYPE string
                  RETURNING VALUE(acronym) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_acronym IMPLEMENTATION.
  METHOD parse.
    DATA char TYPE c.
    DATA is_acronym TYPE abap_bool.

    is_acronym = abap_true.

    DO strlen( phrase ) TIMES.
      DATA(index) = sy-index - 1.
      char = phrase+index(1).

      CASE char.
        WHEN '' OR ' ' OR '-' or '_'.
          is_acronym = abap_true.
        WHEN OTHERS.
          IF is_acronym = abap_true.
            acronym = |{ acronym }{ to_upper( char ) }|.
            is_acronym = abap_false.
          ENDIF.
      ENDCASE.
    ENDDO.
  ENDMETHOD.
ENDCLASS.
