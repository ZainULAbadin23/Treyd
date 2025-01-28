import 'package:get/get.dart';

class TradeController extends GetxController{
  final selectedIndex = 0.obs;
  List<DateCategories> servicesCategories = [
    DateCategories(id: 1, category: "Today"),
    DateCategories(id: 1, category: "1 w"),
    DateCategories(id: 1, category: "1 m"),
    DateCategories(id: 1, category: "3 m"),
    DateCategories(id: 1, category: "1 y"),
  ];

  var details = <Map<String, String>>[
    {"title": "Top 5"},
    {"title": "Top Losers"},
    {"title": "Top Gainers"},
    {"title": "Popular Pairs"},
  ].obs;
}

class DateCategories {
  final String category;
  final int id;
  DateCategories({required this.id, required this.category});
}