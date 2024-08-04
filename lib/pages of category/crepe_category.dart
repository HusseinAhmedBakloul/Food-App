import 'package:flutter/material.dart';
import 'package:food/Models/Cartpage_model.dart';
import 'package:provider/provider.dart';

class CrepeCategory extends StatelessWidget {
  const CrepeCategory({Key? key}) : super(key: key);

  final List<Map<String, String>> crepe = const [
    {
      'imagePath': 'images/Screenshot 2024-07-18 204706.png',
      'title': 'Butter and sugar crepe',
      'description': 'Test Butter and sugar crepe',
      'price': '\$65',
    },
    {
      'imagePath': 'images/Screenshot 2024-07-18 204737.png',
      'title': 'Fruit crepe',
      'description': 'Test Fruit crepe',
      'price': '\$100',
    },
    {
      'imagePath': 'images/Screenshot 2024-07-18 204836.png',
      'title': 'Nutella crepe',
      'description': 'Test Nutella crepe',
      'price': '\$75',
    },
    {
      'imagePath': 'images/Screenshot 2024-07-18 204917.png',
      'title': 'Strawberry jam crepe',
      'description': 'Test Strawberry jam crepe',
      'price': '\$70',
    },
    {
      'imagePath': 'images/Screenshot 2024-07-18 205102.png',
      'title': 'Coconut crepe',
      'description': 'Test Coconut crepe',
      'price': '\$65',
    },
    {
      'imagePath': 'images/Screenshot_2024-07-18_205623-removebg-preview.png',
      'title': 'Negresco crepe',
      'description': 'Test Negresco crepe',
      'price': '\$80',
    },
    {
      'imagePath': 'images/Screenshot_2024-07-18_205214-removebg-preview.png',
      'title': 'Potato crepe',
      'description': 'Test Potato crepe',
      'price': '\$70',
    },
    {
      'imagePath': 'images/Screenshot_2024-07-18_205525-removebg-preview.png',
      'title': 'Cheese crepe',
      'description': 'Test Cheese crepe',
      'price': '\$60',
    },
    {
      'imagePath': 'images/Screenshot_2024-07-18_205709-removebg-preview.png',
      'title': 'Meat crepe',
      'description': 'Test Meat crepe',
      'price': '\$90',
    },
    {
      'imagePath': 'images/Screenshot_2024-07-18_205933-removebg-preview.png',
      'title': 'Mushroom crepe',
      'description': 'Test Mushroom crepe',
      'price': '\$70',
    },
    {
      'imagePath': 'images/Screenshot_2024-07-18_210915-removebg-preview.png',
      'title': 'Egg crepe',
      'description': 'Test Egg crepe',
      'price': '\$50',
    },
    {
      'imagePath': 'images/Screenshot_2024-07-18_210136-removebg-preview.png',
      'title': 'Salmon crepe',
      'description': 'Test Salmon crepe',
      'price': '\$90',
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
          'Choose your like crepe',
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
                  itemCount: crepe.length,
                  itemBuilder: (context, index) {
                    return FoodItem(
                      imagePath: crepe[index]['imagePath']!,
                      title: crepe[index]['title']!,
                      description: crepe[index]['description']!,
                      price: crepe[index]['price']!,
                      onAddToCart: () {
                        final price = double.parse(crepe[index]['price']!.substring(1)); // remove $
                        cartModel.addItem(
                          crepe[index]['title']!,
                          crepe[index]['description']!,
                          price,
                          crepe[index]['imagePath']!,
                          1,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${crepe[index]['title']} added to cart!'),
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
