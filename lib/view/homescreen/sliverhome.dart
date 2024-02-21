import 'package:fluttask2/view/utils/constant.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class SliverHome extends StatefulWidget {
  @override
  _SliverHomeState createState() => _SliverHomeState();
}

class _SliverHomeState extends State<SliverHome> {
  int? crindex;

  Color myColor = Colors.black;
  List<Color> labelColors = List.filled(4, Colors.white);

  @override
  void initState() {
    super.initState();

    labelColors = List<Color>.generate(4, (index) {
      return index == 0 ? Colors.black : Colors.white;
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            actions: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: CircleAvatar(
                  child: Image.asset(
                    AppImages.menuIcon,
                    fit: BoxFit.cover,
                  ),
                  backgroundColor: Colors.black,
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: CircleAvatar(
                  radius: 18,
                  child: Image.asset(
                    AppImages.logo,
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ],
            floating: false,
            pinned: true,
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: SliverAppBarDelegate(
              maxHeight: 115,
              minHeight: 70,
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(height: height * 0.02),
                    searchWidget(),
                    SizedBox(
                      height: height * 0.01,
                    ),
                  ],
                ),
              ),
            ),
            floating: true,
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: SliverAppBarDelegate(
              maxHeight: 100,
              minHeight: 60,
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(height: height * 0.02),
                    categoryList(),
                  ],
                ),
              ),
            ),
            floating: true,
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 20 / 33,
              mainAxisSpacing: 2,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return productGridview(index);
              },
              childCount: 4,
            ),
          ),
        ],
      ),
    );
  }

  Widget searchWidget() {
    var width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(14.0),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 243, 238, 238),
                  labelText: "Search...",
                  labelStyle: TextStyle(
                      color: Colors.grey, fontFamily: Constants.mainFont),
                  prefixIcon: Image.asset(AppImages.searchIcon),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(width * 0.09),
                    ),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(width * 0.09),
                    ),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 14),
                ),
              ),
            ),
          ),
          CircleAvatar(
            radius: 21,
            backgroundColor: Colors.black,
            child: Image.asset(AppImages.filterIcon),
          ),
        ],
      ),
    );
  }

  Widget categoryList() {
    final List<String> Labels = [
      'Dresses',
      'Jackets',
      'Jeans',
      'Shoes',
    ];

    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(11.0),
      child: Container(
        height: 52,
        width: width * 0.99,
        child: Row(
          children: [
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(),
                scrollDirection: Axis.horizontal,
                itemCount: Labels.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 7.0,
                      vertical: 10.0,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        print("Chip tapped at index $index");
                        setState(() {
                          for (int i = 0; i < labelColors.length; i++) {
                            labelColors[i] = Colors.white;
                          }

                          labelColors[index] = Colors.black;
                        });
                      },
                      child: Container(
                        width: width * 0.2,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              Labels[index],
                              style: TextStyle(
                                fontFamily: Constants.mainFont,
                                fontWeight: FontWeight.bold,
                                color: labelColors[index] == Colors.black
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: labelColors[index] == Colors.black
                                ? Colors.transparent
                                : Color.fromARGB(255, 201, 199, 199),
                          ),
                          color: labelColors[index],
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget productGridview(int index) {
    var height = MediaQuery.of(context).size.height;

    List<String> dressTitles = [
      AppStrings.a,
      AppStrings.b,
      AppStrings.c,
      AppStrings.d
    ];
    List<String> dressSubtitles = [
      AppStrings.e,
      AppStrings.f,
      AppStrings.g,
      AppStrings.h
    ];
    List<String> dressImages = [
      AppImages.whiteTshirt,
      AppImages.gown,
      AppImages.hoodie,
      AppImages.coat
    ];
    return GridView.count(
      childAspectRatio: 20 / 33,
      crossAxisCount: 2,
      mainAxisSpacing: 2,
      children: List.generate(4, (index) {
        double horizontalPadding = 20 + 14;

        return Padding(
          padding: EdgeInsets.only(
              left: horizontalPadding / 2, right: horizontalPadding / 2),
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
                          color: Color.fromARGB(255, 224, 217, 217),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: Stack(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(
                                      top: 20,
                                    ),
                                    child: Image.asset(
                                      dressImages[index],
                                      fit: BoxFit.cover,
                                    )),
                              ],
                            ),
                            Positioned(
                              top: 10,
                              right: 5,
                              child: CircleAvatar(
                                radius: 15,
                                backgroundColor: Colors.black,
                                child: IconButton(
                                  iconSize: 15,
                                  icon: Icon(
                                    Icons.favorite,
                                    color: const Color.fromARGB(
                                        255, 223, 212, 212),
                                  ),
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
                              dressTitles[index],
                              style: TextStyle(
                                fontFamily: Constants.mainFont,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              dressSubtitles[index],
                              style: TextStyle(
                                fontFamily: Constants.mainFont,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "\$${180.9}",
                              style: TextStyle(
                                fontFamily: Constants.mainFont,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
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
    );
  }
}

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });
  final double minHeight;
  final double maxHeight;
  final Widget child;
  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => math.max(maxHeight, minHeight);
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
