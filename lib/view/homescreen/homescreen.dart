import 'package:fluttask2/view/utils/constant.dart';
import 'package:fluttask2/view/widgets/drawer.dart';
import 'package:flutter/material.dart';

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<String> chipLabels = [
      'Dresses',
      'Jackets',
      'Jeans',
      'Shoes',
    ];
    final List<Color> chipColors = List<Color>.filled(4, Colors.white);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    Color defaultColor = Colors.white;
    return Scaffold(
      appBar: AppBar(
        actions: [
          CircleAvatar(
            radius: 20,
            child: Image.network(
              "https://pngimg.com/uploads/cowboy_hat/cowboy_hat_PNG85.png",
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
      drawer: MyDrawer(),
      body: Column(
        children: [
          SizedBox(height: height * 0.02),
          Container(
            child: Padding(
              padding: EdgeInsets.all(18.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: height * 0.05,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: "Search",
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(width * 0.09),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: width * 0.07),
                  CircleAvatar(
                    child: Icon(
                      Icons.line_weight_outlined,
                      color: Colors.white,
                    ),
                    backgroundColor: Colors.black,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: [
              Container(
                height: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: chipLabels.length,
                  itemBuilder: (context, index) {
                    Color chipColor = chipColors[index];

                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 8.0,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          print("Chip tapped at index $index");
                          setState(() {
                            chipColors[index] =
                                chipColors[index] == defaultColor
                                    ? Colors.red
                                    : defaultColor;
                          });
                        },
                        child: Chip(
                          label: Text(chipLabels[index]),
                          backgroundColor: chipColor,
                          labelStyle: TextStyle(color: Colors.black),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),

// ...

          Expanded(
            child: GridView.count(
              childAspectRatio: 20 / 33,
              crossAxisCount: 2,
              children: List.generate(4, (index) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      index.isEven
                          ? Container()
                          : SizedBox(
                              height: height * 0.03,
                            ),
                      Container(
                        height: height * 0.31,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 197, 190, 190),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              right: 20, top: 20),
                                          child: Image.network(
                                            img[index],
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Positioned(
                                      top: 10,
                                      right: 0,
                                      child: CircleAvatar(
                                        radius: 15,
                                        backgroundColor: Colors.white,
                                        child: IconButton(
                                          iconSize: 15,
                                          icon: Icon(Icons.favorite),
                                          onPressed: () {},
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 3.0),
                                    Text(
                                      "Roller Rabbit",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Bubble elastic tshirt",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      "\$${180.9}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'person',
          ),
        ],
      ),
    );
  }
}
