CLASS zcl_rfq_Ce DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.
  PUBLIC SECTION.
    INTERFACES if_rap_query_provider.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_RFQ_CE IMPLEMENTATION.


  METHOD if_rap_query_provider~select.
    IF io_request->is_data_requested( ).
      DATA:
        lt_response    TYPE TABLE OF zcds_rfq_Ce,
        lt_responseout TYPE TABLE OF zcds_rfq_Ce,
        lt_result      TYPE TABLE OF zcds_rfq_Ce,
        ls_result      TYPE zcds_rfq_Ce,
        lv_index       TYPE string.
      DATA(lv_top)           = io_request->get_paging( )->get_page_size( ).
      DATA(lv_skip)          = io_request->get_paging( )->get_offset( ).
      DATA(lv_max_rows) = COND #( WHEN lv_top = if_rap_query_paging=>page_size_unlimited THEN 0
                                  ELSE lv_top ).
      "  DATA(lt_clause)        = io_request->get_filter( )->get_as_ranges( ).
      DATA(lt_parameter)     = io_request->get_parameters( ).
      DATA(lt_fields)        = io_request->get_requested_elements( ).
      DATA(lt_sort)          = io_request->get_sort_elements( ).
      TRY.
          DATA(lt_filter_cond) = io_request->get_filter( )->get_as_ranges( ).
        CATCH cx_rap_query_filter_no_range INTO DATA(lx_no_sel_option).
          CLEAR lt_filter_cond. " Fallback to empty filter list if no ranges are provided
      ENDTRY.
        LOOP AT lt_filter_cond INTO DATA(ls_filter_cond).

        IF ls_filter_cond-name = 'RFQ'.
          DATA(lt_RFQ) = ls_filter_cond-range[].

        ELSEIF ls_filter_cond-name = 'RFQ_NUMBERITEM'.
          DATA(lt_RFQ_NUMBERITEM) = ls_filter_cond-range[].

         ENDIF.
      ENDLOOP.

DATA:
  lt_rfq_persist TYPE TABLE OF ztab_rfq_h,
  ls_rfq_persist TYPE ztab_rfq_h.

     select
rfq_item~requestforquotation as rfq,
rfq_head~creationdate as rfq_date,
rfq_item~requestforquotationitem as  rfq_numberitem,
rfq_item~material,
rfq_item~plant,
rfq_table~procurement_type,


rfq_table~q1_guarantee_duration,
rfq_table~q1_warranty_duration,
rfq_table~q1_guarantee_PERIOD,
rfq_table~q1_warranty_PERIOD,

rfq_table~q2_guarantee_duration,
rfq_table~q2_warranty_duration,
rfq_table~q2_guarantee_PERIOD,
rfq_table~q2_warranty_PERIOD,

rfq_table~q3_guarantee_duration,
rfq_table~q3_warranty_duration,
rfq_table~q3_guarantee_PERIOD,
rfq_table~q3_warranty_PERIOD

from I_RequestForQuotationItemTP as rfq_item
 left join I_RequestForQuotation_api01 as rfq_head on rfq_head~RequestForQuotation = rfq_item~RequestForQuotation
 left join ztab_rfq_h as rfq_table on rfq_table~Rfq_number = rfq_item~RequestForQuotation and rfq_table~Rfq_numberitem = rfq_item~RequestForQuotationitem
where rfq_item~requestforquotation = '7000000070'
*AND rfq_item~requestforquotationitem = '00010'
 into CORRESPONDING FIELDS OF  table @lt_result.

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
 into table @data(lt_result1).






DATA : lv_index1 type char1.
lv_index1 = 0.

LOOP at lt_result into data(wa_result).
  LOOP AT lt_result1 into data(wa_result1).
   if wa_result-rfq = wa_result1-rfq and wa_result-rfq_numberitem = wa_result1-rfq_numberitem.
   lv_index1 = 1 + lv_index1.
    if lv_index1 = 1.
       wa_result-q1_supplier = wa_result1-Supplier.
        wa_result-q1_price = wa_result1-NetAmount.
         wa_result-q1_payment_terms = wa_result1-PaymentTerms.
          wa_result-q1_inco_terms = wa_result1-IncotermsClassification.
             wa_result-q1_quotation_date = wa_result1-creationdate.
             wa_result-q1_delivery_date = wa_result1-ScheduleLineDeliveryDate.
    endif.

  if lv_index1 = 2.
       wa_result-q2_supplier = wa_result1-Supplier.
        wa_result-q2_price = wa_result1-NetAmount.
 wa_result-q2_payment_terms = wa_result1-PaymentTerms.
          wa_result-q2_inco_terms = wa_result1-IncotermsClassification.
             wa_result-q2_quotation_date = wa_result1-creationdate.
             wa_result-q2_delivery_date = wa_result1-ScheduleLineDeliveryDate.
    endif.


 if lv_index1 = 3.
       wa_result-q3_supplier = wa_result1-Supplier.
  wa_result-q3_price = wa_result1-NetAmount.
   wa_result-q3_payment_terms = wa_result1-PaymentTerms.
          wa_result-q3_inco_terms = wa_result1-IncotermsClassification.
             wa_result-q3_quotation_date = wa_result1-creationdate.
             wa_result-q3_delivery_date = wa_result1-ScheduleLineDeliveryDate.
    endif.


if lv_index1 = 4.
       wa_result-q4_supplier = wa_result1-Supplier.
         wa_result-q4_price = wa_result1-NetAmount.
 wa_result-q4_payment_terms = wa_result1-PaymentTerms.
          wa_result-q4_inco_terms = wa_result1-IncotermsClassification.
             wa_result-q4_quotation_date = wa_result1-creationdate.
             wa_result-q4_delivery_date = wa_result1-ScheduleLineDeliveryDate.
endif.
endif.

modify lt_result from wa_result.
ENDLOOP.
lv_index1 = 0.
endloop.

lt_response = lt_result.


 IF lt_response IS INITIAL.
        io_response->set_total_number_of_records( 0 ).
        io_response->set_data( lt_response ).
        RETURN.
      ENDIF.
      "--------------------------------------------------
      " 7. Paging
      "--------------------------------------------------
      CLEAR lt_responseout.
      CLEAR lv_index.
      LOOP AT lt_response INTO DATA(ls_line).
        lv_index = lv_index + 1.
        "Skip
        IF lv_index <= lv_skip.
          CONTINUE.
        ENDIF.
        "Page size
        IF lv_top > 0
           AND lines( lt_responseout ) >= lv_top.
          EXIT.
        ENDIF.
        APPEND ls_line TO lt_responseout.
      ENDLOOP.
      io_response->set_total_number_of_records(
          lines( lt_response ) ).
      io_response->set_data(
          lt_responseout ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.
