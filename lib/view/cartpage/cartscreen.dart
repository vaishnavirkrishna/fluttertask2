import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          "CARTPAGE",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
