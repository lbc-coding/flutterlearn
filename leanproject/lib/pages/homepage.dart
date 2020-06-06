import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:leanprojectapp/model/homepage_model.dart';
import 'package:leanprojectapp/widget/homepage_widget.dart';

// 定义应用首页为多状态组件
class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

// 定义首页状态组件state
class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // 定义主页框架
    return new Scaffold(
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // 首页顶部控件卡片
          new TopWidget(
            model: TopItemModel(
              user_photo_url:
                  'https://piccdn3.umiwi.com/img/201912/11/201912111903106605662739.png', // 用户头像url
              user_name: '薛兆丰教授', // 用户姓名
              user_company: '得到（天津）文化传播有限公司', // 用户所属公司
              user_roles: ['宝藏薛兆丰', '工程经理', '材料员'], // 用户角色列表
            ),
          ),
          // 首页功能入口区
          new BottomFunWidget(),
        ],
      ),
    );
  }
}