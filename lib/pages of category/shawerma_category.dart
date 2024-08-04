import 'package:flutter/material.dart';
import 'package:food/Models/Cartpage_model.dart';
import 'package:provider/provider.dart';

class ShawermaCategory extends StatelessWidget {
  const ShawermaCategory({Key? key}) : super(key: key);

  final List<Map<String, String>> shawerma = const [
    {
      'imagePath': 'images/Screenshot_2024-07-19_074926-removebg-preview.png',
      'title': 'Veggie wrap filled with chicken',
      'description': 'Test Veggie wrap filled with chicken',
      'price': '\$130',
    },
    {
      'imagePath': 'images/Screenshot_2024-07-19_081552-removebg-preview.png',
      'title': 'Fruit crepe',
      'description': 'Test Fruit crepe',
      'price': '\$110',
    },
    {
      'imagePath': 'images/Screenshot_2024-07-19_075406-removebg-preview.png',
      'title': 'Kebab traditional',
      'description': 'Test Kebab traditional',
      'price': '\$120',
    },
    {
      'imagePath': 'images/Screenshot 2024-07-19 075627.png',
      'title': 'Pita stuffed with chicken',
      'description': 'Test Pita stuffed with chicken',
      'price': '\$70',
    },
    {
      'imagePath': 'images/Screenshot 2024-07-19 075744.png',
      'title': 'Mexican burritos',
      'description': 'Test Mexican burritos',
      'price': '\$75',
    },
    {
      'imagePath': 'images/Screenshot 2024-07-19 075909.png',
      'title': 'Chicken shawarma',
      'description': 'Test Chicken shawarma',
      'price': '\$80',
    },
    {
      'imagePath': 'images/Screenshot 2024-07-19 080032.png',
      'title': 'Beef shawarma',
      'description': 'Test Beef shawarma',
      'price': '\$90',
    },
    {
      'imagePath': 'images/Screenshot_2024-07-19_080237-removebg-preview.png',
      'title': 'Jalapeno peppers red sauce vegetables and beef',
      'description': 'Test jalapeno peppers red sauce vegetables and beef',
      'price': '\$80',
    },
    {
      'imagePath': 'images/Screenshot 2024-07-19 080533.png',
      'title': 'Pita with chicken',
      'description': 'Test Pita with chicken',
      'price': '\$90',
    },
    {
      'imagePath': 'images/Screenshot 2024-07-19 080659.png',
      'title': 'Chicken and spinach',
      'description': 'Test chicken and spinach',
      'price': '\$70',
    },
    {
      'imagePath': 'images/Screenshot_2024-07-19_080936-removebg-preview.png',
      'title': 'Greek gyros slices',
      'description': 'Test Greek gyros slices',
      'price': '\$120',
    },
    {
      'imagePath': 'images/Screenshot_2024-07-19_081141-removebg-preview.png',
      'title': 'Seasoned chicken rice',
      'description': 'Test seasoned chicken rice',
      'price': '\$130',
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
          'Choose your like shawerma',
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
                  itemCount: shawerma.length,
                  itemBuilder: (context, index) {
                    return FoodItem(
                      imagePath: shawerma[index]['imagePath']!,
                      title: shawerma[index]['title']!,
                      description: shawerma[index]['description']!,
                      price: shawerma[index]['price']!,
                      onAddToCart: () {
                        final price = double.parse(shawerma[index]['price']!.substring(1)); // remove $
                        cartModel.addItem(
                          shawerma[index]['title']!,
                          shawerma[index]['description']!,
                          price,
                          shawerma[index]['imagePath']!,
                          1,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${shawerma[index]['title']} added to cart!'),
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

class FoodItem extends StatelessWidget {
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
                      child: Image.asset(imagePath, height: 100),
                    ),
                  ),
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 90, 56, 37),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    description,
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
                price,
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
                onTap: onAddToCart,
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
