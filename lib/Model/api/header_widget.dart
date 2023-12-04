class HeaderWidgets {
  String? screenname;
  String? title;
  String? imageurl;
  String? iconurl;

  HeaderWidgets({this.screenname, this.title, this.imageurl, this.iconurl});

  HeaderWidgets.fromJson(Map<String, dynamic> json) {
    screenname = json['screenname'];
    title = json['title'];
    imageurl = json['imageurl'];
    iconurl = json['iconurl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['screenname'] = screenname;
    data['title'] = title;
    data['imageurl'] = imageurl;
    data['iconurl'] = iconurl;
    return data;
  }
}
