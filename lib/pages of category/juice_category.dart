import 'package:flutter/material.dart';
import 'package:food/Models/Cartpage_model.dart';
import 'package:provider/provider.dart';

class JuiceCategory extends StatelessWidget {
  const JuiceCategory({Key? key}) : super(key: key);

  final List<Map<String, String>> juice = const [
    {
      'imagePath': 'images/image_1024-removebg-preview.png',
      'title': 'Spero spaties',
      'description': 'Spero spaties orange',
      'price': '\$12',
    },
    {
      'imagePath': 'images/Screenshot_2024-07-16_073852-removebg-preview.png',
      'title': 'Spero spaties',
      'description': 'Spero spaties apple',
      'price': '\$12',
    },
    {
      'imagePath': 'images/Screenshot_2024-07-16_074034-removebg-preview.png',
      'title': 'Spero spaties',
      'description': 'Spero spaties lemon',
      'price': '\$12',
    },
    {
      'imagePath': 'images/Screenshot_2024-07-16_074143-removebg-preview.png',
      'title': 'Spero spaties',
      'description': 'Spero spaties kiwi',
      'price': '\$12',
    },
    {
      'imagePath': 'images/Screenshot_2024-07-16_074235-removebg-preview.png',
      'title': 'Spero spaties',
      'description': 'Spero spaties suda lemon',
      'price': '\$12',
    },
    {
      'imagePath': 'images/Screenshot_2024-07-16_074343-removebg-preview.png',
      'title': 'Spero spaties',
      'description': 'Spero spaties pineapple',
      'price': '\$12',
    },
    {
      'imagePath': 'images/Screenshot_2024-07-17_052616-removebg-preview.png',
      'title': 'Orange juice',
      'description': 'Test Orange juice',
      'price': '\$30',
    },
    {
      'imagePath': 'images/Screenshot_2024-07-17_052646-removebg-preview.png',
      'title': 'Mango juice',
      'description': 'Test Mango juice',
      'price': '\$35',
    },
    {
      'imagePath': 'images/Screenshot_2024-07-17_052857-removebg-preview.png',
      'title': 'Sobia juice',
      'description': 'Test Sobia juice',
      'price': '\$20',
    },
    {
      'imagePath': 'images/Screenshot_2024-07-17_054301-removebg-preview.png',
      'title': 'Strawberry juice',
      'description': 'Test Strawberry juice',
      'price': '\$40',
    },
    {
      'imagePath': 'images/Screenshot_2024-07-17_054422-removebg-preview.png',
      'title': 'Red berry juice',
      'description': 'Test Red berry juice',
      'price': '\$40',
    },
    {
      'imagePath': 'images/Screenshot_2024-07-17_054455-removebg-preview.png',
      'title': 'Hibiscus juice',
      'description': 'Test Hibiscus juice',
      'price': '\$25',
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
          'Choose your like juice',
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
                  itemCount: juice.length,
                  itemBuilder: (context, index) {
                    return FoodItem(
                      imagePath: juice[index]['imagePath']!,
                      title: juice[index]['title']!,
                      description: juice[index]['description']!,
                      price: juice[index]['price']!,
                      onAddToCart: () {
                        final price = double.parse(juice[index]['price']!.substring(1)); // remove $
                        cartModel.addItem(
                          juice[index]['title']!,
                          juice[index]['description']!,
                          price,
                          juice[index]['imagePath']!,
                          1,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${juice[index]['title']} added to cart!'),
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
