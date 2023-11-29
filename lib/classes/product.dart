import 'package:eng_app_v2/classes/category.dart';

class Product {

  String assetPath;  
  String seller;
  int price;
  Category category;
  DateTime setupDate;

  Product({required this.assetPath, required this.seller, required this.price, required this.category, required this.setupDate});

}