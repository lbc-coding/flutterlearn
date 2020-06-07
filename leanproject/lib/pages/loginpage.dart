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
  @override
  Widget build(BuildContext context) {
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
                  ),
                ],
              ),
            ),
            // 登录按钮组件
            new Container(
              width: 343,
              height: 90,
              padding: EdgeInsets.fromLTRB(16, 40, 16, 0),
              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new RaisedButton(
                    onPressed: () {
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
            ),
          ],
        ),
      ),
    );
  }
}
