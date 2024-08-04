import 'package:flutter/material.dart';
import 'package:food/Models/MyWish_page_model.dart';
import 'package:provider/provider.dart';

class MyWishList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                'My Wish List',
                style: TextStyle(color: Color.fromARGB(255, 90, 56, 37), fontFamily: 'Oswald'),
              ),
              backgroundColor: Color(0xFFefe1dc),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Color.fromARGB(255, 90, 56, 37)),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Expanded(
              child: Consumer<MywishPageModel>(
                builder: (context, myWishPageModel, child) {
                  return ListView.builder(
                    itemCount: myWishPageModel.items.length,
                    itemBuilder: (context, index) {
                      final item = myWishPageModel.items[index];
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
                                                  '\$${item['price']}',
                                                  style: const TextStyle(
                                                    color: Color.fromARGB(255, 90, 56, 37),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18,
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
                              top: -10,
                              right: -10,
                              child: GestureDetector(
                                onTap: () {
                                  myWishPageModel.removeItem(index);
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
