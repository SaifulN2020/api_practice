import 'dart:convert';
import 'package:api_practice/model/api_test_dat.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ApiTest(),
    );
  }
}
class ApiTest extends StatefulWidget {
  const ApiTest({Key? key}) : super(key: key);
  @override
  State<ApiTest> createState() => _ApiTestState();
}
class _ApiTestState extends State<ApiTest> {
  List<ApiTestData> postList = [];
  Future<List<ApiTestData>> gotApiData() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    var data = jsonDecode(response.body.toString());
    if (response == 200) {
      for (Map i in data) {
        postList.add(ApiTestData.fromJson(i));
      }
      return postList;
    } else {
      return postList;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API DATA"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: gotApiData(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<ApiTestData>> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: Text("Loading"),
                  );
                } else {
                  return ListView.builder(
                      itemCount: postList.length,
                      itemBuilder: (context, index) {
                        return Text(index.toString());


                      });
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
