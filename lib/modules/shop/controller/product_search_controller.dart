import 'package:get/get.dart';

class ProductSearchController extends GetxController{
  final selectedIndex = 0.obs;
  List<ShopCategories> servicesCategories = [
    ShopCategories(id: 1, category: "All"),
    ShopCategories(id: 1, category: "Gadgets"),
    ShopCategories(id: 1, category: "Sale"),
    ShopCategories(id: 1, category: "Techies"),
    ShopCategories(id: 1, category: "Fashion"),
    ShopCategories(id: 1, category: "Beauty"),
  ];
}

class ShopCategories {
  final String category;
  final int id;

  ShopCategories({required this.id, required this.category});
}