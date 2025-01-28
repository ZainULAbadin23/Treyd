import 'package:get/get.dart';
import 'package:treyd_crypto/core/assets/constants.dart';


class WalletController extends GetxController {
  // List of card data
  List cryptoCards = [
    {
      "name": "Bitcoin",
      "icon": kPngCryptoLogo1, // Replace with your asset path
      "price": 4500.00,
      "percentageChange": 4.5,
      "changeValue": 12.5,
      "amount": 0.0000056,
    },
    {
      "name": "Ethereum",
      "icon": kPngCryptoLogo,
      "price": 3200.50,
      "percentageChange": 3.2,
      "changeValue": 10.5,
      "amount": 0.002345,
    },
    {
      "name": "Dogecoin",
      "icon": kPngCryptoLogo1,
      "price": 0.25,
      "percentageChange": 1.5,
      "changeValue": 0.01,
      "amount": 1000.0,
    },
    {
      "name": "Bitcoin",
      "icon": kPngCryptoLogo1, // Replace with your asset path
      "price": 4500.00,
      "percentageChange": 4.5,
      "changeValue": 12.5,
      "amount": 0.0000056,
    },
    {
      "name": "Ethereum",
      "icon": kPngCryptoLogo,
      "price": 3200.50,
      "percentageChange": 3.2,
      "changeValue": 10.5,
      "amount": 0.002345,
    },
    {
      "name": "Dogecoin",
      "icon": kPngCryptoLogo1,
      "price": 0.25,
      "percentageChange": 1.5,
      "changeValue": 0.01,
      "amount": 1000.0,
    },
  ].obs;
}


  // List of card data
   // Using RxList for reactivity


