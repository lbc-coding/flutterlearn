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
      title: '精益工程', //应用名称精益工程
      initialRoute: '/',
      // 定义项目路由
      routes: {
        '/' : (contxt) => LpHomePage(),
      },
    );
  }
}

// 定义应用主页为多状态组件
class LpHomePage extends StatefulWidget{
  @override
  _LpHomePage createState() => _LpHomePage();
}

// 定义主页状态组件
class _LpHomePage extends State<LpHomePage>{
  @override
  Widget build(BuildContext context){
    // 定义主页框架
    return new Scaffold(
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // 首页顶部控件
          new TopWidget(model: TopItemModel(
            place_img_dir: 'icons/engineer_photo/ic_engineer.png', // 用户头像加载占位图
            user_photo_url: 'https://piccdn.igetget.com/img/201912/11/201912111849270831585814.png', // 用户头像url
            user_name: '刘润', // 用户姓名
            user_company: '杭州越颖装饰工程有限公司', // 用户所属公司
            user_roles: ['施工员', '房修工程师', '深化设计师'], // 用户角色列表
            ),
          ),
          // 首页功能入口区
          new BottomFunWidget(),
        ],
      ),
    );
  }
}

// 定义主页top控件数据结构
class TopItemModel {
  String place_img_dir; // 用户头像加载完成前占位图
  String user_photo_url; // 用户头像URL
  String user_name; // 用户姓名
  String user_company; // 用户所属公司
  List<String> user_roles; // 用户角色列表

  // 构造函数语法糖，为属性赋值
  TopItemModel({this.place_img_dir, this.user_photo_url, this.user_name, this.user_company, this.user_roles});
}

// 定义顶部控件
class TopWidget extends StatelessWidget{
  final TopItemModel model;

  // 构造函数语法糖，为控件属性赋值
  TopWidget({Key key, this.model}) : super(key : key);

  Widget build(BuildContext context){
    return new Container(
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
      child: new Text('尝试一下'),
    );
  }
}

// 定义主页功能区
class BottomFunWidget extends StatefulWidget{
  @override
  _BottomFunWidget createState() => _BottomFunWidget();
}

class _BottomFunWidget extends State<BottomFunWidget>{
  @override
  Widget build(BuildContext context){
    return new Container(color: Colors.white, width: 500, height: 550,);
  }
}