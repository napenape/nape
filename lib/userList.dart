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
    // APIたたく処理
    http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/users"))
        .then((res) {
      // print(res.body);
      // 文字化け対策
      var responseRaw = utf8.decode(res.bodyBytes);
      // print(responseRaw);
      // json形式で扱えるようにする
      jsonResponse = json.decode(responseRaw);
      // print(jsonResponse[0]["name"]);
      // 画面を再描画するためにsetStateを呼ぶ
      setState(() {
        jsonResponse = jsonResponse;
      });
    });
    // APIたたく処理　ここまで
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
          // index jsonResponseの何番目かという情報
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
