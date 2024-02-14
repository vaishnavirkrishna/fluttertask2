import 'package:fluttask2/view/bottomnav/nav.dart';
import 'package:fluttask2/view/cartpage/cartscreen.dart';
import 'package:fluttask2/view/savedpage/savedscreen.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<FancyBottomNavigationItem> items = [
      FancyBottomNavigationItem(
        icon: Icon(Icons.home_outlined),
        title: Text('Home'),
      ),
      FancyBottomNavigationItem(
        icon: Icon(Icons.shopping_cart),
        title: Text('Cart'),
      ),
      FancyBottomNavigationItem(
        icon: Icon(Icons.push_pin),
        title: Text('Pin'),
      ),
      FancyBottomNavigationItem(
        icon: Icon(Icons.person),
        title: Text('User'),
      ),
    ];

    void onItemSelected(crindex) {
      print('Item selected: $crindex');
      switch (crindex) {
        case 1:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CartPage()),
          );
          break;
        case 2:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SavedPage()),
          );
          break;
        case 3:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AccountPage()),
          );
          break;
        default:
          break;
      }
    }

    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: FancyBottomNavigation(
        currentIndex: 3,
        items: [],
        onItemSelected: (value) {},
      ),
      body: Center(
        child: Text(
          "ACCOUNTPAGE",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
