import 'package:flutter/material.dart';
import 'package:food/Models/MyWish_page_model.dart';
import 'package:food/pages%20of%20popular/Burger.dart';
import 'package:food/pages%20of%20popular/Fried_chicken.dart';
import 'package:food/pages%20of%20popular/PizzaPage.dart';
import 'package:food/pages%20of%20popular/Shawerma.dart';
import 'package:food/pages%20of%20popular/Spero_spathes.dart';
import 'package:food/pages%20of%20popular/Whole_chicken.dart';
import 'package:provider/provider.dart';

class Popular extends StatelessWidget {
  const Popular({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: Row(
          children: [
            _buildFoodItem(
              context,
              'images/Screenshot 2024-02-24 231954.png',
              'Pizza',
              'Test our pizza',
              80.0,
              PizzaPage(),
            ),
            _buildFoodItem(
              context,
              'images/Screenshot 2024-07-16 025028.png',
              'Whole chicken',
              'Test chicken curry',
              230.0,
              Wholechicken(),
            ),
            _buildFoodItem(
              context,
              'images/download (1).jpeg',
              'Fried Chicken',
              'Test Fried Chicken',
              50.0,
              FriedChicken(),
            ),
            _buildFoodItem(
              context,
              'images/pngtree-burger-png-images-png-image_13164941.png',
              'Burger',
              'Test our hot Burger',
              120.0,
              Burger(),
            ),
            _buildFoodItem(
              context,
              'images/image_1024.jpeg',
              'Spero Spathis',
              'Test Spero Spathis',
              12.0,
              SperoSpathes(),
            ),
            _buildFoodItem(
              context,
              'images/4bda0223-ffa9-4d99-bf1c-fb8f08203641.jpg',
              'Shawarma',
              'Test our Shawarma',
              90.0,
              Shawerma(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFoodItem(BuildContext context, String imagePath, String title, String description, double price, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: FoodItem(
        imagePath: imagePath,
        title: title,
        description: description,
        price: price,
      ),
    );
  }
}

class FoodItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final double price;

  const FoodItem({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 200,
        width: 150,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey, width: .4),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Image.asset(imagePath, height: 100, fit: BoxFit.contain),
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
            Positioned(
              top: 158,
              left: 10,
              child: Text(
                '\$$price',
                style: const TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 90, 56, 37),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              top: 145,
              left: 95,
              child: Consumer<MywishPageModel>(
                builder: (context, wishPageModel, child) {
                  final isFavorite = wishPageModel.items.any((item) => item['name'] == title && item['description'] == description);
                  return IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      size: 19,
                      color: Color(0xff8e593a),
                    ),
                    onPressed: () {
                      if (isFavorite) {
                        wishPageModel.removeItem(wishPageModel.items.indexWhere((item) => item['name'] == title && item['description'] == description));
                      } else {
                        wishPageModel.addItem(title, description, price, imagePath);
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
