import 'package:flutter/material.dart';
import 'package:food/Models/Cartpage_model.dart';
import 'package:provider/provider.dart';

class SalatCategory extends StatelessWidget {
  const SalatCategory({Key? key}) : super(key: key);

  final List<Map<String, String>> salad = const [
    {
      'imagePath': 'images/Screenshot_2024-07-19_071536-removebg-preview.png',
      'title': 'Caesar salad',
      'description': 'Test Caesar salad',
      'price': '\$35',
    },
    {
      'imagePath': 'images/Screenshot 2024-07-19 071900.png',
      'title': 'mushrooms and marinated cucumbers',
      'description': 'Test mushrooms and marinated cucumbers',
      'price': '\$25',
    },
    {
      'imagePath': 'images/Screenshot_2024-07-19_072003-removebg-preview.png',
      'title': 'Fresh vegetable salad',
      'description': 'Test Fresh vegetable salad',
      'price': '\$25',
    },
    {
      'imagePath': 'images/Screenshot_2024-07-19_072154-removebg-preview.png', 
      'title': 'Grilled caesar salad',
      'description': 'Test Grilled caesar salad',
      'price': '\$30',
    },
    {
      'imagePath': 'images/Screenshot 2024-07-19 072356.png',
      'title': 'Turkish Salad',
      'description': 'Test Turkish Salad',
      'price': '\$45',
    },
    {
      'imagePath': 'images/Screenshot 2024-07-19 072606.png',
      'title': 'Autumn salad',
      'description': 'Test Autumn salad apple',
      'price': '\$40',
    },
    {
      'imagePath': 'images/Screenshot_2024-07-19_072746-removebg-preview.png',
      'title': 'Healthy fresh salad',
      'description': 'Test Healthy fresh salad',
      'price': '\$35',
    },
    {
      'imagePath': 'images/Screenshot_2024-07-19_072931-removebg-preview.png',
      'title': 'avocado cucumber',
      'description': 'Test avocado cucumber',
      'price': '\$40',
    },
    {
      'imagePath': 'images/Screenshot_2024-07-19_073203-removebg-preview.png',
      'title': 'bechamel sauce',
      'description': 'Tasty bechamel sauce',
      'price': '\$15',
    },
    {
      'imagePath': 'images/Screenshot_2024-07-19_073410-removebg-preview.png',
      'title': 'Ketchup',
      'description': 'Test Ketchup',
      'price': '\$15',
    },
    {
      'imagePath': 'images/Screenshot_2024-07-19_073829-removebg-preview.png',
      'title': 'Sour cream',
      'description': 'Test Sour cream sauce',
      'price': '\$15',
    },
    {
      'imagePath': 'images/Screenshot_2024-07-19_074115-removebg-preview.png',
      'title': 'cheese sauce',
      'description': 'Test cheese sauce',
      'price': '\$15',
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
          'Choose your like salad',
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
                  itemCount: salad.length,
                  itemBuilder: (context, index) {
                    return FoodItem(
                      imagePath: salad[index]['imagePath']!,
                      title: salad[index]['title']!,
                      description: salad[index]['description']!,
                      price: salad[index]['price']!,
                      onAddToCart: () {
                        final price = double.parse(salad[index]['price']!.substring(1)); // remove $
                        cartModel.addItem(
                          salad[index]['title']!,
                          salad[index]['description']!,
                          price,
                          salad[index]['imagePath']!,
                          1,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${salad[index]['title']} added to cart!'),
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
