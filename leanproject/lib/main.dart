import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(LeanProject());
}

// 创建应用，返回一个纸墨风格应用
class LeanProject extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '精益工程', //应用名称精益工程
      initialRoute: '/',
      // 定义项目路由
      routes: {
        '/': (contxt) => LpHomePage(),
      },
    );
  }
}

// 定义应用主页为多状态组件
class LpHomePage extends StatefulWidget {
  @override
  _LpHomePage createState() => _LpHomePage();
}

// 定义主页状态组件
class _LpHomePage extends State<LpHomePage> {
  @override
  Widget build(BuildContext context) {
    // 定义主页框架
    return new Scaffold(
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // 首页顶部控件
          new TopWidget(
            model: TopItemModel(
              place_img_dir:
                  'icons/engineer_photo/ic_engineer.png', // 用户头像加载占位图
              user_photo_url:
                  'https://piccdn.igetget.com/img/201912/11/201912111849270831585814.png', // 用户头像url
              user_name: '刘润', // 用户姓名
              user_company: '杭州越颖装饰工程有限公司', // 用户所属公司
              user_roles: ['施工员', '工程经理', '材料员'], // 用户角色列表
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
  List<String> user_roles; // 接收的用户角色列表

  // 构造函数语法糖，为属性赋值
  TopItemModel(
      {this.place_img_dir,
      this.user_photo_url,
      this.user_name,
      this.user_company,
      this.user_roles});
}

// 定义顶部控件
class TopWidget extends StatelessWidget {
  final TopItemModel model;

  // 构造函数语法糖，为控件属性赋值
  TopWidget({Key key, this.model}) : super(key: key);

  Widget build(BuildContext context) {
    return new Container(
      width: 500,
      height: 204,
      alignment: Alignment.center,
      padding: const EdgeInsets.fromLTRB(16, 54, 16, 32),
      //渐变色装饰
      decoration: new BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF1D7BEA), Color(0xFF083EB3)],
        ),
      ),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // 上面的工具行
          ToolBarRow(context),
          // 下面的用户信息行
          UserMsgRow(context),
        ],
      ),
    );
  }

  // 构建上部工具行
  Widget ToolBarRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        // 上传列表入口
        new IconButton(
            icon: Image.asset('icons/upload_sys/ic_upload_sys.png'),
            color: Colors.white,
            iconSize: 24.0,
            tooltip: '查看上传列表',
            onPressed: () {}),
        // 设置入口
        new IconButton(
            icon: Image.asset('icons/set_sys/ic_set_sys.png'),
            color: Colors.white,
            iconSize: 24.0,
            tooltip: '设置',
            onPressed: () {}),
      ],
    );
  }

  // 构建下部用户信息行
  Widget UserMsgRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        // 用户头像
        Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 16, 0),
          child: new ClipOval(
            child: FadeInImage.assetNetwork(
              placeholder: model.place_img_dir,
              image: model.user_photo_url,
              width: 60,
              height: 60,
            ),
          ),
        ),
        // 姓名、角色、所属公司容器
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // 用户姓名与角色
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  //用户姓名
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 3, 0, 3),
                    child: new Text(
                      model.user_name,
                      style: TextStyle(fontSize: 20, color: Color(0xFFFFFFFF)),
                    ),
                  ),
                  // 用户角色
                  Container(
                    padding: EdgeInsets.fromLTRB(8, 5, 0, 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: userRolesGenerator(model.user_roles),
                    ),
                  ),
                ],
              ),
              // 用户所属公司
              Padding(
                padding: EdgeInsets.fromLTRB(0, 7, 0, 7),
                child: new Text(
                  model.user_company,
                  style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                ),
              ),
            ],
          ),
        ),
        // 个人主页右箭头
        new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            // 创建箭头容器
            new Container(
              height: 30,
              alignment: Alignment.centerLeft,
              child: new IconButton(
                  icon: Image.asset('icons/arrow_right/ic_arrow_right_sys.png'),
                  color: Colors.white,
                  iconSize: 16.0,
                  tooltip: '设置',
                  onPressed: () {}),
            ),
            // 占位容器
            new Container(
              height: 30,
              alignment: Alignment.centerLeft,
            ),
          ],
        ),
      ],
    );
  }
}

// 定义主页功能区
class BottomFunWidget extends StatefulWidget {
  @override
  _BottomFunWidget createState() => _BottomFunWidget();
}

class _BottomFunWidget extends State<BottomFunWidget> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.white,
      width: 500,
      height: 550,
    );
  }
}

// 用户角色生成器构造函数
userRolesGenerator(List<String> rolesInList) {
  List<Widget> rolesOutList = [];
  int listLen = rolesInList.length;
  
  if (listLen == 1) {
    rolesOutList.add(
      Container(
        alignment: Alignment.center,
        padding: EdgeInsets.fromLTRB(8, 3, 8, 3),
        margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFF00C0EF),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(11),
        ),
        child: new Text(
          rolesInList[0],
          style: TextStyle(
            fontSize: 11,
            color: Color(0xFF00C0EF),
          ),
        ),
      ),
    );
  } else if (listLen == 2) {
    rolesOutList.add(
      Container(
        alignment: Alignment.center,
        padding: EdgeInsets.fromLTRB(8, 3, 8, 3),
        margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFF00C0EF),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(11),
        ),
        child: new Text(
          rolesInList[0],
          style: TextStyle(
            fontSize: 11,
            color: Color(0xFF00C0EF),
          ),
        ),
      ),
    );
    rolesOutList.add(
      Container(
        alignment: Alignment.center,
        padding: EdgeInsets.fromLTRB(8, 3, 8, 3),
        margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFF00C0EF),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(11),
        ),
        child: new Text(
          rolesInList[1],
          style: TextStyle(
            fontSize: 11,
            color: Color(0xFF00C0EF),
          ),
        ),
      ),
    );
  }else{
    rolesOutList.add(
      Container(
        alignment: Alignment.center,
        padding: EdgeInsets.fromLTRB(8, 3, 8, 3),
        margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFF00C0EF),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(11),
        ),
        child: new Text(
          rolesInList[0],
          style: TextStyle(
            fontSize: 11,
            color: Color(0xFF00C0EF),
          ),
        ),
      ),
    );
    rolesOutList.add(
      Container(
        alignment: Alignment.center,
        padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
        margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFF00C0EF),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(11),
        ),
        child: new Text(
          '2+',
          style: TextStyle(
            fontSize: 11,
            color: Color(0xFF00C0EF),
          ),
        ),
      ),
    );
  }

  print(rolesOutList);
  return rolesOutList;
}