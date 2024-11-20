import 'package:flutter/material.dart';
import 'package:quick_medical/screens/account.dart';
import 'package:quick_medical/screens/cart.dart';
import 'package:quick_medical/screens/home.dart';

class BottomNavigationView extends StatefulWidget {
  const BottomNavigationView({super.key});

  @override
  State<BottomNavigationView> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigationView> {
  int _currentView = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _getCurrentView(),
        // Bottom Navigation Bar
        bottomNavigationBar: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentView,
            onTap: (value) {
              setState(() {
                _currentView = value;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Home'
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications_outlined),
                label: 'Notifications'
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag_outlined),
                label: 'My Bag'
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: 'Profile'
              ),
            ]),
      ),
    );
  }

  _getCurrentView() {
    if (_currentView == 0) {
      return HomeView();
    } else if (_currentView == 1) {
      return ; // Add notifications page
    } else if (_currentView == 2) {
      return CartView(); // Add Cart page
    } else {
      return AccountView(); // Add accounts page
    }
  }
}
