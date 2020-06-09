import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:html/dom.dart' hide Text;
import 'package:html/dom_parsing.dart';
import 'package:html/parser.dart';

// 定义登录页面为多状态组件
class LogInPage extends StatefulWidget {
  @override
  _LogInPage createState() => _LogInPage();
}

// 定义登录页面状态组件state
class _LogInPage extends State<LogInPage> {
  String _username;
  String _userpwd;
  bool _ispwdhide = true;

  void _uodateusername(String username) {
      _username = username;
  }

  void _uodateuserpwd(String userpwd) {
      _userpwd = userpwd;
  }

  @override
  Widget build(BuildContext context) {
    final _usernamecontroller = TextEditingController();
    final _userpwdcontroller = TextEditingController();

    return Scaffold(
      body: Container(
        height: 799,
        color: Colors.white,
        alignment: Alignment.topCenter,
        padding: EdgeInsets.fromLTRB(16, 88, 16, 0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // 标题
            new Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // 占位
                new Container(
                  width: 16,
                  height: 33,
                ),
                new Text(
                  '密码登录',
                  style: TextStyle(
                    fontSize: 24,
                    color: Color(0xFF2F2F39),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            // 用户名输入组件
            new Container(
              width: 343,
              height: 72,
              padding: EdgeInsets.fromLTRB(16, 4, 16, 0),
              margin: EdgeInsets.fromLTRB(0, 24, 0, 0),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(
                    '用户名',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF2F2F39),
                    ),
                  ),
                  new TextField(
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    autofocus: true,
                    controller: _usernamecontroller
                      ..addListener(() {
                        _uodateusername(_usernamecontroller.text);
                        print(_usernamecontroller.text);
                      }),
                      onEditingComplete: () => print(_usernamecontroller.text),
                  ),
                ],
              ),
            ),
            // 密码输入组件
            new Container(
              width: 343,
              height: 72,
              padding: EdgeInsets.fromLTRB(16, 4, 16, 0),
              margin: EdgeInsets.fromLTRB(0, 24, 0, 0),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(
                    '密码',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF2F2F39),
                    ),
                  ),
                  new TextField(
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.go,
                    obscureText: _ispwdhide,
                    controller: _userpwdcontroller
                      ..addListener(() {
                        _uodateuserpwd(_userpwdcontroller.text);
                        print(_userpwdcontroller.text);
                      }),
                    onEditingComplete: () => print(_userpwdcontroller.text),
                  ),
                ],
              ),
            ),
            // 登录按钮组件
            loginbuttongenerator(
                judgeButtonisdisabled(1, 7), context),
          ],
        ),
      ),
    );
  }
}

// 判断登录按钮是否不可用
bool judgeButtonisdisabled(int usernamelen, int usercodelen) {
  if (usernamelen >= 1 && usercodelen >= 6) {
    return false;
  } else {
    return true;
  }
}

// 登录按钮生成器
loginbuttongenerator(bool isbuttondisabled, dynamic context) {
  return Container(
    width: 343,
    height: 90,
    padding: EdgeInsets.fromLTRB(16, 40, 16, 0),
    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
    child: new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new RaisedButton(
          onPressed: isbuttondisabled
              ? null
              : () {
                  Navigator.pushNamed(context, '/');
                },
          child: Text(
            '登 录',
            style: TextStyle(fontSize: 16, color: Color(0xFFFFFFFF)),
          ),
          disabledColor: Colors.blue[40],
          color: Color(0xFF177AE6),
          padding: EdgeInsets.fromLTRB(137, 8, 137, 8),
        )
      ],
    ),
  );
}
