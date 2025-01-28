import 'package:get/get.dart';

class ConfirmOrderController extends GetxController{
var details = <Map<String, String>>[
{"label": "Product", "value": "Macbook Pro 2021"},
{"label": "Unit Price", "value": "0.000000043BTC"},
{"label": "Quantity", "value": "1"},
{"label": "Total", "value": "0.000000086BTC"},
].obs;

var pin = ''.obs;

// Method to update the PIN
void updatePin(String value) {
  if (value.length <= 4) {
    pin.value = value;
  }
}
}