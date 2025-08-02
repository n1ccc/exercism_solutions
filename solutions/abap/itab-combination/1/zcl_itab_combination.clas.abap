CLASS zcl_itab_combination DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES: BEGIN OF alphatab_type,
             cola TYPE string,
             colb TYPE string,
             colc TYPE string,
           END OF alphatab_type.
    TYPES alphas TYPE STANDARD TABLE OF alphatab_type.

    TYPES: BEGIN OF numtab_type,
             col1 TYPE string,
             col2 TYPE string,
             col3 TYPE string,
           END OF numtab_type.
    TYPES nums TYPE STANDARD TABLE OF numtab_type.

    TYPES: BEGIN OF combined_data_type,
             colx TYPE string,
             coly TYPE string,
             colz TYPE string,
           END OF combined_data_type.
    TYPES combined_data TYPE STANDARD TABLE OF combined_data_type WITH EMPTY KEY.

    METHODS perform_combination
      IMPORTING
        alphas             TYPE alphas
        nums               TYPE nums
      RETURNING
        VALUE(combined_data) TYPE combined_data.

  PROTECTED SECTION.
  PRIVATE SECTION.


ENDCLASS.

CLASS zcl_itab_combination IMPLEMENTATION.

  METHOD perform_combination.
    FIELD-SYMBOLS <fs_combined_line> TYPE combined_data_type.
    DATA numtab_line TYPE numtab_type.

    combined_data = alphas.

    LOOP AT combined_data ASSIGNING <fs_combined_line>.
      numtab_line = nums[ sy-tabix ].
      <fs_combined_line>-colx = |{ <fs_combined_line>-colx }{ numtab_line-col1 }|.
      <fs_combined_line>-coly = |{ <fs_combined_line>-coly }{ numtab_line-col2 }|.
      <fs_combined_line>-colz = |{ <fs_combined_line>-colz }{ numtab_line-col3 }|.
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
