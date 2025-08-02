CLASS zcl_matrix DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES integertab TYPE STANDARD TABLE OF i WITH EMPTY KEY.
    METHODS matrix_row
      IMPORTING
        string        TYPE string
        index         TYPE i
      RETURNING
        VALUE(result) TYPE integertab.
    METHODS matrix_column
      IMPORTING
        string        TYPE string
        index         TYPE i
      RETURNING
        VALUE(result) TYPE integertab.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_matrix IMPLEMENTATION.
  METHOD matrix_row.
    data num type i.
    split string at '\n' into table data(string_table).
    split string_table[ index ] at ' ' into table data(line_table).
    loop at line_table into num.
      append num to result.
    endloop.
  ENDMETHOD.

  METHOD matrix_column.
    split string at '\n' into table data(string_table).
    do lines( string_table ) times.
        split string_table[ sy-index ] at ' ' into table data(line_table).
        append line_table[ index ] to result.
    enddo.
  ENDMETHOD.
ENDCLASS.
