INTERFACE /rbgrp/if_base_values
  PUBLIC.


  TYPES _bedingung TYPE string.
  TYPES _wert      TYPE string.
  TYPES _aktion    TYPE string.
  TYPES:
    BEGIN OF _trace,
      name            TYPE string,
      used_rule       TYPE string,
      number_of_rules TYPE string,
      version         TYPE string,
    END OF _trace.
  TYPES:
    BEGIN OF _bedingungswert,
      bedingung TYPE _bedingung,
      wert      TYPE _wert,
    END OF _bedingungswert.
  TYPES _bedingungswerte TYPE SORTED TABLE OF _bedingungswert WITH UNIQUE KEY bedingung.
  TYPES:
    BEGIN OF _aktionsergebnis,
      aktion TYPE _aktion,
      wert   TYPE _wert,
    END OF _aktionsergebnis.
  TYPES _aktionsergebnisse TYPE SORTED TABLE OF _aktionsergebnis WITH UNIQUE KEY aktion.

  CONSTANTS c_wert_ungueltig TYPE _wert VALUE '###' ##NO_TEXT.

  METHODS inittrace
    IMPORTING
      name            TYPE csequence
      number_of_rules TYPE csequence
      version         TYPE csequence.

  METHODS dotrace
    IMPORTING
      iv_rule TYPE csequence.

  METHODS get_trace
    RETURNING
      VALUE(trace) TYPE _trace.

  METHODS set_bedingungswert
    IMPORTING
      bedingung TYPE _bedingung
      wert      TYPE any.

  METHODS get_bedingungswert
    IMPORTING
      bedingung   TYPE _bedingung
    RETURNING
      VALUE(wert) TYPE _wert.

  METHODS set_aktionsergebnis
    IMPORTING
      aktion TYPE _aktion
      wert   TYPE any.

  METHODS get_aktionsergebnis
    IMPORTING
      aktion      TYPE _aktion
    RETURNING
      VALUE(wert) TYPE _wert.
ENDINTERFACE.
