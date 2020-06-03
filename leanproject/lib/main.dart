import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

String user_name = '刘润';
String user_company = '杭州越颖装饰工程有限公司';
String user_avatar_url = 'https://piccdn.igetget.com/img/201912/11/201912111849270831585814.png';

// 定义主页状态组件
class _LpHomePage extends State<LpHomePage>{
  @override
  Widget build(BuildContext context){
    // 定义主页框架
    return new Scaffold(
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  <Widget>[
            // 顶部卡片
            new Container(
              width: 500, 
              height: 204, 
              alignment: Alignment.center,
              padding: const EdgeInsets.fromLTRB(16, 54, 16, 32),
              //渐变色装饰
              decoration: new BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft, end: Alignment.bottomRight, 
                  colors: [Color(0xFF1D7BEA), Color(0xFF083EB3)], 
                ),
              ),
              //设置图标容器，列式排布
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  // 设置与消息图标行
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      // 上传列表入口
                      new IconButton(
                        //icon: Icon(Icons.cloud_upload),
                        icon: Image.asset('images/ic_upload_sys.png'), 
                        color: Colors.white, 
                        iconSize: 24.0, 
                        tooltip: '查看上传列表',
                        onPressed: (){}
                      ), 
                      // 设置入口
                      new IconButton(
                        //icon: Icon(Icons.settings),
                        icon: Image.asset('images/ic_set_sys.png'), 
                        color: Colors.white, 
                        iconSize: 24.0, 
                        tooltip: '设置',
                        onPressed: (){}
                      ), 
                    ],
                  ),
                  //头像、姓名、角色、公司个人主页图标
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      // 用户头像
                      new ClipOval(
                        child: Image.network(
                          user_avatar_url, 
                          width: 60, 
                          height: 60, 
                          fit: BoxFit.cover,
                        ),
                      ),
                      // 姓名、角色、所属公司容器
                      new Container(
                        width: 267,
                        height: 70,
                        margin: new EdgeInsets.fromLTRB(16, 0, 0, 0),
                        alignment: Alignment.centerLeft,
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            // 姓名、角色标签、个人主页按钮
                            new Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                // 姓名、角色、个人主页按钮
                                new Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    // 姓名
                                    new Text(
                                      user_name, 
                                      style: TextStyle(fontSize:20, color: Color(0xFFFFFFFF)),
                                    ),
                                    // 角色
                                    new Container(
                                      width: 150,
                                      height: 24,
                                      margin: new EdgeInsets.fromLTRB(8, 0, 0, 0),
                                      child: new Row(
                                        // TODO
                                      ),
                                    ),
                                    // 个人主页按钮
                                    new IconButton(
                                      //icon: Icon(Icons.keyboard_arrow_right),
                                      icon: Image.asset('images/ic_arrow_right_sys.png'), 
                                      color: Colors.white, 
                                      iconSize: 16, 
                                      tooltip: '查看个人主页',
                                      onPressed: (){},
                                    ),
                                   ],
                                 ),
                              ],
                            ),
                            // 所属公司
                            new Row(
                              children: <Widget>[
                                new Text(
                                  user_company, 
                                  style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
             ), 
             // 功能入口区
            new Container(
              color: Colors.white, 
              width: 500, 
              height: 608,
              ), 
          ],
        ),
      ),
    );
  }
}