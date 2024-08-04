import 'package:flutter/material.dart';
import 'package:food/Models/Cartpage_model.dart';
import 'package:food/Models/MyWish_page_model.dart';
import 'package:provider/provider.dart';


class Burger extends StatefulWidget {
  const Burger({Key? key}) : super(key: key);

  @override
  _BurgerState createState() => _BurgerState();
}

class _BurgerState extends State<Burger> {
  int _value = 1;
  final double _basePrice = 120.0;

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
            Navigator.pop(context);
          },
        ),
        actions: [
          Consumer<MywishPageModel>(
            builder: (context, wishPageModel, child) {
              final isFavorite = wishPageModel.items.any(
                (item) => item['name'] == 'Burger' &&
                          item['description'] == 'A juicy, perfectly grilled beef patty topped with fresh lettuce, ripe tomatoes, crunchy pickles, and melted cheese, This classic burger delivers a mouthwatering experience with every bite.',
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
                          (item) => item['name'] == 'Burger' &&
                                    item['description'] == 'A juicy, perfectly grilled beef patty topped with fresh lettuce, ripe tomatoes, crunchy pickles, and melted cheese, This classic burger delivers a mouthwatering experience with every bite.',
                        ),
                      );
                    } else {
                      wishPageModel.addItem(
                        'Burger',
                        'A juicy, perfectly grilled beef patty topped with fresh lettuce, ripe tomatoes, crunchy pickles, and melted cheese, This classic burger delivers a mouthwatering experience with every bite.',
                        _basePrice,
                        'images/pngtree-burger-png-images-png-image_13164941-removebg-preview.png',
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
                  _buildBurgerDescription(),
                  const SizedBox(height: 20),
                  _buildIngredientsSection(),
                  const SizedBox(height: 20),
                  _buildAddToCartButton(context),
                ],
              ),
            ),
          ),
          Positioned(
            right: 72,
            left: 72,
            bottom: 540,
            child: Image.asset('images/pngtree-burger-png-images-png-image_13164941-removebg-preview.png'),
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

  Widget _buildBurgerDescription() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Burger',
            style: TextStyle(color: Color(0xff8e593a), fontSize: 28, fontWeight: FontWeight.bold, fontFamily: 'Oswald'),
          ),
          SizedBox(height: 10),
          Text(
            'A juicy, perfectly grilled beef patty topped with fresh lettuce, ripe tomatoes, crunchy pickles, and melted cheese, This classic burger delivers a mouthwatering experience with every bite.',
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
              _buildIngredientImage('images/Screenshot 2024-07-16 065640.png'),
              const SizedBox(width: 23),
              _buildIngredientImage('images/Screenshot 2024-07-16 065959.png'),
              const SizedBox(width: 23),
              _buildIngredientImage('images/Screenshot 2024-07-16 070243.png'),
              const SizedBox(width: 23),
              _buildIngredientImage('images/Screenshot 2024-06-13 203129.png'),
              const SizedBox(width: 23),
              _buildIngredientImage('images/Screenshot 2024-07-16 070437.png'),
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
        Provider.of<CartModel>(context, listen: false).addItem(
          'Burger',
          'A juicy, perfectly grilled beef patty topped with fresh lettuce, ripe tomatoes, crunchy pickles, and melted cheese.',
          _basePrice,
          'images/pngtree-burger-png-images-png-image_13164941-removebg-preview.png',
          _value,
        );
        Navigator.pushNamed(context, '/cart');
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
