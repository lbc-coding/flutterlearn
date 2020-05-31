import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      home: MyHomePage(),
      title: 'Flutter 学习示例',
      theme: new ThemeData(primarySwatch: Colors.orange),
      routes: {
        'MyHomePage': (BuildContext context) => MyHomePage(),
        '/second': (BuildContext context) => SecondPage(),
      },
      initialRoute: 'MyHomePage',
    );
  }
}

class MyHomePage extends StatefulWidget{
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIdex = 1; //当前选中项的索引
  
  @override
  Widget build(BuildContext context) {
    return  new Scaffold(  //脚手架
          appBar: AppBar(
            title: Text(
              '对，我就是你的书童！',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.0, color: Colors.white,),
              ),
              centerTitle: true,
              leading: Image.network('https://piccdn.igetget.com/img/201912/11/201912111912369664627642.png'),
              actions: <Widget>[IconButton(icon: Icon(Icons.search), tooltip: '搜索', onPressed: (){}, color: Colors.white,)],
              //bottom: ,
          ),
          backgroundColor: Colors.grey[50],
          body: new Column(
            children: <Widget>[
              //添加容器
              new Container(
                width: 200.0,
                height: 200.0,
                //添加边框装饰效果
                decoration: BoxDecoration(
                  color: Colors.white,
                  //设置上下左右框样式
                  border: new Border.all(
                    color: Colors.grey,
                    width: 8.0,
                  ),
                  borderRadius: const BorderRadius.all(const Radius.circular(8.0)
                  ),
                ),
                child: new Column(
                  children: <Widget>[
                    new Text(
                      'Flutter',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 56.0),
                    ),
                    new Text(
                      '这里是主页',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15.0),
                    ),
                  ],
                ),
              ),
              //添加网络图片
              new Image.network(
                //Image URL
                'https://piccdn.igetget.com/img/201912/11/201912111849270831585814.png',
                //填充模式
                fit: BoxFit.fitWidth,
              ),
              new Row(
                children: <Widget>[
                  //添加一个Icon
                  new Icon(Icons.phone, color: Colors.green[500], size: 80.0,),
                  new IconButton(icon: Icon(Icons.volume_up, size: 48.0,), 
                  tooltip: '按下操作', 
                  onPressed: (){
                    print('按下操作');
                  }),
                  new RaisedButton(
                    onPressed: (){
                      //按钮按下事件
                      print('跳转到SecongPage');
                      Navigator.pushNamed(context, '/second');
                    },
                    child: new Text('跳转到SecongPage'),
                  ),
                ],
              ),
            ],
          ),
          //创建底部导航按钮
          bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.chat), title: Text('信息')), 
              BottomNavigationBarItem(icon: Icon(Icons.contacts), title: Text('通讯录')), 
              BottomNavigationBarItem(icon: Icon(Icons.account_circle), title: Text('发现')), 
            ],
            currentIndex: _selectedIdex,
            fixedColor: Colors.deepPurple,
            onTap:  _onItemTapped, //按下事件处理
            ),
        );
  }
  
  //定义按下处理事件，设置当前索引Idex
  void _onItemTapped(int index) {
    setState(() {
      _selectedIdex = index;
    });
  }
}

class SecondPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
      return new Scaffold(
        appBar: AppBar(
          title: Text('这是第二页'),
          centerTitle: true,
        ),
       body: Center(
          child: RaisedButton(
                      onPressed: (){
                        //按钮按下事件
                        print('跳转到MyHomePage');
                        Navigator.pushNamed(context, 'MyHomePage');
                      },
                      child: Text('跳转到MyHomePage', ),
        ),
      ),
      //底部导航栏
      bottomNavigationBar: BottomAppBar(
        child: Container(height: 50.0,),
      ),
      //添加FloatingActionButton按钮
      floatingActionButton: FloatingActionButton(
        onPressed: (){}, 
        tooltip: '增加一条问题记录',
        // child: Icon(Icons.add),
        child: Text('＋记录'),
        ),
        //FloatingActionButtonLocation，居中显示
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}