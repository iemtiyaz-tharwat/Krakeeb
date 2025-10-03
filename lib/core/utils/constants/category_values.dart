import 'package:krakeeb/features/home/models/waste_item_model.dart';

class CategoryValues {
  static const int metalPrice = 10;
  static const int plasticPrice = 20;
  static const int oilPrice = 12;
  static const int electronicPrice = 10;
  static const int paperPrice = 10;
  static const int cartonPrice = 10;
  static List<WasteItem> wasteItems = [
    WasteItem(
      title: "metal waste",
      imagePath: "assets/images/metal.svg",
      price: "$metalPrice pounds per 1 Kg",
    ),
    WasteItem(
      title: "Plastic waste",
      imagePath: "assets/images/plastic.svg",
      price: "$plasticPrice pounds per 1 Kg",
    ),
    WasteItem(
      title: "oil waste",
      imagePath: "assets/images/oil.svg",
      price: "$oilPrice pounds per 1 Kg",
    ),
    WasteItem(
      title: "Electronic waste",
      imagePath: "assets/images/electronic.svg",
      price: "$electronicPrice pounds per 1 Kg",
    ),
    WasteItem(
      title: "Paper waste",
      imagePath: "assets/images/paper.svg",
      price: "$paperPrice pounds per 1 Kg",
    ),
    WasteItem(
      title: "Carton waste",
      imagePath: "assets/images/carton.svg",
      price: "$cartonPrice pounds per 1 Kg",
    ),
  ];
}
