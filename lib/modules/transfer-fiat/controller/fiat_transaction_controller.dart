import 'package:get/get.dart';

class FiatTransactionController extends GetxController {
  var details = <Map<String, String>>[
    {"label": "Account Name", "value": "Johnson Doe"},
    {"label": "Bank", "value": "GTBank"},
    {"label": "Account Number", "value": "******7362"},
    {"label": "Amount to Transfer", "value": "₦600,000.00"},
    {"label": "Transaction Charges", "value": "₦160.00"},
    {"label": "You will receive", "value": "₦599,840.00"},
  ].obs;
}
