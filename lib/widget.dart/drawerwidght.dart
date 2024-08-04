import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/login/WelcomeScreen.dart';
import 'package:food/widget.dart/MyAccount.dart';
import 'package:food/widget.dart/cartpage.dart';
import 'package:food/widget.dart/home_page.dart';
import 'package:food/widget.dart/my_wish_list.dart';


class Drawerwidght extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
         gradient: LinearGradient(
         colors: [
        Colors.white,
        Color(0xFFefe1dc),
       ],
         begin: Alignment.topCenter,
         end: Alignment.bottomCenter,
       ),
      ),
        child: ListView(
          children:  [
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color:Color(0xffd8b4a7),
              ),
              accountName: Text(
                'HusseinAhmed',
                style: TextStyle(color: Color.fromARGB(255, 90, 56, 37), fontWeight: FontWeight.bold, fontSize: 14),
              ),
              accountEmail: Text(
                'HusseinAhmed@gmail.com',
                style: TextStyle(color: Color.fromARGB(255, 90, 56, 37), fontWeight: FontWeight.bold, fontSize: 14),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('images/pngtree-avatar-vector-icon-white-background-png-image_1870181.jpg'),
              ),
            ),
             ListTile(
              leading: const Icon(CupertinoIcons.home, color: Color.fromARGB(255, 90, 56, 37)),
              title: const Text(
                'Home',
                style: TextStyle(color: Color.fromARGB(255, 90, 56, 37), fontWeight: FontWeight.bold, fontSize: 18),
              ),
                onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(CupertinoIcons.cart, color: Color.fromARGB(255, 90, 56, 37)),
              title: const Text(
                'My Order',
                style: TextStyle(color: Color.fromARGB(255, 90, 56, 37), fontWeight: FontWeight.bold, fontSize: 18),
              ),
               onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartPage()),
                );
              },
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(CupertinoIcons.heart_fill, color: Color.fromARGB(255, 90, 56, 37)),
              title: const Text(
                'My Wish List',
                style: TextStyle(color: Color.fromARGB(255, 90, 56, 37), fontWeight: FontWeight.bold, fontSize: 18),
              ),
               onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyWishList()),
                );
              },
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(CupertinoIcons.person, color: Color.fromARGB(255, 90, 56, 37)),
              title: const Text(
                'My Account',
                style: TextStyle(color: Color.fromARGB(255, 90, 56, 37), fontWeight: FontWeight.bold, fontSize: 18),
              ),
               onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyAccount()),
                );
              },
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.exit_to_app, color: Color.fromARGB(255, 90, 56, 37)),
              title: const Text(
                'Log out',
                style: TextStyle(color: Color.fromARGB(255, 90, 56, 37), fontWeight: FontWeight.bold, fontSize: 18),
              ),
               onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const WelcomeScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
