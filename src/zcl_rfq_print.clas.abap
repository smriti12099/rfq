*CLASS zcl_rfq_print DEFINITION
*  PUBLIC
*  FINAL
*  CREATE PUBLIC .
*
*  PUBLIC SECTION.
*  PROTECTED SECTION.
*  PRIVATE SECTION.
*ENDCLASS.
*
*
*
*CLASS zcl_rfq_print IMPLEMENTATION.
*ENDCLASS.


CLASS zcl_rfq_print DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  TYPES: BEGIN OF ty_gate,
         GateNumber        TYPE zge_i_head-gatenumber,
         GateInDate        TYPE zge_i_head-gateindate,
         Transporter       TYPE zge_i_head-transporter,
         SupplierName      TYPE zge_i_head-suppliername,
         PlantName         TYPE zge_i_head-plantname,
         VendorGrossWeight TYPE zge_i_head-vendorgrossweight,
         VehichleNo        TYPE zge_i_head-vehichleno,
         VehicleType       TYPE zge_i_head-vehicletype,
         VendorInvoiceNo   TYPE zge_i_head-vendorinvoiceno,
         BillOfLanding     TYPE zge_i_head-billoflanding,
         GrossWeight       TYPE zge_i_head-grossweight,
         VendorTareWeight  TYPE zge_i_head-vendortareweight,
         PurchasingDoc     TYPE zge_i_head-purchasingdoc,
         EntryGate         TYPE zge_i_head-entrygate,
         DriverName        TYPE zge_i_head-drivername,
         VendorInvoiceDt   TYPE zge_i_head-vendorinvoicedt,
         LrRrNo            TYPE zge_i_head-lrrrno,
         TareWeight        TYPE zge_i_head-tareweight,
         NetWeight         TYPE zge_i_head-netweight,
         items             TYPE STANDARD TABLE OF zge_i_item WITH DEFAULT KEY,
            END OF ty_gate.


  CLASS-DATA : access_token TYPE string .
    CLASS-DATA : xml_file TYPE string .
    CLASS-DATA : template TYPE string .
    CLASS-DATA : tot_sum  TYPE string.

    TYPES : BEGIN OF struct,
              xdp_template TYPE string,
              xml_data     TYPE string,
              form_type    TYPE string,
              form_locale  TYPE string,
              tagged_pdf   TYPE string,
              embed_font   TYPE string,
            END OF struct."

    CLASS-METHODS :
      create_client
        IMPORTING url           TYPE string
        RETURNING VALUE(result) TYPE REF TO if_web_http_client
        RAISING   cx_static_check,

      read_posts
        IMPORTING gn              TYPE string

        RETURNING VALUE(result12) TYPE string
        RAISING   cx_static_check .
  PROTECTED SECTION.
  PRIVATE SECTION.

  CONSTANTS  lc_template_name TYPE string VALUE  'zgate_entry_form/zgate_entry_form'.
ENDCLASS.



CLASS ZCL_RFQ_PRINT IMPLEMENTATION.


 METHOD create_client.
  ENDMETHOD.


  METHOD read_posts.
  DATA: lt_deliveries TYPE RANGE OF zge_i_head-GateNumber.
*

SELECT SINGLE REQUESTFORQuotation
  FROM I_RequestForQuotationItemTP
        WHERE
 REQUESTFORQuotation = @gn
  INTO @data(lt_valid).

 DATA lv_xml TYPE string.

lv_xml = |<Form>| &&
               |<Header>| &&
               |<RFQ>{ lt_valid }</RFQ>| &&
               |</Header>| &&
               |</Form>|.


 REPLACE ALL OCCURRENCES OF '&' IN lv_xml WITH 'and'.
       CALL METHOD zge_pdf_services=>getpdf(
      EXPORTING
        xmldata  = lv_xml
        template = lc_template_name
      RECEIVING
        result   = result12
    ).


  ENDMETHOD.
ENDCLASS.
