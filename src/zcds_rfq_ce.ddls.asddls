@EndUserText.label: 'Test Custom Entity'
@Search.searchable: false
@ObjectModel.query.implementedBy: 'ABAP:ZCL_RFQ_CE'
@UI.headerInfo: { typeName: 'Planning' }
@Metadata.allowExtensions: true

define root custom entity ZCDS_RFQ_CE
{
  @EndUserText.label: 'RFQ'
  @UI.selectionField: [{ position: 1 }]
  @UI.identification: [{ position: 1, label: 'RFQ' }]
  @UI.lineItem: [{ position: 10, label: 'RFQ', navigationAvailable: false }
//   {  type: #FOR_ACTION , dataAction: 'SendMail' ,label: 'Send Mail'}
 ]
  key rfq : abap.char(10);
  
  
  @EndUserText.label: 'RFQ Item'
  @UI.selectionField: [{ position: 1 }]
  @UI.identification: [{ position: 1, label: 'RFQ Item' }]
  @UI.lineItem: [{ position: 10, label: 'RFQ Item', navigationAvailable: false }]
  key rfq_numberitem : abap.numc(5);

  @EndUserText.label: 'Procurement Type'
//  @UI.selectionField: [{ position: 2 }]
  @UI.lineItem: [{ position: 20, label: 'Procurement Type', navigationAvailable: false  }]
 
  procurement_type : abap.char(15);

  @EndUserText.label: 'Plant'
  @UI.selectionField: [{ position: 3 }]
  @UI.lineItem: [{ position: 30, label: 'Plant', navigationAvailable: false }]
  plant : abap.char(4);

  @EndUserText.label: 'RFQ Date'
  @UI.selectionField: [{ position: 4 }]
  @UI.lineItem: [{ position: 40, label: 'RFQ Date', navigationAvailable: false }]
  rfq_date : abap.dats;


@EndUserText.label: 'Material'
//  @UI.selectionField: [{ position: 4 }]
  @UI.lineItem: [{ position: 40, label: 'Material', navigationAvailable: false }]
 MATERIAL: matnr;

  // =========================
  // Q1 SUPPLIER
  // =========================

  @EndUserText.label: 'Q1 Supplier'
          //@UI.lineItem: [{ position: 50, label: 'Q1 Supplier', navigationAvailable: false }]
  q1_supplier : abap.char(10);

  @EndUserText.label: 'Q1 Quotation Date'
  //@UI.lineItem: [{ position: 60, label: 'Q1 Quotation Date', navigationAvailable: false }]
  q1_quotation_date : abap.dats;

  @EndUserText.label: 'Q1 Payment Terms'
//@UI.lineItem: [{ position: 70, label: 'Q1 Payment Terms', navigationAvailable: false }]
  q1_payment_terms : abap.char(10);

  @EndUserText.label: 'Q1 Inco Terms'
  //@UI.lineItem: [{ position: 80, label: 'Q1 Inco Terms', navigationAvailable: false }]
  q1_inco_terms : abap.char(10);

  @EndUserText.label: 'Q1 Price'
  //@UI.lineItem: [{ position: 90, label: 'Q1 Price', navigationAvailable: false }]
  q1_price : abap.dec(15,2);

  @EndUserText.label: 'Q1 Delivery Date'
  //@UI.lineItem: [{ position: 100, label: 'Q1 Delivery Date', navigationAvailable: false }]
  q1_delivery_date : abap.dats;

  @EndUserText.label: 'Q1 Guarantee Duration'
  //@UI.lineItem: [{ position: 110, label: 'Q1 Guarantee Duration', navigationAvailable: false }]
  q1_guarantee_duration : abap.dec(15,2);

  @EndUserText.label: 'Q1 Guarantee Period'
  //@UI.lineItem: [{ position: 120, label: 'Q1 Guarantee Period', navigationAvailable: false }]
  q1_guarantee_period : abap.char(2);

  @EndUserText.label: 'Q1 Warranty Duration'
  //@UI.lineItem: [{ position: 130, label: 'Q1 Warranty Duration', navigationAvailable: false }]
  q1_warranty_duration : abap.dec(15,2);

  @EndUserText.label: 'Q1 Warranty Period'
  //@UI.lineItem: [{ position: 140, label: 'Q1 Warranty Period', navigationAvailable: false }]
  q1_warranty_period :  abap.char(2);

  @EndUserText.label: 'Q1 LD Min Percent'
  //@UI.lineItem: [{ position: 150, label: 'Q1 LD Min %', navigationAvailable: false }]
  q1_ld_min_percent : abap.dec(5,2);

  @EndUserText.label: 'Q1 LD Max Percent'
  //@UI.lineItem: [{ position: 160, label: 'Q1 LD Max %', navigationAvailable: false }]
  q1_ld_max_percent : abap.dec(5,2);

  @EndUserText.label: 'Q1 Technical Rating'
  //@UI.lineItem: [{ position: 170, label: 'Q1 Technical Rating', navigationAvailable: false }]
  q1_technical_rating : abap.char(2);

  @EndUserText.label: 'Q1 Score Price'
  //@UI.lineItem: [{ position: 180, label: 'Q1 Score Price', navigationAvailable: false }]
  q1_score_price : abap.dec(7,2);

  @EndUserText.label: 'Q1 Score Payment Terms'
  //@UI.lineItem: [{ position: 190, label: 'Q1 Score Payment Terms', navigationAvailable: false }]
  q1_score_payment_terms : abap.dec(7,2);

  @EndUserText.label: 'Q1 Score Inco'
  //@UI.lineItem: [{ position: 200, label: 'Q1 Score Inco', navigationAvailable: false }]
  q1_score_inco : abap.dec(7,2);

  @EndUserText.label: 'Q1 Score Delivery Date'
  //@UI.lineItem: [{ position: 210, label: 'Q1 Score Delivery Date', navigationAvailable: false }]
  q1_score_delivery_date : abap.dec(7,2);

  @EndUserText.label: 'Q1 Score Guarantee'
  //@UI.lineItem: [{ position: 220, label: 'Q1 Score Guarantee', navigationAvailable: false }]
  q1_score_guarantee : abap.dec(15,2);

  @EndUserText.label: 'Q1 Score Warranty'
  //@UI.lineItem: [{ position: 230, label: 'Q1 Score Warranty', navigationAvailable: false }]
  q1_score_warranty : abap.dec(15,2);

  @EndUserText.label: 'Q1 Score LD Max'
  //@UI.lineItem: [{ position: 240, label: 'Q1 Score LD Max', navigationAvailable: false }]
  q1_score_ld_MAX : abap.dec(7,2);
  
    @EndUserText.label: 'Q1 Score LD Min'
  //@UI.lineItem: [{ position: 245, label: 'Q1 Score LD Min', navigationAvailable: false }]
  q1_score_ld_MIN: abap.dec(7,2);

  @EndUserText.label: 'Q1 Score Technical'
  //@UI.lineItem: [{ position: 250, label: 'Q1 Score Technical', navigationAvailable: false }]
  q1_score_technical : abap.dec(7,2);

  @EndUserText.label: 'Q1 Total Score'
  //@UI.lineItem: [{ position: 260, label: 'Q1 Total Score', navigationAvailable: false }]
  q1_total_score : abap.dec(7,2);

  @EndUserText.label: 'Q1 Ranking'
  //@UI.lineItem: [{ position: 270, label: 'Q1 Ranking', navigationAvailable: false }]
  q1_ranking : abap.int4;


  // =========================
  // Q2 SUPPLIER
  // =========================

  @EndUserText.label: 'Q2 Supplier'
  //@UI.lineItem: [{ position: 280, label: 'Q2 Supplier', navigationAvailable: false }]
  q2_supplier : abap.char(10);

  @EndUserText.label: 'Q2 Quotation Date'
  //@UI.lineItem: [{ position: 290, label: 'Q2 Quotation Date', navigationAvailable: false }]
  q2_quotation_date : abap.dats;

  @EndUserText.label: 'Q2 Payment Terms'
  //@UI.lineItem: [{ position: 300, label: 'Q2 Payment Terms', navigationAvailable: false }]
  q2_payment_terms : abap.char(10);

  @EndUserText.label: 'Q2 Inco Terms'
  //@UI.lineItem: [{ position: 310, label: 'Q2 Inco Terms', navigationAvailable: false }]
  q2_inco_terms : abap.char(10);

  @EndUserText.label: 'Q2 Price'
  //@UI.lineItem: [{ position: 320, label: 'Q2 Price', navigationAvailable: false }]
  q2_price : abap.dec(15,2);

  @EndUserText.label: 'Q2 Delivery Date'
  //@UI.lineItem: [{ position: 330, label: 'Q2 Delivery Date', navigationAvailable: false }]
  q2_delivery_date : abap.dats;

  @EndUserText.label: 'Q2 Guarantee Duration'
  //@UI.lineItem: [{ position: 340, label: 'Q2 Guarantee Duration', navigationAvailable: false }]
  q2_guarantee_duration : abap.dec(15,2);

  @EndUserText.label: 'Q2 Guarantee Period'
  //@UI.lineItem: [{ position: 350, label: 'Q2 Guarantee Period', navigationAvailable: false }]
  q2_guarantee_period : abap.char(2);

  @EndUserText.label: 'Q2 Warranty Duration'
  //@UI.lineItem: [{ position: 360, label: 'Q2 Warranty Duration', navigationAvailable: false }]
  q2_warranty_duration : abap.dec(15,2);

  @EndUserText.label: 'Q2 Warranty Period'
  //@UI.lineItem: [{ position: 370, label: 'Q2 Warranty Period', navigationAvailable: false }]
  q2_warranty_period : abap.char(2);

  @EndUserText.label: 'Q2 LD Min Percent'
  //@UI.lineItem: [{ position: 380, label: 'Q2 LD Min %', navigationAvailable: false }]
  q2_ld_min_percent : abap.dec(5,2);

  @EndUserText.label: 'Q2 LD Max Percent'
  //@UI.lineItem: [{ position: 390, label: 'Q2 LD Max %', navigationAvailable: false }]
  q2_ld_max_percent : abap.dec(5,2);

  @EndUserText.label: 'Q2 Technical Rating'
  //@UI.lineItem: [{ position: 400, label: 'Q2 Technical Rating', navigationAvailable: false }]
  q2_technical_rating : abap.char(2);

  @EndUserText.label: 'Q2 Score Price'
  //@UI.lineItem: [{ position: 410, label: 'Q2 Score Price', navigationAvailable: false }]
  q2_score_price : abap.dec(7,2);

  @EndUserText.label: 'Q2 Score Payment Terms'
  //@UI.lineItem: [{ position: 420, label: 'Q2 Score Payment Terms', navigationAvailable: false }]
  q2_score_payment_terms : abap.dec(7,2);

  @EndUserText.label: 'Q2 Score Inco'
  //@UI.lineItem: [{ position: 430, label: 'Q2 Score Inco', navigationAvailable: false }]
  q2_score_inco : abap.dec(7,2);

  @EndUserText.label: 'Q2 Score Delivery Date'
  //@UI.lineItem: [{ position: 440, label: 'Q2 Score Delivery Date', navigationAvailable: false }]
  q2_score_delivery_date : abap.dec(7,2);

  @EndUserText.label: 'Q2 Score Guarantee'
  //@UI.lineItem: [{ position: 450, label: 'Q2 Score Guarantee', navigationAvailable: false }]
  q2_score_guarantee : abap.dec(15,2);

  @EndUserText.label: 'Q2 Score Warranty'
  //@UI.lineItem: [{ position: 460, label: 'Q2 Score Warranty', navigationAvailable: false }]
  q2_score_warranty : abap.dec(15,2);

  @EndUserText.label: 'Q2 Score LD'
  //@UI.lineItem: [{ position: 470, label: 'Q2 Score LD', navigationAvailable: false }]
  q2_score_ld_MAX : abap.dec(7,2);
  
  
      @EndUserText.label: 'Q2 Score LD Min'
  //@UI.lineItem: [{ position: 475, label: 'Q2 Score LD Min', navigationAvailable: false }]
  q2_score_ld_MIN: abap.dec(7,2);

  @EndUserText.label: 'Q2 Score Technical'
  //@UI.lineItem: [{ position: 480, label: 'Q2 Score Technical', navigationAvailable: false }]
  q2_score_technical : abap.dec(7,2);

  @EndUserText.label: 'Q2 Total Score'
  //@UI.lineItem: [{ position: 490, label: 'Q2 Total Score', navigationAvailable: false }]
  q2_total_score : abap.dec(7,2);

  @EndUserText.label: 'Q2 Ranking'
  //@UI.lineItem: [{ position: 500, label: 'Q2 Ranking', navigationAvailable: false }]
  q2_ranking : abap.int4;


//   =========================
//   Q3 SUPPLIER
//   =========================

  @EndUserText.label: 'Q3 Supplier'
  //@UI.lineItem: [{ position: 510, label: 'Q3 Supplier', navigationAvailable: false }]
  q3_supplier : abap.char(10);

  @EndUserText.label: 'Q3 Quotation Date'
  //@UI.lineItem: [{ position: 520, label: 'Q3 Quotation Date', navigationAvailable: false }]
  q3_quotation_date : abap.dats;

  @EndUserText.label: 'Q3 Payment Terms'
  //@UI.lineItem: [{ position: 530, label: 'Q3 Payment Terms', navigationAvailable: false }]
  q3_payment_terms : abap.char(10);

  @EndUserText.label: 'Q3 Inco Terms'
  //@UI.lineItem: [{ position: 540, label: 'Q3 Inco Terms', navigationAvailable: false }]
  q3_inco_terms : abap.char(10);

  @EndUserText.label: 'Q3 Price'
  //@UI.lineItem: [{ position: 550, label: 'Q3 Price', navigationAvailable: false }]
  q3_price : abap.dec(15,2);

  @EndUserText.label: 'Q3 Delivery Date'
  //@UI.lineItem: [{ position: 560, label: 'Q3 Delivery Date', navigationAvailable: false }]
  q3_delivery_date : abap.dats;

  @EndUserText.label: 'Q3 Guarantee Duration'
  //@UI.lineItem: [{ position: 570, label: 'Q3 Guarantee Duration', navigationAvailable: false }]
  q3_guarantee_duration : abap.dec(15,2);

  @EndUserText.label: 'Q3 Guarantee Period'
  //@UI.lineItem: [{ position: 580, label: 'Q3 Guarantee Period', navigationAvailable: false }]
  q3_guarantee_period : abap.char(2);

  @EndUserText.label: 'Q3 Warranty Duration'
  //@UI.lineItem: [{ position: 590, label: 'Q3 Warranty Duration', navigationAvailable: false }]
  q3_warranty_duration : abap.dec(15,2);

  @EndUserText.label: 'Q3 Warranty Period'
  //@UI.lineItem: [{ position: 600, label: 'Q3 Warranty Period', navigationAvailable: false }]
  q3_warranty_period : abap.char(2);

  @EndUserText.label: 'Q3 LD Min Percent'
  //@UI.lineItem: [{ position: 610, label: 'Q3 LD Min %', navigationAvailable: false }]
  q3_ld_min_percent : abap.dec(5,2);

  @EndUserText.label: 'Q3 LD Max Percent'
  //@UI.lineItem: [{ position: 620, label: 'Q3 LD Max %', navigationAvailable: false }]
  q3_ld_max_percent : abap.dec(5,2);

  @EndUserText.label: 'Q3 Technical Rating'
  //@UI.lineItem: [{ position: 630, label: 'Q3 Technical Rating', navigationAvailable: false }]
  q3_technical_rating : abap.char(2);

  @EndUserText.label: 'Q3 Score Price'
  //@UI.lineItem: [{ position: 640, label: 'Q3 Score Price', navigationAvailable: false }]
  q3_score_price : abap.dec(7,2);

  @EndUserText.label: 'Q3 Score Payment Terms'
  //@UI.lineItem: [{ position: 650, label: 'Q3 Score Payment Terms', navigationAvailable: false }]
  q3_score_payment_terms : abap.dec(7,2);

  @EndUserText.label: 'Q3 Score Inco'
  //@UI.lineItem: [{ position: 660, label: 'Q3 Score Inco', navigationAvailable: false }]
  q3_score_inco : abap.dec(7,2);

  @EndUserText.label: 'Q3 Score Delivery Date'
  //@UI.lineItem: [{ position: 670, label: 'Q3 Score Delivery Date', navigationAvailable: false }]
  q3_score_delivery_date : abap.dec(7,2);

  @EndUserText.label: 'Q3 Score Guarantee'
  //@UI.lineItem: [{ position: 680, label: 'Q3 Score Guarantee', navigationAvailable: false }]
  q3_score_guarantee : abap.dec(15,2);

  @EndUserText.label: 'Q3 Score Warranty'
  //@UI.lineItem: [{ position: 690, label: 'Q3 Score Warranty', navigationAvailable: false }]
  q3_score_warranty : abap.dec(15,2);

  @EndUserText.label: 'Q3 Score LD'
  //@UI.lineItem: [{ position: 700, label: 'Q3 Score LD', navigationAvailable: false }]
  q3_score_ld_MAX : abap.dec(7,2);

    @EndUserText.label: 'Q3 Score LD Min'
  //@UI.lineItem: [{ position: 705, label: 'Q3 Score LD Min', navigationAvailable: false }]
  q3_score_ld_MIN: abap.dec(7,2);

  @EndUserText.label: 'Q3 Score Technical'
  //@UI.lineItem: [{ position: 710, label: 'Q3 Score Technical', navigationAvailable: false }]
  q3_score_technical : abap.dec(7,2);

  @EndUserText.label: 'Q3 Total Score'
  //@UI.lineItem: [{ position: 720, label: 'Q3 Total Score', navigationAvailable: false }]
  q3_total_score : abap.dec(7,2);

  @EndUserText.label: 'Q3 Ranking'
  //@UI.lineItem: [{ position: 730, label: 'Q3 Ranking', navigationAvailable: false }]
  q3_ranking : abap.int4;
 


//   =========================
//   Q4 SUPPLIER
//   =========================

  @EndUserText.label: 'Q4 Supplier'
  //@UI.lineItem: [{ position: 740, label: 'Q4 Supplier', navigationAvailable: false }]
  q4_supplier : abap.char(10);

  @EndUserText.label: 'Q4 Quotation Date'
  //@UI.lineItem: [{ position: 750, label: 'Q4 Quotation Date', navigationAvailable: false }]
  q4_quotation_date : abap.dats;

  @EndUserText.label: 'Q4 Payment Terms'
  //@UI.lineItem: [{ position: 760, label: 'Q4 Payment Terms', navigationAvailable: false }]
  q4_payment_terms : abap.char(10);

  @EndUserText.label: 'Q4 Inco Terms'
  //@UI.lineItem: [{ position: 770, label: 'Q4 Inco Terms', navigationAvailable: false }]
  q4_inco_terms : abap.char(10);

  @EndUserText.label: 'Q4 Price'
  //@UI.lineItem: [{ position: 780, label: 'Q4 Price', navigationAvailable: false }]
  q4_price : abap.dec(15,2);

  @EndUserText.label: 'Q4 Delivery Date'
  //@UI.lineItem: [{ position: 790, label: 'Q4 Delivery Date', navigationAvailable: false }]
  q4_delivery_date : abap.dats;

  @EndUserText.label: 'Q4 Guarantee Duration'
  //@UI.lineItem: [{ position: 800, label: 'Q4 Guarantee Duration', navigationAvailable: false }]
  q4_guarantee_duration : abap.dec(15,2);

  @EndUserText.label: 'Q4 Guarantee Period'
  //@UI.lineItem: [{ position: 810, label: 'Q4 Guarantee Period', navigationAvailable: false }]
  q4_guarantee_period : abap.char(2);

  @EndUserText.label: 'Q4 Warranty Duration'
  //@UI.lineItem: [{ position: 820, label: 'Q4 Warranty Duration', navigationAvailable: false }]
  q4_warranty_duration : abap.dec(15,2);

  @EndUserText.label: 'Q4 Warranty Period'
  //@UI.lineItem: [{ position: 830, label: 'Q4 Warranty Period', navigationAvailable: false }]
  q4_warranty_period : abap.char(2);

  @EndUserText.label: 'Q4 LD Min Percent'
  //@UI.lineItem: [{ position: 840, label: 'Q4 LD Min %', navigationAvailable: false }]
  q4_ld_min_percent : abap.dec(5,2);

  @EndUserText.label: 'Q4 LD Max Percent'
  //@UI.lineItem: [{ position: 850, label: 'Q4 LD Max %', navigationAvailable: false }]
  q4_ld_max_percent : abap.dec(5,2);

  @EndUserText.label: 'Q4 Technical Rating'
  //@UI.lineItem: [{ position: 860, label: 'Q4 Technical Rating', navigationAvailable: false }]
  q4_technical_rating : abap.char(2);
  
  

  @EndUserText.label: 'Q4 Score Price'
  //@UI.lineItem: [{ position: 870, label: 'Q4 Score Price', navigationAvailable: false }]
  q4_score_price : abap.dec(7,2);
  
  

  @EndUserText.label: 'Q4 Score Payment Terms'
  //@UI.lineItem: [{ position: 880, label: 'Q4 Score Payment Terms', navigationAvailable: false }]
  q4_score_payment_terms : abap.dec(7,2);




  @EndUserText.label: 'Q4 Score Inco'
  //@UI.lineItem: [{ position: 890, label: 'Q4 Score Inco', navigationAvailable: false }]
  q4_score_inco : abap.dec(7,2);
  
  
  
  

  @EndUserText.label: 'Q4 Score Delivery Date'
  //@UI.lineItem: [{ position: 900, label: 'Q4 Score Delivery Date', navigationAvailable: false }]
  q4_score_delivery_date : abap.dec(7,2);
  
  
  
  

  @EndUserText.label: 'Q4 Score Guarantee'
  //@UI.lineItem: [{ position: 910, label: 'Q4 Score Guarantee', navigationAvailable: false }]
  q4_score_guarantee : abap.dec(15,2);
  
  
  

  @EndUserText.label: 'Q4 Score Warranty'
  //@UI.lineItem: [{ position: 920, label: 'Q4 Score Warranty', navigationAvailable: false }]
  q4_score_warranty : abap.dec(15,2);



  @EndUserText.label: 'Q4 Score LD'
  //@UI.lineItem: [{ position: 930, label: 'Q4 Score LD', navigationAvailable: false }]
  q4_score_ld_MAX : abap.dec(7,2);
  
  

      @EndUserText.label: 'Q4 Score LD Min'
  //@UI.lineItem: [{ position: 945, label: 'Q4 Score LD Min', navigationAvailable: false }]
  q4_score_ld_MIN: abap.dec(7,2);

  
 
  @EndUserText.label: 'Q4 Score Technical'
  //@UI.lineItem: [{ position: 940, label: 'Q4 Score Technical', navigationAvailable: false }]
  q4_score_technical : abap.dec(7,2);



  @EndUserText.label: 'Q4 Total Score'
  //@UI.lineItem: [{ position: 950, label: 'Q4 Total Score', navigationAvailable: false }]
  q4_total_score : abap.dec(7,2);
  
  

  @EndUserText.label: 'Q4 Ranking'
  //@UI.lineItem: [{ position: 960, label: 'Q4 Ranking', navigationAvailable: false }]
  q4_ranking : abap.int4;
//   =========================
//   ADMIN FIELDS
//   =========================

  @EndUserText.label: 'Created By'
  //@UI.lineItem: [{ position: 970, label: 'Created By', navigationAvailable: false }]
  created_by : abp_creation_user;

  @EndUserText.label: 'Created At'
  //@UI.lineItem: [{ position: 980, label: 'Created At', navigationAvailable: false }]
  created_at : abp_creation_tstmpl;


  @EndUserText.label: 'Changed By'
  //@UI.lineItem: [{ position: 990, label: 'Changed By', navigationAvailable: false }]
  changed_by : abp_lastchange_user;


  @EndUserText.label: 'Changed At'
  //@UI.lineItem: [{ position: 1000, label: 'Changed At', navigationAvailable: false }]
  changed_at : abp_lastchange_tstmpl;
}
