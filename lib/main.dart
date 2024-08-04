import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food/Models/Account_model.dart';
import 'package:food/Models/Cartpage_model.dart';
import 'package:food/Models/MyWish_page_model.dart';
import 'package:food/widget.dart/cartpage.dart';
import 'package:food/widget.dart/home_page.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyCL-CnU0nm7bDQp5C6mc_e57IJczJ4OR-U",
      appId: "1:175293588385:web:2635064fa556b0816a61e0",
      messagingSenderId: "175293588385",
      projectId: "fir-food-28a3e",
    ),
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AccountModel()),
        ChangeNotifierProvider(create: (context) => CartModel()),
        ChangeNotifierProvider(create: (context) => MywishPageModel()),
      ],
      child:  FoodApp(), 
    ),
  );
}
class FoodApp extends StatelessWidget {
  const FoodApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      initialRoute: "/",
      routes: {
        "/": (context) => const HomePage(),
        '/cart': (context) =>  CartPage(),
      },  
    );
  }
}
