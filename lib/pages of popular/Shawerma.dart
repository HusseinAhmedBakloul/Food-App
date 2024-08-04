import 'package:flutter/material.dart';
import 'package:food/Models/Cartpage_model.dart';
import 'package:food/Models/MyWish_page_model.dart';
import 'package:food/widget.dart/home_page.dart';
import 'package:provider/provider.dart';


class Shawerma extends StatefulWidget {
  const Shawerma({Key? key}) : super(key: key);

  @override
  _ShawermaState createState() => _ShawermaState();
}

class _ShawermaState extends State<Shawerma> {
  int _value = 1;
  final double _basePrice = 90.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 208, 195),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color.fromARGB(255, 90, 56, 37)),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
        ),
        actions: [
          Consumer<MywishPageModel>(
            builder: (context, wishPageModel, child) {
              final isFavorite = wishPageModel.items.any(
                (item) => item['name'] == 'Shawerma' &&
                          item['description'] == 'Shawerma is served in warm pita bread with fresh vegetables, tangy pickles, and a drizzle of creamy tahini or garlic sauce, each bite offers a burst of rich, savory flavors and satisfying textures.',
              );
              return IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: Color.fromARGB(255, 90, 56, 37),
                ),
                onPressed: () {
                  setState(() {
                    if (isFavorite) {
                      wishPageModel.removeItem(
                        wishPageModel.items.indexWhere(
                          (item) => item['name'] == 'Shawerma' &&
                                    item['description'] == 'Shawerma is served in warm pita bread with fresh vegetables, tangy pickles, and a drizzle of creamy tahini or garlic sauce, each bite offers a burst of rich, savory flavors and satisfying textures.',
                        ),
                      );
                    } else {
                      wishPageModel.addItem(
                        'Shawerma',
                        'Shawerma is served in warm pita bread with fresh vegetables, tangy pickles, and a drizzle of creamy tahini or garlic sauce, each bite offers a burst of rich, savory flavors and satisfying textures.',
                        _basePrice,
                        'images/4bda0223-ffa9-4d99-bf1c-fb8f08203641-removebg-preview.png',
                      );
                    }
                  });
                },
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 110),
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(80),
                  topRight: Radius.circular(80),
                ),
                border: Border.all(
                  color: Color(0xff8e593a),
                  width: .5,
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 115),
                  _buildCounter(),
                  const SizedBox(height: 20),
                  _buildShawermaDescription(),
                  const SizedBox(height: 20),
                  _buildIngredientsSection(),
                  const SizedBox(height: 20),
                  _buildAddToCartButton(context),
                ],
              ),
            ),
          ),
          Positioned(
            right: 22,
            left: 22,
            bottom: 585,
            child: Image.asset('images/4bda0223-ffa9-4d99-bf1c-fb8f08203641-removebg-preview.png'),
          ),
        ],
      ),
    );
  }

  Widget _buildCounter() {
    return Container(
      height: 47,
      width: 125,
      decoration: BoxDecoration(
        color: Color(0xff8e593a),
        borderRadius: BorderRadius.circular(26),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.white),
            onPressed: () {
              setState(() {
                _value++;
              });
            },
          ),
          Text('$_value', style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
          IconButton(
            icon: const Icon(Icons.remove, color: Colors.white),
            onPressed: () {
              setState(() {
                if (_value > 1) _value--;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildShawermaDescription() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Shawerma',
            style: TextStyle(color: Color(0xff8e593a), fontSize: 28, fontWeight: FontWeight.bold, fontFamily: 'Oswald'),
          ),
          SizedBox(height: 10),
          Text(
            'Shawerma is served in warm pita bread with fresh vegetables, tangy pickles, and a drizzle of creamy tahini or garlic sauce, each bite offers a burst of rich, savory flavors and satisfying textures.',
            style: TextStyle(color: Color.fromARGB(220, 158, 158, 158), fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildIngredientsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: Text(
            'Ingredients',
            style: TextStyle(color: Color(0xff8e593a), fontSize: 22, fontWeight: FontWeight.bold, fontFamily: 'Oswald'),
          ),
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              _buildIngredientImage('images/Screenshot 2024-07-16 082408.png'),
              const SizedBox(width: 23),
              _buildIngredientImage('images/Screenshot 2024-06-13 203129.png'),
              const SizedBox(width: 23),
              _buildIngredientImage('images/Screenshot 2024-07-16 082709.png'),
              const SizedBox(width: 23),
              _buildIngredientImage('images/Screenshot 2024-07-16 082846.png'),
              const SizedBox(width: 23),
              _buildIngredientImage('images/Screenshot 2024-07-16 041630.png'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildIngredientImage(String imagePath) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Color(0xff8e593a),
          width: .4,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          imagePath,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget _buildAddToCartButton(BuildContext context) {
    double totalPrice = _basePrice * _value;

    return GestureDetector(
      onTap: () {
        final cartModel = Provider.of<CartModel>(context, listen: false);
        cartModel.addItem(
          'Shawerma',
          'Shawerma is served in warm pita bread with fresh vegetables, tangy pickles, and a drizzle of creamy tahini or garlic sauce, each bite offers a burst of rich, savory flavors and satisfying textures.',
          _basePrice,
          'images/4bda0223-ffa9-4d99-bf1c-fb8f08203641-removebg-preview.png',
          _value,
        );

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Added to cart!')),
        );
      },
      child: Row(
        children: [
          Container(
            height: 70,
            width: 180,
            child: Center(
              child: Text(
                '\$$totalPrice',
                style: const TextStyle(color: Color(0xff8e593a), fontSize: 40, fontWeight: FontWeight.bold, fontFamily: 'Oswald'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Container(
              height: 60,
              width: 188,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Color(0xff8e593a),
                borderRadius: BorderRadius.circular(32),
              ),
              child: const Center(
                child: Text(
                  'Add To Cart',
                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
