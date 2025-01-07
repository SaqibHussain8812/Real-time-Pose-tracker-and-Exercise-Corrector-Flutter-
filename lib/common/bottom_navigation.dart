import 'package:flutter/material.dart';

class MyBottomNavigation extends StatefulWidget {
  const MyBottomNavigation({super.key});

  @override
  State<MyBottomNavigation> createState() => _MyBottomNavigationState();
}

class _MyBottomNavigationState extends State<MyBottomNavigation> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushNamed(context, "/home");
        break;

      case 1:
        Navigator.pushNamed(context, "/exercise");
        break;

      case 2:
        Navigator.pushNamed(context, "/mainprofile");
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: Colors.white),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.fitness_center, color: Colors.white),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outlined, color: Colors.white),
          label: "",
        ),
      ],
      onTap: _onItemTapped,
      currentIndex: _selectedIndex,
      backgroundColor: Colors.black,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
    );
  }
}
