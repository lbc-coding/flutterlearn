// 定义主页top控件数据结构，用于接收用户信息
class TopItemModel {
  String user_photo_url; // 用户头像URL
  String user_name; // 用户姓名
  String user_company; // 用户所属公司
  List<String> user_roles; // 接收的用户角色列表

  // 构造函数语法糖，为属性赋值
  TopItemModel(
      {this.user_photo_url,
      this.user_name,
      this.user_company,
      this.user_roles});
  // 定义工厂函数
  factory TopItemModel.fromJson(Map<String, dynamic> json){
    return TopItemModel(
      user_photo_url: json['user_photo_url'],
      user_name: json['user_name'],
      user_company: json['user_company'],
      user_roles: json['user_roles'],
    );
  }
}

// 定义主页Bottom控件数据结构，用于用户功能入口列表
class FunListModel {
  Map<String, String> user_fun_list; // 接收的用户角色列表

  // 构造函数语法糖，为属性赋值
  FunListModel(
      {this.user_fun_list});
}