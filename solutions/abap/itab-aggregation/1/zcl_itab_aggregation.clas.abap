CLASS zcl_itab_aggregation DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES group TYPE c LENGTH 1.
    TYPES: BEGIN OF initial_numbers_type,
             group  TYPE group,
             number TYPE i,
           END OF initial_numbers_type,
           initial_numbers TYPE STANDARD TABLE OF initial_numbers_type WITH EMPTY KEY.

    TYPES: BEGIN OF aggregated_data_type,
             group   TYPE group,
             count   TYPE i,
             sum     TYPE i,
             min     TYPE i,
             max     TYPE i,
             average TYPE f,
           END OF aggregated_data_type,
           aggregated_data TYPE STANDARD TABLE OF aggregated_data_type WITH EMPTY KEY.

    METHODS perform_aggregation
      IMPORTING
        initial_numbers        TYPE initial_numbers
      RETURNING
        VALUE(aggregated_data) TYPE aggregated_data.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_itab_aggregation IMPLEMENTATION.
  METHOD perform_aggregation.
    DATA aggregated_line TYPE aggregated_data_type.

    LOOP AT initial_numbers REFERENCE INTO DATA(wa)
        GROUP BY ( group = wa->group )
        REFERENCE INTO DATA(groupdata).

      CLEAR: aggregated_line.
      aggregated_line-group = groupdata->group.
      LOOP AT GROUP groupdata REFERENCE INTO DATA(member).
        aggregated_line-count = aggregated_line-count + 1.
        aggregated_line-sum = aggregated_line-sum + member->number.

        IF aggregated_line-max < member->number.
          aggregated_line-max = member->number.
        ENDIF.

        IF member->number < aggregated_line-min OR aggregated_line-min IS INITIAL.
          aggregated_line-min = member->number.
        ENDIF.

      ENDLOOP.
      TRY.
          aggregated_line-average = aggregated_line-sum / aggregated_line-count.
        CATCH cx_sy_zerodivide.
          aggregated_line-average = 0.
      ENDTRY.
      APPEND aggregated_line TO aggregated_data.
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
