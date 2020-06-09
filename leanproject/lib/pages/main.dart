import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:leanprojectapp/pages/homepage/homepage.dart';
import 'package:leanprojectapp/pages/loginpage/loginpage.dart';

void main() {
  runApp(LeanProjectApp());
}

// 创建应用，返回一个纸墨风格应用
class LeanProjectApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '精益工程', //应用名称精益工程
      theme: ThemeData.light(),
      initialRoute: '/',
      // 定义项目路由
      routes: {
        '/': (BuildContext contxt) => HomePage(),
        'loginpage':  (BuildContext contxt) => LogInPage(),
      },
    );
  }
}
