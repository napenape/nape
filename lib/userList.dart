import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  List response = [];
  List jsonResponse = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/users"))
        .then((res) {
      // print(res.body);
      var responseRaw = utf8.decode(res.bodyBytes);
      // print(responseRaw);
      jsonResponse = json.decode(responseRaw);
      print(jsonResponse[0]["name"]);
      setState(() {
        jsonResponse = jsonResponse;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adachi"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          itemCount: jsonResponse.length,
          itemBuilder: (context, index) {
            print("length${jsonResponse.length}");
            return ListTile(
              // child: Row(
              //   children: [
              //     Text(jsonResponse[index]["name"]),
              //     Text(jsonResponse[index]["phone"]),
              //   ],
              // ),
              title: Text(jsonResponse[index]["name"]),
            );
          },
        ),
      ),
    );
  }
}
