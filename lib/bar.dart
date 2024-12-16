

import 'package:flutter/material.dart';
import 'package:travel_app/search_flight_page.dart';


class Bar extends StatefulWidget {
  const Bar({super.key});

  @override
  State<Bar> createState() => _BarState();
}

class _BarState extends State<Bar> {
  int _currentIndex = 0;

  // List of pages corresponding to each BottomNavigationBarItem
  final List<Widget> _pages = [
    const SearchFlightPage(),

  ];

  // Function to handle onTap event of BottomNavigationBar
  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _onTap,
        selectedItemColor: Colors.purple, // Change selected icon color
        unselectedItemColor: Colors.black, // Change unselected icon color
        backgroundColor: Colors.blue, // Change background color
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_online),
            label: 'Booking',
          ),
        ],
      ),
    );
  }
}
