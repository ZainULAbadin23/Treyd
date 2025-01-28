import 'package:get/get.dart';
import 'package:treyd_crypto/core/assets/constants.dart';

class ShopController extends GetxController {
  final sliderIndex = 0.obs;
  final selectedIndex = 0.obs;
  List<ShopCategories> servicesCategories = [
    ShopCategories(id: 1, category: "Gadgets"),
    ShopCategories(id: 1, category: "Sale"),
    ShopCategories(id: 1, category: "Techies"),
    ShopCategories(id: 1, category: "Fashion"),
    ShopCategories(id: 1, category: "Beauty"),
  ];
  var products = <Product>[
    Product(
      name: 'Macbook Pro 2021',
      description: '256GB SSD, 16GB, VGA...',
      priceInBTC: '0.00000043BTC',
      priceInUSD: '\$1,200',
      imageUrl: kPngLaptop, // Replace with actual image path
    ),
    Product(
      name: 'Airpod Max - Green',
      description: '256GB SSD, 16GB, VGA...',
      priceInBTC: '0.00000023BTC',
      priceInUSD: '\$1,200',
      imageUrl: kPngHeadPhones, // Replace with actual image path
    ),
    Product(
      name: 'Macbook Pro 2021',
      description: '256GB SSD, 16GB, VGA...',
      priceInBTC: '0.00000043BTC',
      priceInUSD: '\$1,200',
      imageUrl: kPngLaptop, // Replace with actual image path
    ),
    Product(
      name: 'Airpod Max - Green',
      description: '256GB SSD, 16GB, VGA...',
      priceInBTC: '0.00000023BTC',
      priceInUSD: '\$1,200',
      imageUrl: kPngHeadPhones, // Replace with actual image path
    ),
  ].obs;
}

class ShopCategories {
  final String category;
  final int id;

  ShopCategories({required this.id, required this.category});
}

class Product {
  final String name;
  final String description;
  final String priceInBTC;
  final String priceInUSD;
  final String imageUrl;

  Product({
    required this.name,
    required this.description,
    required this.priceInBTC,
    required this.priceInUSD,
    required this.imageUrl,
  });
}
