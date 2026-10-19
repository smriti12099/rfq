CLASS lhc_Zcds_rfq_ce DEFINITION INHERITING FROM cl_abap_behavior_handler.
PUBLIC SECTION.
CLASS-DATA: gt_rfq TYPE TABLE of  ztab_rfq_h.
CLASS-DATA: gs_rfq TYPE ztab_rfq_h.
CLASS-DATA: gt_final_calc TYPE table of ztab_rfq_h.
CLASS-DATA: lv_status TYPE char3.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      keys REQUEST requested_authorizations FOR Zcds_rfq_ce RESULT result.

*    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
*      REQUEST requested_authorizations FOR Zcds_rfq_ce RESULT result.

*    METHODS create FOR MODIFY
*       entities FOR CREATE Zcds_rfq_ce.

    METHODS update FOR MODIFY
       entities FOR UPDATE Zcds_rfq_ce.
*
*    METHODS delete FOR MODIFY
*       keys FOR DELETE Zcds_rfq_ce.

    METHODS read FOR READ
       keys FOR READ Zcds_rfq_ce RESULT result.

    METHODS lock FOR LOCK
       keys FOR LOCK Zcds_rfq_ce.
    METHODS PRINT FOR MODIFY
      keys FOR ACTION Zcds_rfq_ce~PRINT RESULT result.

ENDCLASS.

CLASS lhc_Zcds_rfq_ce IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

*  METHOD get_global_authorizations.
*  ENDMETHOD.

*  METHOD create.
*  ENDMETHOD.

  METHOD update.

  lhc_zcds_rfq_ce=>lv_status = 'U'.

  READ TABLE entities INTO DATA(ls_latest) INDEX 1.

  SELECT SINGLE *
    FROM ztab_rfq_h
    WHERE rfq_number     = @ls_latest-rfq
      AND rfq_numberitem = @ls_latest-rfq_numberitem
    INTO @DATA(ls_previous).

select
rfq_item~requestforquotation as rfq,
rfq_item~requestforquotationitem as  rfq_numberitem,
rfq_item~plant,
supplier_item~material,
supplier_head~supplier,
supplier_head~paymentterms,
supplier_head~creationdate,
supplier_head~netpaymentdays,
supplier_head~IncotermsClassification,
supplier_item~supplierquotation as supplierquotation,
supplier_item~netamount,
ScheduleLine_Api01~schedulelinedeliverydate

 from I_RequestForQuotationItemTP as rfq_item
 left join I_SupplierQuotationItemTP as supplier_item on supplier_item~RequestForQuotation = rfq_item~RequestForQuotation
 and supplier_item~RequestForQuotationItem = rfq_item~RequestForQuotationItem
* left join I_SupplierQuotation_api01 as rfq_head on rfq_head~RequestForQuotation = rfq_item~RequestForQuotation
 left join I_SupplierQuotation_api01 as supplier_head on supplier_head~SupplierQuotation = supplier_item~SupplierQuotation
 left join I_SuplrQtnScheduleLine_Api01 as ScheduleLine_Api01 on supplier_head~SupplierQuotation = ScheduleLine_Api01~SupplierQuotation
 WHERE rfq_item~requestforquotation = '7000000070'
*  AND rfq_item~requestforquotationitem = '00010'
*rfq_item~requestforquotationitem in @lt_RFQ_NUMBERITEM
 into table @data(ls_prevoius_pre_data).


 READ table ls_prevoius_pre_data into data(wa_q1_price) index 1.
 READ table ls_prevoius_pre_data into data(wa_q2_price) index 2.
 READ table ls_prevoius_pre_data into data(wa_q3_price) index 3.

"------------------------------------------------------------
  " Q1 - GUARANTEE DURATION
  "------------------------------------------------------------
  IF ls_latest-%control-q1_guarantee_duration = if_abap_behv=>mk-on.
    lhc_zcds_rfq_ce=>gs_rfq-q1_guarantee_duration =
      ls_latest-q1_guarantee_duration.
  ELSE.
    lhc_zcds_rfq_ce=>gs_rfq-q1_guarantee_duration =
      ls_previous-q1_guarantee_duration.
  ENDIF.


  "------------------------------------------------------------
  " Q1 - GUARANTEE PERIOD
  "------------------------------------------------------------
  IF ls_latest-%control-q1_guarantee_period = if_abap_behv=>mk-on.
    lhc_zcds_rfq_ce=>gs_rfq-q1_guarantee_period =
      ls_latest-q1_guarantee_period.
  ELSE.
    lhc_zcds_rfq_ce=>gs_rfq-q1_guarantee_period =
      ls_previous-q1_guarantee_period.
  ENDIF.


  "------------------------------------------------------------
  " Q1 - WARRANTY DURATION
  "------------------------------------------------------------
  IF ls_latest-%control-q1_warranty_duration = if_abap_behv=>mk-on.
    lhc_zcds_rfq_ce=>gs_rfq-q1_warranty_duration =
      ls_latest-q1_warranty_duration.
  ELSE.
    lhc_zcds_rfq_ce=>gs_rfq-q1_warranty_duration =
      ls_previous-q1_warranty_duration.
  ENDIF.


  "------------------------------------------------------------
  " Q1 - WARRANTY PERIOD
  "------------------------------------------------------------
  IF ls_latest-%control-q1_warranty_period = if_abap_behv=>mk-on.
    lhc_zcds_rfq_ce=>gs_rfq-q1_warranty_period =
      ls_latest-q1_warranty_period.
  ELSE.
    lhc_zcds_rfq_ce=>gs_rfq-q1_warranty_period =
      ls_previous-q1_warranty_period.
  ENDIF.


  "------------------------------------------------------------
  " Q1 - LIQUIDATED DAMAGES MIN %
  "------------------------------------------------------------
  IF ls_latest-%control-q1_ld_min_percent = if_abap_behv=>mk-on.
    lhc_zcds_rfq_ce=>gs_rfq-q1_ld_min_percent =
      ls_latest-q1_ld_min_percent.
  ELSE.
    lhc_zcds_rfq_ce=>gs_rfq-q1_ld_min_percent =
      ls_previous-q1_ld_min_percent.
  ENDIF.


  "------------------------------------------------------------
  " Q1 - TECHNICAL RATING
  "------------------------------------------------------------
  IF ls_latest-%control-q1_technical_rating = if_abap_behv=>mk-on.
    lhc_zcds_rfq_ce=>gs_rfq-q1_technical_rating =
      ls_latest-q1_technical_rating.
  ELSE.
    lhc_zcds_rfq_ce=>gs_rfq-q1_technical_rating =
      ls_previous-q1_technical_rating.
  ENDIF.



  "============================================================
  " Q2
  "============================================================

  "------------------------------------------------------------
  " Q2 - GUARANTEE DURATION
  "------------------------------------------------------------
  IF ls_latest-%control-q2_guarantee_duration = if_abap_behv=>mk-on.
    lhc_zcds_rfq_ce=>gs_rfq-q2_guarantee_duration =
      ls_latest-q2_guarantee_duration.
  ELSE.
    lhc_zcds_rfq_ce=>gs_rfq-q2_guarantee_duration =
      ls_previous-q2_guarantee_duration.
  ENDIF.


  "------------------------------------------------------------
  " Q2 - GUARANTEE PERIOD
  "------------------------------------------------------------
  IF ls_latest-%control-q2_guarantee_period = if_abap_behv=>mk-on.
    lhc_zcds_rfq_ce=>gs_rfq-q2_guarantee_period =
      ls_latest-q2_guarantee_period.
  ELSE.
    lhc_zcds_rfq_ce=>gs_rfq-q2_guarantee_period =
      ls_previous-q2_guarantee_period.
  ENDIF.


  "------------------------------------------------------------
  " Q2 - WARRANTY DURATION
  "------------------------------------------------------------
  IF ls_latest-%control-q2_warranty_duration = if_abap_behv=>mk-on.
    lhc_zcds_rfq_ce=>gs_rfq-q2_warranty_duration =
      ls_latest-q2_warranty_duration.
  ELSE.
    lhc_zcds_rfq_ce=>gs_rfq-q2_warranty_duration =
      ls_previous-q2_warranty_duration.
  ENDIF.


  "------------------------------------------------------------
  " Q2 - WARRANTY PERIOD
  "------------------------------------------------------------
  IF ls_latest-%control-q2_warranty_period = if_abap_behv=>mk-on.
    lhc_zcds_rfq_ce=>gs_rfq-q2_warranty_period =
      ls_latest-q2_warranty_period.
  ELSE.
    lhc_zcds_rfq_ce=>gs_rfq-q2_warranty_period =
      ls_previous-q2_warranty_period.
  ENDIF.


  "------------------------------------------------------------
  " Q2 - LIQUIDATED DAMAGES MIN %
  "------------------------------------------------------------
  IF ls_latest-%control-q2_ld_min_percent = if_abap_behv=>mk-on.
    lhc_zcds_rfq_ce=>gs_rfq-q2_ld_min_percent =
      ls_latest-q2_ld_min_percent.
  ELSE.
    lhc_zcds_rfq_ce=>gs_rfq-q2_ld_min_percent =
      ls_previous-q2_ld_min_percent.
  ENDIF.


  "------------------------------------------------------------
  " Q2 - TECHNICAL RATING
  "------------------------------------------------------------
  IF ls_latest-%control-q2_technical_rating = if_abap_behv=>mk-on.
    lhc_zcds_rfq_ce=>gs_rfq-q2_technical_rating =
      ls_latest-q2_technical_rating.
  ELSE.
    lhc_zcds_rfq_ce=>gs_rfq-q2_technical_rating =
      ls_previous-q2_technical_rating.
  ENDIF.



  "============================================================
  " Q3
  "============================================================

  "------------------------------------------------------------
  " Q3 - GUARANTEE DURATION
  "------------------------------------------------------------
  IF ls_latest-%control-q3_guarantee_duration = if_abap_behv=>mk-on.
    lhc_zcds_rfq_ce=>gs_rfq-q3_guarantee_duration =
      ls_latest-q3_guarantee_duration.
  ELSE.
    lhc_zcds_rfq_ce=>gs_rfq-q3_guarantee_duration =
      ls_previous-q3_guarantee_duration.
  ENDIF.


  "------------------------------------------------------------
  " Q3 - GUARANTEE PERIOD
  "------------------------------------------------------------
  IF ls_latest-%control-q3_guarantee_period = if_abap_behv=>mk-on.
    lhc_zcds_rfq_ce=>gs_rfq-q3_guarantee_period =
      ls_latest-q3_guarantee_period.
  ELSE.
    lhc_zcds_rfq_ce=>gs_rfq-q3_guarantee_period =
      ls_previous-q3_guarantee_period.
  ENDIF.


  "------------------------------------------------------------
  " Q3 - WARRANTY DURATION
  "------------------------------------------------------------
  IF ls_latest-%control-q3_warranty_duration = if_abap_behv=>mk-on.
    lhc_zcds_rfq_ce=>gs_rfq-q3_warranty_duration =
      ls_latest-q3_warranty_duration.
  ELSE.
    lhc_zcds_rfq_ce=>gs_rfq-q3_warranty_duration =
      ls_previous-q3_warranty_duration.
  ENDIF.


  "------------------------------------------------------------
  " Q3 - WARRANTY PERIOD
  "------------------------------------------------------------
  IF ls_latest-%control-q3_warranty_period = if_abap_behv=>mk-on.
    lhc_zcds_rfq_ce=>gs_rfq-q3_warranty_period =
      ls_latest-q3_warranty_period.
  ELSE.
    lhc_zcds_rfq_ce=>gs_rfq-q3_warranty_period =
      ls_previous-q3_warranty_period.
  ENDIF.


  "------------------------------------------------------------
  " Q3 - LIQUIDATED DAMAGES MIN %
  "------------------------------------------------------------
  IF ls_latest-%control-q3_ld_min_percent = if_abap_behv=>mk-on.
    lhc_zcds_rfq_ce=>gs_rfq-q3_ld_min_percent =
      ls_latest-q3_ld_min_percent.
  ELSE.
    lhc_zcds_rfq_ce=>gs_rfq-q3_ld_min_percent =
      ls_previous-q3_ld_min_percent.
  ENDIF.


  "------------------------------------------------------------
  " Q3 - TECHNICAL RATING
  "------------------------------------------------------------
  IF ls_latest-%control-q3_technical_rating = if_abap_behv=>mk-on.
    lhc_zcds_rfq_ce=>gs_rfq-q3_technical_rating =
      ls_latest-q3_technical_rating.
  ELSE.
    lhc_zcds_rfq_ce=>gs_rfq-q3_technical_rating =
      ls_previous-q3_technical_rating.
  ENDIF.
 "------------------------------------------------------------

 "------------------------------------------------------------
  " procurement type
  "------------------------------------------------------------
  IF ls_latest-%control-procurement_type = if_abap_behv=>mk-on.
    lhc_zcds_rfq_ce=>gs_rfq-procurement_type =
      ls_latest-procurement_type.
  ELSE.
    lhc_zcds_rfq_ce=>gs_rfq-procurement_type =
      ls_previous-procurement_type.
  ENDIF.

  "------------------------------------------------------------
  " price type
  "------------------------------------------------------------
  lhc_zcds_rfq_ce=>gs_rfq-q1_price = wa_q1_price-NetAmount.
  lhc_zcds_rfq_ce=>gs_rfq-q2_price = wa_q2_price-NetAmount.
  lhc_zcds_rfq_ce=>gs_rfq-q3_price = wa_q3_price-NetAmount.

 "------------------------------------------------------------
" RFQ NUMBER
  "------------------------------------------------------------
  lhc_zcds_rfq_ce=>gs_rfq-rfq_number = ls_latest-rfq.


  "------------------------------------------------------------
  " RFQ ITEM
  "------------------------------------------------------------
  lhc_zcds_rfq_ce=>gs_rfq-rfq_numberitem = ls_latest-rfq_numberitem.


  "------------------------------------------------------------
  " APPEND
  "------------------------------------------------------------
  APPEND gs_rfq TO gt_rfq.



 DATA  : max_price TYPE zcds_rfq_ce-q1_price.
 DATA  : min_liquid_damanges TYPE zcds_rfq_ce-q1_price.

 IF sy-subrc = 0.
max_price = nmax(
             val1 =  wa_q1_price-NetAmount
             val2 = wa_q2_price-NetAmount
             val3 = wa_q3_price-NetAmount
           ).
 ENDIF.

** IF sy-subrc = 0.
**min_liquid_damanges = nmin(
**             val1 =  lhc_zcds_rfq_ce=>gs_rfq-q1_ld_min_percent
**             val2 = lhc_zcds_rfq_ce=>gs_rfq-q2_ld_min_percent
**             val3 = lhc_zcds_rfq_ce=>gs_rfq-q3_ld_min_percent
**           ).
** ENDIF.

DATA : lt_values TYPE TABLE of zcds_rfq_ce-q1_ld_min_percent.
if ( lhc_zcds_rfq_ce=>gs_rfq-q1_ld_min_percent > 0 ).
append lhc_zcds_rfq_ce=>gs_rfq-q1_ld_min_percent to lt_values.
endif.

if ( lhc_zcds_rfq_ce=>gs_rfq-q2_ld_min_percent > 0 ).
append lhc_zcds_rfq_ce=>gs_rfq-q2_ld_min_percent to lt_values.
endif.


if ( lhc_zcds_rfq_ce=>gs_rfq-q3_ld_min_percent > 0 ).
append lhc_zcds_rfq_ce=>gs_rfq-q3_ld_min_percent to lt_values.
endif.

DATA : lv_min_ld_per type zcds_rfq_ce-q1_ld_min_percent.
lv_min_ld_per = lhc_zcds_rfq_ce=>gs_rfq-q1_ld_min_percent.


LOOP at lt_values into data(ls_values).
       if ls_values < lv_min_ld_per .
         lv_min_ld_per = ls_values.
       endif.
endloop.

loop at gt_rfq into data(gs_final_calc).

* for price
 if max_price is not initial and gs_final_calc-q1_price is not initial.
  gs_final_calc-q1_score_price = ( ( max_price / gs_final_calc-q1_price ) * 100 ).
 endif.
  if max_price is not initial and gs_final_calc-q2_price is not initial.
  gs_final_calc-q2_score_price = ( ( max_price / gs_final_calc-q2_price ) * 100 ).
 endif.
  if max_price is not initial and gs_final_calc-q3_price is not initial.
  gs_final_calc-q3_score_price = ( ( max_price / gs_final_calc-q3_price ) * 100 ).
 endif.

* for minimum lq damangess


if lv_min_ld_per is not initial and gs_final_calc-q1_ld_min_percent is not initial.
  gs_final_calc-q1_ld_min_score = ( ( lv_min_ld_per / gs_final_calc-q1_ld_min_percent ) * 100 ).
 endif.
  if lv_min_ld_per is not initial and gs_final_calc-q2_ld_min_percent is not initial.
  gs_final_calc-q2_ld_min_score = ( ( lv_min_ld_per / gs_final_calc-q2_ld_min_percent ) * 100 ).
 endif.
  if lv_min_ld_per is not initial and gs_final_calc-q3_ld_min_percent is not initial.
  gs_final_calc-q3_ld_min_score = ( ( lv_min_ld_per / gs_final_calc-q3_ld_min_percent ) * 100 ).
 endif.




 gs_final_calc-q1_total_score = gs_final_calc-q1_score_price + gs_final_calc-q1_ld_min_score.
gs_final_calc-q2_total_score = gs_final_calc-q2_score_price + gs_final_calc-q2_ld_min_score.
gs_final_calc-q3_total_score = gs_final_calc-q3_score_price + gs_final_calc-q3_ld_min_score.

 modify gt_rfq from gs_final_calc.
  endloop.




ENDMETHOD.

*  METHOD delete.
*  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD lock.
  ENDMETHOD.

  METHOD PRINT.

  ENDMETHOD.

ENDCLASS.

CLASS lsc_ZCDS_RFQ_CE DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_ZCDS_RFQ_CE IMPLEMENTATION.

  METHOD finalize.
  ENDMETHOD.

  METHOD check_before_save.
  ENDMETHOD.

  METHOD save.

.

 if lhc_Zcds_rfq_ce=>lv_status = 'U'.
  MODIFY ztab_rfq_h from table @lhc_Zcds_rfq_ce=>gt_rfq.


  ENDIF.
  ENDMETHOD.

  METHOD cleanup.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
