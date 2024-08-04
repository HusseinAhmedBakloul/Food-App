import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List<Map<String, dynamic>> _items = [];

  List<Map<String, dynamic>> get items => _items;

  double get totalPrice {
    double total = 0.0;
    for (var item in _items) {
      total += item['price'] * item['quantity'];
    }
    return total;
  }

  void addItem(String name, String description, double price, String image, int quantity) {
    final index = _items.indexWhere((item) => item['name'] == name && item['description'] == description);
    if (index == -1) {
      // العنصر غير موجود في السلة، أضفها كمثيل جديد
      _items.add({
        'name': name,
        'description': description,
        'price': price,
        'image': image,
        'quantity': quantity,
      });
    } else {
      // العنصر موجود، قم بتحديث الكمية
      _items[index]['quantity'] += quantity;
    }
    notifyListeners();
  }

  // إزالة عنصر من السلة
  void removeItem(int index) {
    if (index >= 0 && index < _items.length) {
      _items.removeAt(index);
      notifyListeners();
    }
  }

  // مسح جميع العناصر
  void clear() {
    _items.clear();
    notifyListeners();
  }
}
