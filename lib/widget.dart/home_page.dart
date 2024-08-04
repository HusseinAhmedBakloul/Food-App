import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/widget.dart/Popular.dart';
import 'package:food/widget.dart/Search.dart';
import 'package:food/widget.dart/appbar.dart';
import 'package:food/widget.dart/cartpage.dart';
import 'package:food/widget.dart/category.dart';
import 'package:food/widget.dart/drawerwidght.dart';
import 'package:food/widget.dart/newest.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawerwidght(),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffd8b4a7),
              Colors.white,
              Color(0xFFefe1dc)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          children: const [
            appbar(),
            Search(),
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                'Categories',
                style: TextStyle(
                  color: Color.fromARGB(255, 90, 56, 37),
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  fontFamily: 'Oswald'
                ),
              ),
            ),
            Category(),
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                'Popular',
                style: TextStyle(
                  color: Color.fromARGB(255, 90, 56, 37),
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  fontFamily: 'Oswald'
                ),
              ),
            ),
            Popular(),
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                'Newest',
                style: TextStyle(
                  color: Color.fromARGB(255, 90, 56, 37),
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  fontFamily: 'Oswald'
                ),
              ),
            ),
            Newest(),
          ],
        ),
      ),
      floatingActionButton: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          border: Border.all(width: .4, color: Colors.grey),
        ),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CartPage()),
            );
          },
          child: Icon(
            CupertinoIcons.cart,
            size: 36,
            color: Color(0xff8e593a),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
    );
  }
}
