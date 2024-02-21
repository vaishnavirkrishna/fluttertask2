import 'package:fluttask2/view/accountspage/account.dart';
import 'package:fluttask2/view/cartpage/cartscreen.dart';
import 'package:fluttask2/view/homescreen/homescreen.dart';
import 'package:fluttask2/view/homescreen/sliverhome.dart';
import 'package:fluttask2/view/savedpage/savedscreen.dart';
import 'package:flutter/material.dart';

class FancyBottomBarPage extends StatefulWidget {
  const FancyBottomBarPage({Key? key}) : super(key: key);

  @override
  _FancyBottomBarPageState createState() => _FancyBottomBarPageState();
}

class _FancyBottomBarPageState extends State<FancyBottomBarPage> {
  int currentIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPage(currentIndex),
      bottomNavigationBar: FancyBottomNavigation(
        currentIndex: currentIndex,
        onItemSelected: onItemTapped,
        items: [
          FancyBottomNavigationItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          FancyBottomNavigationItem(
            icon: Icon(Icons.shopping_cart),
            title: Text("Cart"),
          ),
          FancyBottomNavigationItem(
            icon: Icon(Icons.push_pin),
            title: Text("Pin"),
          ),
          FancyBottomNavigationItem(
            icon: Icon(Icons.person),
            title: Text("Account"),
          ),
          FancyBottomNavigationItem(
            icon: Icon(Icons.add_alert_rounded),
            title: Text("sliver"),
          ),
        ],
      ),
    );
  }

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return MyHome();
      case 1:
        return CartPage();
      case 2:
        return SavedPage();
      case 3:
        return AccountPage();
      case 4:
        return SliverHome();
      default:
        return Container();
    }
  }
}

class FancyBottomNavigation extends StatelessWidget {
  final int currentIndex;
  final List<FancyBottomNavigationItem> items;
  final ValueChanged<int> onItemSelected;

  const FancyBottomNavigation({
    Key? key,
    required this.currentIndex,
    required this.items,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 80,
      padding: const EdgeInsets.only(left: 8, right: 0, top: 6, bottom: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(60), topRight: Radius.circular(60)),
        color: Theme.of(context).bottomAppBarTheme.color,
        boxShadow: const [
          BoxShadow(color: Colors.white, blurRadius: 2, spreadRadius: 7)
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: items.map((item) {
          var index = items.indexOf(item);
          return GestureDetector(
            onTap: () {
              onItemSelected(index);
            },
            child: _buildItem(item, currentIndex == index),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildItem(FancyBottomNavigationItem item, bool isSelected) {
    return AnimatedContainer(
      alignment: Alignment.bottomLeft,
      width: isSelected ? 101 : 75,
      height: 50,
      duration: const Duration(milliseconds: 250),
      padding: EdgeInsets.only(right: 1, bottom: 3),
      decoration: !isSelected
          ? null
          : BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(50)),
            ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            height: 50,
            width: 40,
            decoration: isSelected
                ? BoxDecoration(shape: BoxShape.circle, color: Colors.black)
                : BoxDecoration(
                    shape: BoxShape.circle, color: Colors.transparent),
            child: IconTheme(
              data: IconThemeData(
                size: 27,
                color: isSelected ? Colors.grey : Colors.black,
              ),
              child: item.icon,
            ),
          ),
          SizedBox(
            width: 6,
          ),
          isSelected
              ? DefaultTextStyle.merge(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                  child: item.title,
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}

class FancyBottomNavigationItem {
  final Icon icon;
  final Text title;

  FancyBottomNavigationItem({
    required this.icon,
    required this.title,
  });
}
