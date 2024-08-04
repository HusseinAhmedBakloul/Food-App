import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food/login/SignUp.dart';
import 'package:food/widget.dart/home_page.dart';
import 'package:icons_plus/icons_plus.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool _obscureText = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String _errorMessage = '';
  bool _hasError = false;

  Future<void> login() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // If successful, navigate to home view
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()), // Replace HomeView with your actual home screen widget
      );
    } catch (e) {
      // Handle any errors here
      setState(() {
        _errorMessage = 'Check your email or password';
        _hasError = true;
      });
      print('Failed to sign in: $e');
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
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
        child: SingleChildScrollView(
         child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 15, left: 15, top: 50),
              child: Container(
                height: 320,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/Screenshot_2024-07-23_064257-removebg-preview.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15,),
                Text(
                  'Ahl Elshawerma',
                  style: TextStyle(color: Color.fromARGB(255, 90, 56, 37), fontSize: 34, fontWeight: FontWeight.bold, fontFamily: 'AbrilFatface'),
                ),
                
            const SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(78, 226, 225, 225),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    width: 1,
                    color: _hasError ? Colors.red : Colors.grey,
                  ),
                ),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Icon(Icons.email, color: Color.fromARGB(255, 90, 56, 37), size: 24),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          hintText: 'Enter your email',
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(78, 226, 225, 225),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    width: 1,
                    color: _hasError ? Colors.red : Colors.grey,
                  ),
                ),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Icon(Icons.lock, color: Color.fromARGB(255, 90, 56, 37), size: 24),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: _passwordController,
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                          hintText: 'Enter your password',
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: IconButton(
                        icon: Icon(
                          _obscureText ? Icons.visibility : Icons.visibility_off,
                          color: Color.fromARGB(255, 90, 56, 37),
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20,),
            if (_hasError) ...[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  _errorMessage,
                  style: TextStyle(color: Colors.red, fontSize: 14),
                ),
              ),
              const SizedBox(height: 10,),
            ],
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 90, 56, 37),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  minimumSize: const Size(double.infinity, 60),
                ),
                onPressed: () {
                  login(); // Call the login function here
                },
                child: const Text(
                    'Login',
                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
              ),
            ),
            const SizedBox(height: 25,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: Color.fromARGB(255, 90, 56, 37),
                    height: 1,
                    width: 95,
                  ),
                  const SizedBox(width: 6,),
                  const Text('Or login with', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 90, 56, 37))),
                  const SizedBox(width: 6,),
                  Container(
                    color: Color.fromARGB(255, 90, 56, 37),
                    height: 1,
                    width: 95,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.facebook, size: 30,),
                  const SizedBox(width: 30,),
                  Icon(Bootstrap.google,),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "If you haven't account?",
                  style: TextStyle(color: Color.fromARGB(255, 90, 56, 37), fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 3),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUp()),
                    );
                  },
                    child: const Text(
                      "Create Account",
                      style: TextStyle(color: Color.fromARGB(255, 207, 66, 14),fontSize: 14,fontWeight: FontWeight.bold,decoration: TextDecoration.underline,decorationColor: Color.fromARGB(255, 207, 66, 14),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    ),
    );
  }
}
