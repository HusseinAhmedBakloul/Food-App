import 'package:flutter/material.dart';
import 'package:food/Models/Cartpage_model.dart';
import 'package:provider/provider.dart';

class PizzaCategory extends StatelessWidget {
  const PizzaCategory({Key? key}) : super(key: key);

  final List<Map<String, String>> pizzas = const [
    {
      'imagePath': 'images/Screenshot 2024-07-17 083028.png',
      'title': 'Pictou County',
      'description': 'Pictou County pizza',
      'price': '\$90',
    },
    {
      'imagePath': 'images/Screenshot 2024-07-17 082719.png',
      'title': 'Olives pizza',
      'description': 'Test olives pizza',
      'price': '\$80',
    },
    {
      'imagePath': 'images/Screenshot 2024-07-17 082312.png',
      'title': 'Mushroom pizza',
      'description': 'Test Mushroom pizza',
      'price': '\$100',
    },
    {
      'imagePath': 'images/Screenshot 2024-07-17 082202.png',
      'title': 'Delicious italian',
      'description': 'Test Delicious italian',
      'price': '\$80',
    },
    {
      'imagePath': 'images/Screenshot 2024-07-17 082519.png',
      'title': 'Pepperoni isolated',
      'description': 'Test Pepperoni isolated',
      'price': '\$90',
    },
    {
      'imagePath': 'images/Screenshot 2024-07-17 080409.png',
      'title': 'Seafood pizza',
      'description': 'Test Seafood pizza',
      'price': '\$140',
    },
    {
      'imagePath': 'images/Screenshot 2024-07-17 072313.png',
      'title': 'Cheese pizza',
      'description': 'Test Cheese pizza',
      'price': '\$100',
    },
    {
      'imagePath': 'images/Screenshot 2024-07-17 072214.png',
      'title': 'Seafood pizza',
      'description': 'Test Seafood pizza',
      'price': '\$140',
    },
    {
      'imagePath': 'images/Screenshot 2024-07-17 071545.png',
      'title': 'Wooden tray',
      'description': 'Pizza on wooden tray',
      'price': '\$110',
    },
    {
      'imagePath': 'images/Screenshot 2024-07-17 071254.png',
      'title': 'Hawaiian pizza',
      'description': 'Test Hawaiian pizza',
      'price': '\$120',
    },
    {
      'imagePath': 'images/Screenshot 2024-07-17 071002.png',
      'title': 'Negresco pizza',
      'description': 'Test Negresco pizza',
      'price': '\$130',
    },
    {
      'imagePath': 'images/Screenshot 2024-07-17 070551.png',
      'title': 'Hibiscus',
      'description': 'Test Hibiscus juice',
      'price': '\$120',
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
          'Choose your like pizza',
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
                  itemCount: pizzas.length,
                  itemBuilder: (context, index) {
                    return FoodItem(
                      imagePath: pizzas[index]['imagePath']!,
                      title: pizzas[index]['title']!,
                      description: pizzas[index]['description']!,
                      price: pizzas[index]['price']!,
                      onAddToCart: () {
                        final price = double.parse(pizzas[index]['price']!.substring(1)); // remove $
                        cartModel.addItem(
                          pizzas[index]['title']!,
                          pizzas[index]['description']!,
                          price,
                          pizzas[index]['imagePath']!,
                          1,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${pizzas[index]['title']} added to cart!'),
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
