import 'package:flutter/material.dart';
import 'user_list_screen.dart';
import 'birthday_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List favoriteUsers = [];

  void updateFavorites(List newFavorites) {
    setState(() {
      favoriteUsers = newFavorites;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Birthday Book'),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Welcome to your Birthday Book',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Image.asset(
                  'assets/birthday_image.png',
                  //height: 100,
                  //width: 100,
                ),
              ],
            ),
          ),
          UserListScreen(
            updateFavorites: updateFavorites,
            favoriteUsers: favoriteUsers,
          ),
          BirthdayListScreen(favoriteUsers: favoriteUsers),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'List'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Birthdays'),
        ],
        onTap: _onItemTapped,
      ),
    );
  }
}
