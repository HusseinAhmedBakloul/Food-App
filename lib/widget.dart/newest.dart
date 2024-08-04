import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food/Models/MyWish_page_model.dart';
import 'package:food/page%20of%20newest/chicken_burger.dart';
import 'package:food/page%20of%20newest/double_steak.dart';
import 'package:food/page%20of%20newest/family_tray.dart';
import 'package:food/page%20of%20newest/sandwich_Frid.dart';
import 'package:food/page%20of%20newest/stack.dart';
import 'package:provider/provider.dart';

class Newest extends StatelessWidget {
  const Newest({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SteakPotatoesPage()),
            );
          },
          child: _buildFoodItem(
            context,
            'images/istockphoto-146058150-612x612.jpg',
            'Steak & Potatoes',
            'A tray Steak & Potatoes',
            4.0,
            120,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SandwichFrid()),
            );
          },
          child: _buildFoodItem(
            context,
            'images/istockphoto-1656475347-612x612.jpg',
            'Fried Chicken',
            'A tray Fried Chicken',
            4.0,
            100,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChickenBurger()),
            );
          },
          child: _buildFoodItem(
            context,
            'images/istockphoto-1776252085-612x612.jpg',
            'Chicken Burger',
            'A tray Chicken Burger',
            4.0,
            110,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FamilyTray()),
            );
          },
          child: _buildFoodItem(
            context,
            'images/Screenshot 2024-02-25 223300.png',
            'Family Tray',
            'A tray of rice and meat',
            4.0,
            350,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DoubleSteak()),
            );
          },
          child: _buildFoodItem(
            context,
            'images/istockphoto-178482759-612x612.jpg',
            'Double Steak',
            'A tray Steak and Potatoes',
            4.0,
            220,
          ),
        ),
      ],
    );
  }

  Widget _buildFoodItem(
    BuildContext context,
    String imagePath,
    String title,
    String description,
    double rating,
    double price,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Container(
        height: 140,
        width: double.maxFinite,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: .4, color: Colors.grey),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              child: Image.asset(
                imagePath,
                height: 140,
                width: 150,
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              left: 160,
              top: 10,
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Color.fromARGB(255, 90, 56, 37),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              left: 160,
              top: 40,
              child: Text(
                description,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              left: 160,
              top: 70,
              child: RatingBar.builder(
                initialRating: rating,
                minRating: 1,
                direction: Axis.horizontal,
                itemCount: 5,
                itemSize: 18,
                itemPadding: const EdgeInsets.symmetric(horizontal: 6),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Color.fromARGB(255, 153, 94, 60),
                ),
                onRatingUpdate: (index) {},
              ),
            ),
            Positioned(
              left: 160,
              top: 90,
              child: Row(
                children: [
                  Text(
                    '\$$price',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 90, 56, 37),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 90),
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
          ],
        ),
      ),
    );
  }
}
