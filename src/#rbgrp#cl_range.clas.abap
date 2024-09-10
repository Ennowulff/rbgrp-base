CLASS /rbgrp/cl_range DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES /rbgrp/if_range.
    ALIASES is_in_range FOR /rbgrp/if_range~is_in_range.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA ranges TYPE /rbgrp/if_range=>_ranges.
ENDCLASS.



CLASS /rbgrp/cl_range IMPLEMENTATION.
  METHOD /rbgrp/if_range~verify.

    LOOP AT ranges INTO DATA(range).
      IF is_in_range( i_range = range-symbol i_value = i_value ).
        r_result = range.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD /rbgrp/if_range~set_ranges.
    ranges = i_ranges.
  ENDMETHOD.

  METHOD /rbgrp/if_range~is_in_range.

    "prüfen, ob Wert in Range ist
    "1: < 8    =>>  [♾️:8[
    "2: <= 20  =>>  [8 : 20]
    "3: > 20   =>>  ]20:♾️


  ENDMETHOD.

ENDCLASS.
