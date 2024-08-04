import 'package:flutter/material.dart';
import 'package:food/pages%20of%20category/Burger_category.dart';
import 'package:food/pages%20of%20category/crepe_category.dart';
import 'package:food/pages%20of%20category/juice_category.dart';
import 'package:food/pages%20of%20category/pizza_category.dart';
import 'package:food/pages%20of%20category/salat_category.dart';
import 'package:food/pages%20of%20category/shawerma_category.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  Widget buildCategoryItem(String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey,width: .4)
        ),
        child: Image.asset(
          imagePath,
          height: 50,
          width: 50,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  JuiceCategory()),
                ); 
              },
              child: buildCategoryItem('images/Screenshot 2024-07-16 024757.png')
            ),
             GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  PizzaCategory()),
                ); 
              },
            child: buildCategoryItem('images/Screenshot 2024-07-16 023454.png')
           ),
             GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  CrepeCategory()),
                ); 
              },
              child: buildCategoryItem('images/Screenshot 2024-07-16 023744.png')
            ),
             GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  BurgerCategory()),
                ); 
              },
              child: buildCategoryItem('images/pngtree-burger-png-images-png-image_13164941.png')
            ),
             GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  SalatCategory()),
                ); 
              },
              child: buildCategoryItem('images/Screenshot 2024-07-16 025802.png')
            ),
             GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  ShawermaCategory()),
                ); 
              },
              child: buildCategoryItem('images/Screenshot 2024-07-16 024334.png')
            ),
          ],
        ),
      ),
    );
  }
}
