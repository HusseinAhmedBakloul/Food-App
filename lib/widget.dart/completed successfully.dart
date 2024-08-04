import 'package:flutter/material.dart';
import 'package:food/widget.dart/home_page.dart';
import 'package:lottie/lottie.dart';

class Completedsuccessfully extends StatelessWidget {
  const Completedsuccessfully({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LottieBuilder.asset(
                  'Lottie/Animation - 1721677009678.json',
                  height: 400, // Adjust size as needed
                  repeat: true,
                ),
                const Text(
                  'Thank you for completing your order',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 90, 56, 37),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 60),
                ElevatedButton(
                  onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()) 
                ); // Navigate back to previous screen
                },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 90, 56, 37), // Button color
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  ),
                  child: const Text(
                    'Back to Home',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
      ),
    );
  }
}
