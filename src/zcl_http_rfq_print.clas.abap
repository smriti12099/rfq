CLASS ZCL_HTTP_RFQ_PRINT DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_http_service_extension.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_HTTP_RFQ_PRINT IMPLEMENTATION.


  METHOD if_http_service_extension~handle_request.

    DATA(req) = request->get_form_fields( ).

    response->set_header_field( i_name = 'Access-Control-Allow-Origin' i_value = '*' ).
    response->set_header_field( i_name = 'Access-Control-Allow-Credentials' i_value = 'true' ).
      DATA(gn)     = request->get_form_field( 'gn' ).

TRY.

        SELECT REQUESTFORQuotation
  FROM I_RequestForQuotationItemTP
WHERE
 REQUESTFORQuotation = @gn
  INTO TABLE @data(lt_valid).

        IF lt_valid IS NOT INITIAL.
          DATA(pdf) =  zcl_ge_print=>read_posts(
             gn = gn
             ).
          IF pdf = 'ERROR'.
            response->set_text( |Error generating credit note: { pdf }| ).
            RETURN.
          ELSE.
            response->set_header_field( i_name = 'Content-Type' i_value = 'text/html' ).
            response->set_text( pdf ).
          ENDIF.
        ELSE.
          response->set_text( '0' ).
          RETURN.
        ENDIF.


      CATCH cx_static_check INTO DATA(lx_static).
        response->set_text( |Error generating credit note: { lx_static->get_text( ) }| ).
        RETURN.
    ENDTRY.
  ENDMETHOD.
ENDCLASS.
