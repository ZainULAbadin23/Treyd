import 'package:get/get.dart';
class TransferCryptoController extends GetxController {
  var details = <Map<String, String>>[
    {"label": "Coin", "value": "Tether"},
    {"label": "Wallet Address", "value": "48394u83uc483jjds884334"},
    {"label": "Wallet Name", "value": "John Doe"},
    {"label": "Network", "value": "TRC"},
    {"label": "Amount you will receive", "value": "2,000 USDT"},
  ].obs;
}