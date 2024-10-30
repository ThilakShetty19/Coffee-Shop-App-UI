import 'package:coffee_app_ui/models/coffee_item.dart';

class CartData {
  static final CartData _instance = CartData._internal();
  CartData._internal();
  factory CartData() {
    return _instance;
  }

  List<CoffeeItem> cartItems = [];

  // Getter to return the item counts
  List<int> get itemCounts {
    return cartItems.map((item) => item.quantity).toList();
  }

  void addOrIncreaseItem(CoffeeItem item) {
    int index = cartItems.indexWhere((cartItem) => cartItem.id == item.id);

    if (index != -1) {
      cartItems[index].quantity += 1;
    } else {
      item.quantity = 1;
      cartItems.add(item);
    }
  }

  void decreaseItem(CoffeeItem item) {
    int index = cartItems.indexWhere((cartItem) => cartItem.id == item.id);
    if (index != -1 && cartItems[index].quantity > 1) {
      cartItems[index].quantity -= 1;
    }
  }

  void removeItem(CoffeeItem item) {
    cartItems.remove(item);
  }

  List<CoffeeItem> getItems() {
    return cartItems;
  }
}
