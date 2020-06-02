import 'package:flutter/material.dart';
//import  'package: flutter/cupertino.dart';

void main() {
  runApp(LeanProject());
}

// 创建应用，返回一个纸墨风格应用
class LeanProject extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: '精益工程', //应用名称未精益工程
      home: LpHomePage(), //应用主页
    );
  }
}

// 定义应用主页为多状态组件
class LpHomePage extends StatefulWidget{
  @override
  _LpHomePage createState() => _LpHomePage();
}

// 定义主页状态容器
class _LpHomePage extends State<LpHomePage>{
  @override
  Widget build(BuildContext context){
    // 定义主页框架
    return new Scaffold(
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  <Widget>[
            // 顶部卡片
            new Container(
              width: 500, 
              height: 204, 
              alignment: Alignment.center,
              //渐变色装饰
              decoration: new BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft, end: Alignment.bottomRight, 
                  colors: [Color(0xFF1D7BEA), Color(0xFF083EB3)], 
                ),
              ),
              //设置图标容器，列式排布
              child: new Column(
                verticalDirection: VerticalDirection.down,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // 设置与消息图标行
                  new Row(
                    children: <Widget>[
                      new Text('这是设置与消息行', style: TextStyle(fontWeight: FontWeight.bold),),
                      new  IconButton(icon: Image.asset('images/ic_set_sys.png'), iconSize: 24.0, onPressed: null), 
                      new  IconButton(icon: Image.asset('images/ic_message_sys.png'), iconSize: 24.0, onPressed: null), 
                    ],
                  ),
                  //头像、姓名、角色、公司个人主页图标
                  new Row(
                    children: <Widget>[
                      new Text('这是头像姓名角色行', style: TextStyle(fontWeight: FontWeight.bold),),
                    ],
                  ),
                ],
              ),
             ), 
             // 功能区
            new Container(color: Colors.white, width: 500, height: 608,), 
          ],
        ),
      ),
    );
  }
}