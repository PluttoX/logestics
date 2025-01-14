class Invoice {
  // Section: Invoice Details
  int invoiceNumber;
  String invoiceStatus;

  // Section: Order Details
  String orderNumber;
  String orderDate;
  String productName;
  int numberOfBags;

  // Section: Consignor Information
  String consignorName;
  String consignorPickUpAddress;
  String customerGstNumber;

  // Section: Customer Information
  String customerName;
  String customerCNIC;

  // Section: Shipping Information
  String deliveryMode;
  String shipmentNumber;
  String truckNumber;
  String tasNumber;
  String conveyNoteNumber;
  String regionNumber;
  String destinationAddress;
  double distanceInKilometers;
  String shipmentDate;
 // String carrierName;

  // Constructor
  Invoice({
    required this.invoiceNumber,
    required this.invoiceStatus,
    required this.orderNumber,
    required this.orderDate,
    required this.productName,
    required this.numberOfBags,
    required this.consignorName,
    required this.consignorPickUpAddress,
    required this.customerGstNumber,
    required this.customerName,
    required this.customerCNIC,
    required this.deliveryMode,
    required this.shipmentNumber,
    required this.truckNumber,
    required this.tasNumber,
    required this.conveyNoteNumber,
    required this.regionNumber,
    required this.destinationAddress,
    required this.distanceInKilometers,
    required this.shipmentDate,
   // required this.carrierName,
  });

  // Method to convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'invoiceNumber': invoiceNumber,
      'invoiceStatus': invoiceStatus,
      'orderNumber': orderNumber,
      'orderDate': orderDate,
      'productName': productName,
      'numberOfBags': numberOfBags,
      'consignorName': consignorName,
      'consignorPickUpAddress': consignorPickUpAddress,
      'customerGstNumber': customerGstNumber,
      'customerName': customerName,
      'customerCNIC': customerCNIC,
      'deliveryMode': deliveryMode,
      'shipmentNumber': shipmentNumber,
      'truckNumber': truckNumber,
      'tasNumber': tasNumber,
      'conveyNoteNumber': conveyNoteNumber,
      'regionNumber': regionNumber,
      'destinationAddress': destinationAddress,
      'distanceInKilometers': distanceInKilometers,
      'shipmentDate': shipmentDate,
     // 'carrierName': carrierName,
    };
  }

  // Factory to create an instance from JSON
  factory Invoice.fromJson(Map<String, dynamic> json) {
    return Invoice(
      invoiceNumber: json['invoiceNumber'],
      invoiceStatus: json['invoiceStatus'],
      orderNumber: json['orderNumber'],
      orderDate: json['orderDate'],
      productName: json['productName'],
      numberOfBags: json['numberOfBags'],
      consignorName: json['consignorName'],
      consignorPickUpAddress: json['consignorPickUpAddress'],
      customerGstNumber: json['customerGstNumber'],
      customerName: json['customerName'],
      customerCNIC: json['customerCNIC'],
      deliveryMode: json['deliveryMode'],
      shipmentNumber: json['shipmentNumber'],
      truckNumber: json['truckNumber'],
      tasNumber: json['tasNumber'],
      conveyNoteNumber: json['conveyNoteNumber'],
      regionNumber: json['regionNumber'],
      destinationAddress: json['destinationAddress'],
      distanceInKilometers: (json['distanceInKilometers'] as num).toDouble(),
      shipmentDate: json['shipmentDate'],
     // carrierName: json['carrierName'],
    );
  }

  @override
  String toString() {
    return 'Invoice(invoiceNumber: $invoiceNumber, invoiceStatus: $invoiceStatus, orderNumber: $orderNumber, orderDate: $orderDate, productName: $productName, numberOfBags: $numberOfBags, consignorName: $consignorName, consignorDestination: $consignorPickUpAddress, gstFbrTrackingNumber: $customerGstNumber, customerName: $customerName, customerCnic: $customerCNIC, deliveryMode: $deliveryMode, shipmentNumber: $shipmentNumber, truckNumber: $truckNumber, tasNumber: $tasNumber, conveyNoteNumber: $conveyNoteNumber, reignNumber: $regionNumber, destinationAddress: $destinationAddress, distanceInKilometers: $distanceInKilometers, shipmentDate: $shipmentDate, )';
  }

}

class ListOfInvoices {
  List<Invoice> invoices;

  // Constructor
  ListOfInvoices({required this.invoices});

  // Method to convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'invoices': invoices.map((invoice) => invoice.toJson()).toList(),
    };
  }

  // Factory to create an instance from JSON
  factory ListOfInvoices.fromJson(Map<String, dynamic> json) {
    return ListOfInvoices(
      invoices: (json['invoices'] as List)
          .map((invoiceJson) => Invoice.fromJson(invoiceJson))
          .toList(),
    );
  }
}
