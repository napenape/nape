import 'package:flutter/material.dart';
import 'package:flutter_learn/userList.dart';

void main() {
  runApp(const MyApp());
}
// git init githubを使うための準備
// git remote add origin URL リモートリポジトリを追加
// git add . 変更点を全部追加
// git add ファイル名 指定したファイルだけを追加
// git commit -m "コメント"
// git push origin master リモートリポジトリに反映

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyWidget(),
    );
  }
}

