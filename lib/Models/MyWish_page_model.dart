import 'package:flutter/cupertino.dart';

class MywishPageModel extends ChangeNotifier {
  final List<Map<String, dynamic>> _items = [];

  List<Map<String, dynamic>> get items => _items;

  // إضافة عنصر إلى المفضلة
  void addItem(String name, String description, double price, String image) {
    final index = _items.indexWhere((item) =>
        item['name'] == name && item['description'] == description);

    // إذا لم يكن العنصر موجودًا، أضف العنصر كمثيل جديد
    if (index == -1) {
      _items.add({
        'name': name,
        'description': description,
        'price': price,
        'image': image,
        
      });
      notifyListeners();
    }
  }

  // إزالة عنصر من المفضلة بناءً على الفهرس
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
