import 'package:flutter/material.dart';
import 'package:food/Models/Cartpage_model.dart';
import 'package:food/widget.dart/check_out.dart';
import 'package:food/widget.dart/home_page.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartModel = Provider.of<CartModel>(context);

    return Scaffold(
      body: Container(
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
          child: Column(
            children: [
              AppBar(
                title: const Text(
                  'Cart Page',
                  style: TextStyle(color: Color.fromARGB(255, 90, 56, 37), fontFamily: 'Oswald'),
                ),
                backgroundColor: const Color(0xFFefe1dc),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Color.fromARGB(255, 90, 56, 37)),
                  onPressed: () {
                     Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage())
                   );
                  },
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: cartModel.items.length,
                  itemBuilder: (context, index) {
                    final item = cartModel.items[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            height: 120,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(width: .8, color: Colors.grey),
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Container(
                                    height: 100,
                                    width: 120,
                                    child: Image.asset(
                                      item['image'],
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item['name'],
                                          style: const TextStyle(
                                            color: Color.fromARGB(255, 90, 56, 37),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          maxLines: 1,
                                        ),
                                        Text(
                                          item['description'],
                                          style: const TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          maxLines: 1,
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(top: 20),
                                              child: Text(
                                                '\$${(item['price'] * item['quantity']).toStringAsFixed(1)}',
                                                style: const TextStyle(
                                                  color: Color.fromARGB(255, 90, 56, 37),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                            const Spacer(),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 18),
                                              child: Container(
                                                height: 35,
                                                width: 118,
                                                decoration: BoxDecoration(
                                                  color: Color(0xff8e593a),
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    IconButton(
                                                      icon: const Icon(Icons.add, color: Colors.white),
                                                      onPressed: () {
                                                        cartModel.items[index]['quantity']++;
                                                        cartModel.notifyListeners();
                                                      },
                                                    ),
                                                    Text(
                                                      '${item['quantity']}',
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                    IconButton(
                                                      icon: const Icon(Icons.remove, color: Colors.white),
                                                      onPressed: () {
                                                        if (cartModel.items[index]['quantity'] > 1) {
                                                          cartModel.items[index]['quantity']--;
                                                          cartModel.notifyListeners();
                                                        }
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: -10, // Adjust as needed
                            right: -10, // Adjust as needed
                            child: GestureDetector(
                              onTap: () {
                                cartModel.removeItem(index); // Remove item from cart
                              },
                              child: Container(
                                height: 35,
                                width: 35,
                                decoration: const BoxDecoration(
                                  color: Color(0xff8e593a),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(12),
                                    topRight: Radius.circular(12),
                                  ),
                                ),
                                child: const Icon(Icons.close, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 1, color: Color(0xff8e593a)),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'The price: \$${cartModel.totalPrice.toStringAsFixed(1)}',
                      style: TextStyle(color: Color(0xff8e593a), fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CheckOut()) 
                        );
                      },
                      child: Text('Check Out'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Color(0xff8e593a),
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
