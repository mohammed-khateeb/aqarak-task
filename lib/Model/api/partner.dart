class Partner {
  String? screenname;
  int? id;
  String? title;
  String? image;

  Partner({this.screenname, this.id, this.title, this.image});

  Partner.fromJson(Map<String, dynamic> json) {
    screenname = json['screenname'];
    id = json['id'];
    title = json['title'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['screenname'] = screenname;
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
    return data;
  }
}
