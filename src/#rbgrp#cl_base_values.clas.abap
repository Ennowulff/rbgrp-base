CLASS /rbgrp/cl_base_values DEFINITION
  PUBLIC
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES /rbgrp/if_base_values.

  PROTECTED SECTION.
    DATA bedingungswerte   TYPE /rbgrp/if_base_values=>_bedingungswerte.
    DATA aktionsergebnisse TYPE /rbgrp/if_base_values=>_aktionsergebnisse.
    DATA trace_info        TYPE /rbgrp/if_base_values=>_trace.

  PRIVATE SECTION.
ENDCLASS.


CLASS /rbgrp/cl_base_values IMPLEMENTATION.
  METHOD /rbgrp/if_base_values~dotrace.
    trace_info = VALUE #( name            = trace_info-name
                          used_rule       = iv_rule
                          number_of_rules = trace_info-number_of_rules
                          version         = trace_info-version ).
  ENDMETHOD.

  METHOD /rbgrp/if_base_values~get_aktionsergebnis.
    IF line_exists( aktionsergebnisse[ aktion = aktion ] ).
      wert = aktionsergebnisse[ aktion = aktion ]-wert.
    ELSE.
      wert = /rbgrp/if_base_values=>c_wert_ungueltig.
    ENDIF.
  ENDMETHOD.

  METHOD /rbgrp/if_base_values~get_bedingungswert.
    IF line_exists( bedingungswerte[ bedingung = bedingung ] ).
      wert = bedingungswerte[ bedingung = bedingung ]-wert.
    ELSE.
      wert = /rbgrp/if_base_values=>c_wert_ungueltig.
    ENDIF.
  ENDMETHOD.

  METHOD /rbgrp/if_base_values~get_trace.
    trace = trace_info.
  ENDMETHOD.

  METHOD /rbgrp/if_base_values~inittrace.
    trace_info-name            = name.
    trace_info-number_of_rules = number_of_rules.
    trace_info-version         = version.
  ENDMETHOD.

  METHOD /rbgrp/if_base_values~set_aktionsergebnis.
    IF line_exists( aktionsergebnisse[ aktion = aktion ] ).
      aktionsergebnisse[ aktion = aktion ]-wert = wert.
    ELSE.
      INSERT VALUE #(  aktion = aktion wert = wert ) INTO TABLE aktionsergebnisse.
    ENDIF.
  ENDMETHOD.

  METHOD /rbgrp/if_base_values~set_bedingungswert.
    IF line_exists( bedingungswerte[ bedingung = bedingung ] ).
      bedingungswerte[ bedingung = bedingung ]-wert = wert.
    ELSE.
      INSERT VALUE #(  bedingung = bedingung wert = wert ) INTO TABLE bedingungswerte.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
