import 'package:fluttask2/model/newmodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SavedPage extends StatefulWidget {
  const SavedPage({Key? key}) : super(key: key);

  @override
  State<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  bool isLoading = true;
  List<NewApi> newApiList = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    setState(() {
      isLoading = true;
    });

    var response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));

    if (response.statusCode == 200) {
      print("Successful ${response.statusCode}");
      List<dynamic> responseDataList = jsonDecode(response.body);
      newApiList = responseDataList.map((e) => NewApi.fromJson(e)).toList();
    } else {
      print("Error ${response.statusCode}");
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Page'),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: ListView.separated(
                separatorBuilder: (context, index) => Divider(
                  thickness: 5,
                  color: Colors.deepPurple,
                ),
                itemCount: newApiList.length,
                itemBuilder: (context, index) {
                  NewApi product = newApiList[index];
                  return Column(
                    children: [
                      Text(product.albumId.toString() ?? ''),
                      Text(product.id.toString() ?? "no image"),
                      Text(product.title ?? ""),
                      Center(
                        child: Image.network(
                          product.thumbnailUrl ?? "",
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(child: Image.network(product.url ?? ""))
                    ],
                  );
                },
              ),
            ),
    );
  }
}
