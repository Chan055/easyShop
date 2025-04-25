
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: screen.height / 2,
                child: Center(
                  child: Text(
                    "Welcome to EasyShop",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 65, 52, 182),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Container(
                width: screen.width,
                height: (screen.height / 2),
                decoration: const BoxDecoration(
                    color: const Color(0xFF7E57C2),

                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
              ),
            ],
          ),
          Positioned(
            top: screen.height / 2.8,
            left: 0,
            right: 0,
            child: Center(
              child: Image.asset(
                'assets/images/shopping_cart.png',
                height: 300,
              ),
            ),
          ),
          Positioned(
            bottom: screen.height * 0.15,
            left: screen.width * 0.15,
            right: screen.width * 0.15,
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.blue,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Login",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.blue,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
