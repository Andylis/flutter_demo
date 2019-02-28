class FilterButtonModel {
  String title; //按钮title
  List contents; //下拉列表
  String type; //下拉筛选类型
  Function callback; //按钮点击回调

  FilterButtonModel({this.title, this.contents, this.type, this.callback});
}