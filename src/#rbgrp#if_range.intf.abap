INTERFACE /rbgrp/if_range
  PUBLIC.
  types _range_symbol type string.
  TYPES: BEGIN OF _range,
           symbol TYPE _range_Symbol,
           descr  TYPE string,
         END OF _range,
         _ranges TYPE STANDARD TABLE OF _range WITH EMPTY KEY.

  METHODS set_ranges
    IMPORTING
      i_ranges TYPE _ranges.

  METHODS verify
    IMPORTING
      i_value         TYPE any
    RETURNING
      VALUE(r_result) TYPE _range.

  METHODS is_in_range
    IMPORTING
      i_value         TYPE any
      i_range         TYPE _range_symbol
    RETURNING
      VALUE(r_result) TYPE abap_bool.
ENDINTERFACE.
