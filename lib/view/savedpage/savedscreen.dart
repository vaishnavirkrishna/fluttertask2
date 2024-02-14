import 'package:fluttask2/view/accountspage/account.dart';
import 'package:fluttask2/view/bottomnav/nav.dart';
import 'package:fluttask2/view/cartpage/cartscreen.dart';
import 'package:flutter/material.dart';

class SavedPage extends StatefulWidget {
  const SavedPage({super.key});

  @override
  State<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          "SAVEPAGE",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
