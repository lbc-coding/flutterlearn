import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:leanprojectapp/model/homepage_model.dart';
import 'package:leanprojectapp/basesrc/http_methods.dart';

// 定义首页顶部控件
class TopWidget extends StatelessWidget {
  final TopItemModel model;
  // 构造函数语法糖，为控件属性赋值
  TopWidget({Key key, this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // final httpservice = new HttpManager();

    return FractionallySizedBox(
      child: Container(
        //width: 375,
        height: 204,
        alignment: Alignment.center,
        padding: const EdgeInsets.fromLTRB(16, 40, 16, 0),
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
      ),
    );
  }

  // 构建卡片上部工具行
  Widget ToolBarRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        // 上传列表入口
        new Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
          child: new IconButton(
              icon: Image.asset('icons/upload_sys/ic_upload_sys.png'),
              color: Colors.white,
              iconSize: 24.0,
              tooltip: '查看上传列表',
              onPressed: () {
                HttpManager().get('/video/20191212/70n1lXOQ25aKJkP38SxLpAG6r3eyWvz9');
              }),
        ),
        // 设置入口
        new Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
          child: new IconButton(
              icon: Image.asset('icons/set_sys/ic_set_sys.png'),
              color: Colors.white,
              iconSize: 24.0,
              tooltip: '设置',
              onPressed: () {}),
        ),
      ],
    );
  }

  // 构建卡片下部用户信息行
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
              placeholder: 'icons/engineer_photo/ic_engineer.png',
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
            mainAxisSize: MainAxisSize.min,
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
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Color(0xFFFFFFFF)),
                      maxLines: 1,
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
                  maxLines: 1,
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
                  onPressed: () {
                    // 临时定义导航到登录页
                    Navigator.pushNamed(context, 'loginpage');
                  }),
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

// 顶部用户信息的用户角色生成器构造函数
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
          maxLines: 1,
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
  } else {
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

// 定义首页下部功能区
class BottomFunWidget extends StatefulWidget {
  @override
  _BottomFunWidget createState() => _BottomFunWidget();
}

class _BottomFunWidget extends State<BottomFunWidget> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 595,
      //color: Colors.grey,
      alignment: Alignment.topCenter,
      child: new GridView.count(
        primary: false,
        padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
        mainAxisSpacing: 35,
        crossAxisCount: 3,
        children: userFunListGenerator(funlist)[0],
      ),
    );
  }
}

// 定义用户功能列表生成器
userFunListGenerator(Map<String, String> user_fun_getlist) {
  int funcounter = user_fun_getlist.length;
  List<Widget> user_fun_outlist = [];
  List result_list = [];
  if (funcounter == 0) {
    for (int i = 1; i < 10; i++) {
      user_fun_outlist
        ..add(
          Container(
            height: 90,
            width: 80,
            alignment: Alignment.topCenter,
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: FadeInImage.assetNetwork(
                      placeholder: 'icons/app_icon/lp_app_icon.png',
                      image: 'http://img.599ku.com/element_min_new_pic/0/56/30/81/5b01ebee94c1839c4c23cb998da42a47.png'),
                  // icon: Image.network(
                  //     'http://img.599ku.com/element_min_new_pic/0/56/30/81/5b01ebee94c1839c4c23cb998da42a47.png'),
                  iconSize: 80,
                  onPressed: () {},
                  tooltip: '点一点',
                ),
                Text(
                  '未配置功能',
                  style: TextStyle(fontSize: 15, color: Color(0xFF2F2F39)),
                ),
              ],
            ),
          ),
        );
    }
  } else {
    user_fun_getlist.forEach((String key, String value) {
      String fun_name = key;
      String icon_url = value;
      user_fun_outlist
        ..add(
          Container(
            height: 90,
            width: 80,
            alignment: Alignment.topCenter,
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: FadeInImage.assetNetwork(
                      placeholder: 'icons/app_icon/lp_app_icon.png',
                      image: icon_url),
                  //icon: Image.network(icon_url),
                  iconSize: 80,
                  onPressed: () {},
                  tooltip: fun_name,
                ),
                Text(
                  fun_name,
                  style: TextStyle(fontSize: 15, color: Color(0xFF2F2F39)),
                ),
              ],
            ),
          ),
        );
    });
  }
  result_list..add(user_fun_outlist)..add(funcounter);
  return result_list;
}

// 模拟后端返回用户功能列表
Map<String, String> funlist = {
  '我是刘润':
      'https://piccdn3.umiwi.com/img/201912/11/201912111849270831585814.png',
  '我是余剑锋':
      'https://piccdn3.umiwi.com/img/201912/11/201912111857082259233096.png',
  '我是万维钢':
      'https://piccdn3.umiwi.com/img/201912/11/201912111908345980865404.png',
  '我是田轩':
      'https://piccdn3.umiwi.com/img/201912/12/201912121343005044860898.png',
  '我是罗振宇':
      'https://piccdn3.umiwi.com/img/201912/11/201912111912369664627642.png',
  '刘润是我':
      'https://piccdn3.umiwi.com/img/201912/11/201912111849270831585814.png',
  '余剑锋是我':
      'https://piccdn3.umiwi.com/img/201912/11/201912111857082259233096.png',
  '万维钢是我':
      'https://piccdn3.umiwi.com/img/201912/11/201912111908345980865404.png',
  '田轩是我':
      'https://piccdn3.umiwi.com/img/201912/12/201912121343005044860898.png',
  '罗振宇是我':
      'https://piccdn3.umiwi.com/img/201912/11/201912111912369664627642.png',
};
