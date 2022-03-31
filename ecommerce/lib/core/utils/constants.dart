class Constants {
  static String fontFamily = "MyHelveticaNeue";

  // print line entity type
  static const int PrintLineText = 0;
  static const int PrintLineImage = 1;

  static const int printer_line_width = 32;

  // start print template attributes
  static const String TemplateGeneralDataCurrentDate = "General.currentDate";
  static const String TemplateGeneralDataDeviceId = "General.deviceid";
  static const String TemplateGeneralDataFromLocation = "General.fromLocation";
  static const String TemplateGeneralDataUser = "General.user";
  static const String TemplateGeneralDataLocationName = "SaleLocations.Name";
  static const String TemplateGeneralDataLocationSysId = "SaleLocations.SysID";
  static const String TemplateGeneralDataSaleZone = "General.saleZone";
  static const String TemplateGeneralDataTable = "General.table";
  static const String TemplateGeneralDataTableService = "General.tableservice";
  static const String TemplateGeneralDataTitle = "General.title";
  static const String TemplateGeneralDataAmount = "General.amount";

  static const String TemplateAccountFirstName = "Account.FirstName";
  static const String TemplateAccountLastName = "Account.LastName";
  static const String TemplateAccountFullName = "Account.FullName";

  static const String TemplateGeneralDataSaleNo = "General.saleNo";
  static const String TemplateGeneralDataBranchName = "branch.name";
  static const String TemplateTableColumnsEODGoods = "Goods";

  static const String TemplateTicketPrintName = "ticket.printName";
  static const String TemplateTicketDimensionName = "ticket.dimensionName";
  static const String TemplateTicketPrintText = "ticket.printText";
  static const String TemplateTicketDiscountedPrice = "ticket.discountedPrice";
  static const String TemplateTicketCurrency = "Currencies.name";
  static const String TemplateTicketQrCode = "QRCode";
  static const String TemplateTicketBarCode = "BarCode";
  static const String TemplateTicketOffer = "ticket.offer";

  //Sale Receipt
  static const String TemplateReceiptPaidBy = "SaleReceipt.paidBy";
  static const String TemplateTotal = "SaleReceipt.total";
  static const String TemplateCardPurchased = "SaleReceipt.cardPurchase";
  static const String TemplateAmountPaid = "SaleReceipt.amountPaid";
  static const String TemplateChange = "SaleReceipt.change";
  static const String TemplateCashRefundStatus = "SaleReceipt.cashRefundStatus";
  static const String TemplateReceiptCardType = "SaleReceipt.cardType";
  static const String TemplateStatus = "SaleReceipt.status";
  static const String TemplateCardMid = "SaleReceipt.mid";
  static const String TemplateCardTid = "SaleReceipt.tid";
  static const String TemplateCardAid = "SaleReceipt.aid";
  static const String TemplateCardAuthNumber = "SaleReceipt.authNumber";
  static const String TemplateCardTxnNumber = "SaleReceipt.txnNumber";
  static const String TemplateCardExpiredDate = "SaleReceipt.cardExpireDate";
  static const String TemplateReceiptSubtotal = "SaleReceipt.SubTotal";

  static const String TemplateTaxDetailTableName = "Sales.Taxes";
  static const String TemplateMerchantTableName = "Tax Price";
  static const String TemplateTableColumnsItem = "item";
  static const String TemplateTableColumnsTaxRate = "taxRate";
  static const String TemplateTableColumnsCurrency = "currency";
  static const String TemplateTableColumnsExTax = "exTax";
  static const String TemplateTableColumnsTax = "ItemsTax";
  static const String TemplateTableColumnsValue = "value";
  static const String TemplateTableColumnsGoods = "ItemsAmount";
  static const String TemplateTableColumnsTaxName = "Label";
  static const String TemplateTableColumnsQTY = "QTY";
  static const String TemplateTableColumnsVAT = "Vat";
  static const String TemplateTableColumnsEODValue = "Value";

  static const String TemplateMerchantTaxTotal = "MerchantCopy.taxTotal";
  static const String TemplateExRateTotal = "MerchantCopy.exTaxTotal";
  static const String TemplateGoodsTotal = "MerchantCopy.goodsTotal";

  static const String TemplateSaleTableName = "Sales";
  static const String TemplateSaleColumnsDocumentNo = "DocumentNo";

  static const String TemplateSaleDetailsTableName = "SaleDetails";
  static const String TemplateSaleDetailsSumQty = "SumQTY";
  static const String TemplateSaleDetailsProductPrintName = "ProductPrintName";
  static const String TemplateSaleDetailsTaxLabel = "TaxLabel";
  static const String TemplateSaleDetailsSumPrice = "SumPrice";

  static const String TemplatePaymentTableName = "Payments";
  static const String TemplatePaymentDescriptionPOS = "DescriptionPOS";
  static const String TemplatePaymentCurrencyName = "DocCurrencyName";
  static const String TemplatePaymentCurrencyAmount = "DocCurrencyAmount";

  // Declaration Types
  static const String TemplateDeclarationDetailTable = "DeclarationDetails";
  static const String TemplateDeclarationTableName = "Declaration";
  static const String TemplateTableColumnsLabel = "Label";
  static const String TemplateTableColumnsDeclared = "Declared";
  static const String TemplateTableColumnsCalculatedQTY = "CalculatedQTY";
  static const String TemplateTableColumnsDiff = "Diff";
  static const String TemplateTableColumnsCalculatedAmount = "CalculatedAmount";
  static const String TemplateEndOfDayRefundTable = "Table3";
  static const String TemplateEndOfDayDiscountTable = "Table4";
  static const String TemplateEndOfDaySaleDetailTable = "Table";

  //Ticket form
  static const String TemplateTicketFormProductName = "Sale.ProductName";
  static const String TemplateTicketFormTotalPrice = "Sale.TotalPrice";
  static const String TemplateTicketFormCustomerName = "Customer.FullName";
  static const String TemplateTicketFormPhoneNo = "Customer.PhoneNo";
  static const String TemplateTicketFormTicketDay = "Customer.Day";
  static const String TemplateTicketFormTicketDate = "Customer.Date";
  static const TemplateTicketFormTicketTime = "Customer.Time";
  static const TemplateTicketFormRowSeat = "Customer.RowSeat";
  static const TemplateTicketFormCustomerLocation = "Customer.Location";
  static const TemplateTicketFormAdult = "Customer.Adult";
  static const TemplateTicketFormSenior = "Customer.Senior";
  static const TemplateTicketFormChild = "Customer.Child";
  static const TemplateTicketFormStudent = "Customer.Student";
  static const TemplateTicketFormComments = "Customer.Comments";
  static const TemplateTicketFormSupplier = "Customer.Supplier";

  //for card only
  static const String TemplateCardNumber = "saleReceipt.cardNumber";
  static const String DECLARATION_EXTERNAL_PDQ = "External PDQ";
  static const String DECLARATION_ONACCOUNT = "On Account";
  static const String DECLARATION_CREDITNOTE = "Credit Note";

  static const String TemplateSaleDetailsProductCode = "ProductCode";

  static const String TemplateGeneralDataUserFirstName = "Operator.FirstName";
  static const String TemplateGeneralDataUserFullName = "Operator.FullName";
  static const String TemplateGeneralDataCashierCode = "operator.code";
  static const String TemplateGeneralDataUserLastName = "Operator.LastName";

  //end print template attributes

  static const String DECLARATION_CASH = "Cash";
  static const String DECLARATION_CARD = "Card";
  static const String DECLARATION_REFUND = "Refunds";
  static const String TENDER_DISCOUNT = "Discount";
  static const String TENDER_VOUCHER = "Voucher";
  static const String DECLARATION_FLOAT = "Float";

  // Backup
  static const String BackUpData = 'BackUpDataForRestoring';
}