import 'package:fluttask2/view/bottomnav/nav.dart';

import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
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
