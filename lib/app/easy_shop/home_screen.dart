import 'package:easyshop/app/easy_shop/list_screen.dart';
import 'package:easyshop/app/easy_shop/profile_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    final screens=[
      const ShoppingListScreen(),
      // const ItemsScreen(),
      const ProfileScreen()
    ];
    return Scaffold(
appBar: PreferredSize(
  preferredSize: const Size.fromHeight(60),
  child: AppBar(

    flexibleSpace: Container(
      decoration: const BoxDecoration(

      ),
    ),
    title: const Text("Easy Shop",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
    elevation: 0,
    leading: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipOval(
      ),
    ),
  ),
),

      body: screens[_selectedIndex],
bottomNavigationBar: Stack(
  children: [
    // Gradient background layer
    Container(
      height: 60,
      decoration: const BoxDecoration(

      ),
    ),
    // BottomNavigationBar itself
    BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,

      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white60,
      elevation: 0,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Lists'),
        // BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Items'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    ),
  ],
),

    );
  }
}
