import 'package:get/get.dart';

class FiatDepositTransactionController extends GetxController {
  var details = <Map<String, String>>[
    {"label": "Card No.", "value": "3843 4958 4483 4939"},
    {"label": "Card Name", "value": "Johnson Doe"},
    {"label": "Amount to Deposit", "value": "₦600,000.00"},
    {"label": "Transaction Charges", "value": "₦160.00"},
    {"label": "You will receive", "value": "₦599,840.00"},
  ].obs;
}
