import 'package:flutter/material.dart';
import 'package:food/Models/Cartpage_model.dart';
import 'package:provider/provider.dart';

class BurgerCategory extends StatelessWidget {
  const BurgerCategory({Key? key}) : super(key: key);

  final List<Map<String, String>> burger = const [
    {
      'imagePath': 'images/Screenshot 2024-07-19 063238.png',
      'title': 'Meat and chesses',
      'description': 'Test burger meat,chesses',
      'price': '\$120',
    },
    {
      'imagePath': 'images/Screenshot 2024-07-19 063635.png',
      'title': 'mushrooms and marinated cucumbers',
      'description': 'Test mushrooms and marinated cucumbers',
      'price': '\$100',
    },
    {
      'imagePath': 'images/Screenshot 2024-07-19 062715.png',
      'title': 'Negresco burger',
      'description': 'Test Negresco burger',
      'price': '\$130',
    },
    {
      'imagePath': 'images/Screenshot 2024-07-19 062653.png',
      'title': 'Pane burger',
      'description': 'Test Pane burger',
      'price': '\$110',
    },
    {
      'imagePath': 'images/Screenshot 2024-07-19 064254.png',
      'title': 'Salad and onion',
      'description': 'Test salad and onion',
      'price': '\$80',
    },
    {
      'imagePath': 'images/Screenshot_2024-07-19_064502-removebg-preview.png',
      'title': 'Bagel with shrimp',
      'description': 'Test bagel with shrimp',
      'price': '\$90',
    },
    {
      'imagePath': 'images/Screenshot_2024-07-19_064752-removebg-preview.png',
      'title': 'Avocado and feta',
      'description': 'Test avocado and feta',
      'price': '\$80',
    },
    {
      'imagePath': 'images/Screenshot_2024-07-19_065002-removebg-preview.png',
      'title': 'Cheeseburger with a chicken',
      'description': 'Test Cheeseburger with a chicken',
      'price': '\$100',
    },
    {
      'imagePath': 'images/Screenshot_2024-07-19_065634-removebg-preview.png',
      'title': 'Juicy beef Burger',
      'description': 'Test Juicy beef Burger',
      'price': '\$120',
    },
    {
      'imagePath': 'images/Screenshot_2024-07-19_065947-removebg-preview (1).png',
      'title': 'Potato burger',
      'description': 'Test Potato burger',
      'price': '\$80',
    },
    {
      'imagePath': 'images/Screenshot_2024-07-19_070430-removebg-preview.png',
      'title': 'Chicken burger',
      'description': 'Test Chicken burger',
      'price': '\$90',
    },
    {
      'imagePath': 'images/Screenshot_2024-07-19_070610-removebg-preview.png',
      'title': 'Fried chicken burger',
      'description': 'Test Fried chicken burger',
      'price': '\$125',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0xFFefe1dc),
        title: const Text(
          'Choose your like burger',
          style: TextStyle(
            color: Color.fromARGB(255, 90, 56, 37),
            fontWeight: FontWeight.bold,
            fontSize: 22,
            fontFamily: 'Oswald',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xffd8b4a7),
                Colors.white,
                Color(0xFFefe1dc),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: Consumer<CartModel>(
              builder: (context, cartModel, child) {
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.85,
                  ),
                  itemCount: burger.length,
                  itemBuilder: (context, index) {
                    return FoodItem(
                      imagePath: burger[index]['imagePath']!,
                      title: burger[index]['title']!,
                      description: burger[index]['description']!,
                      price: burger[index]['price']!,
                      onAddToCart: () {
                        cartModel.addItem(
                          burger[index]['title']!,
                          burger[index]['description']!,
                          double.parse(burger[index]['price']!.substring(1)), // remove $
                          burger[index]['imagePath']!,
                          1, // افترض إضافة كمية واحدة في كل مرة
                        );
                        // عرض الرسالة باستخدام SnackBar
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${burger[index]['title']} added to cart'),
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

// FoodItem لعرض كل عنصر برغر
class FoodItem extends StatefulWidget {
  final String imagePath;
  final String title;
  final String description;
  final String price;
  final VoidCallback onAddToCart;

  const FoodItem({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.price,
    required this.onAddToCart,
  }) : super(key: key);

  @override
  _FoodItemState createState() => _FoodItemState();
}

class _FoodItemState extends State<FoodItem> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Container(
        height: 180,
        width: 160,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey, width: 0.4),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Center(
                      child: Image.asset(widget.imagePath, height: 100),
                    ),
                  ),
                  Text(
                    widget.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 90, 56, 37),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.description,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 6,
              left: 20,
              child: Text(
                widget.price,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 90, 56, 37),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: widget.onAddToCart,
                child: Container(
                  height: 35,
                  width: 35,
                  decoration: const BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                    ),
                  ),
                  child: const Icon(Icons.add, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
