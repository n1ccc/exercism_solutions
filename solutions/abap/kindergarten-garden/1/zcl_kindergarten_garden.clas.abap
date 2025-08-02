CLASS zcl_kindergarten_garden DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS plants
      IMPORTING
        diagram        TYPE string
        student        TYPE string
      RETURNING
        VALUE(results) TYPE string_table.
METHODS get_plant
      IMPORTING
        plant         TYPE c
      RETURNING
        VALUE(result) TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA students type table of string with key table_line.

ENDCLASS.


CLASS zcl_kindergarten_garden IMPLEMENTATION.


  METHOD plants.
    data window type string_table.
    
    students = VALUE string_table( ( 'Alice' ) ( 'Bob' ) ( 'Charlie' ) ( 'David' ) ( 'Eve' ) ( 'Fred' ) ( 'Ginny' ) ( 'Harriet' ) ( 'Ileana' ) ( 'Joseph' ) ( 'Kincaid' ) ( 'Larry' ) ).

    SPLIT diagram AT '\n' INTO table window.
    data(student_index) = line_index( students[ table_line = student ] ) * 2 - 2.

    IF sy-subrc = 0.
      DO 2 TIMES.
        DATA(window_line) = sy-index.
        DO 2 TIMES.
          data(tabix) = ( student_index + sy-index - 1 ).
          data(line) = window[ window_line ].
          APPEND get_plant( conv c( line+tabix(1) ) ) TO results.
        ENDDO.
      ENDDO.
    ENDIF.
  ENDMETHOD.

method get_plant.
    CASE plant.
      WHEN 'V'.
        result = 'violets'.
      WHEN 'R'.
        result = 'radishes'.
      WHEN 'C'.
        result = 'clover'.
      WHEN 'G'.
        result = 'grass'.
    ENDCASE.
endmethod.

ENDCLASS.
