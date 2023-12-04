class Unit {
  List<UnitItems>? items;

  Unit({this.items});

  Unit.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <UnitItems>[];
      json['items'].forEach((v) {
        items!.add( UnitItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UnitItems {
  String? screenname;
  String? photourl;
  String? title;
  String? text;
  String? totalprice;
  String? pricetext;

  UnitItems(
      {this.screenname,
        this.photourl,
        this.title,
        this.text,
        this.totalprice,
        this.pricetext});

  UnitItems.fromJson(Map<String, dynamic> json) {
    screenname = json['screenname'];
    photourl = json['photourl'];
    title = json['title'];
    text = json['text'];
    totalprice = json['totalprice'];
    pricetext = json['pricetext'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['screenname'] = screenname;
    data['photourl'] = photourl;
    data['title'] = title;
    data['text'] = text;
    data['totalprice'] = totalprice;
    data['pricetext'] = pricetext;
    return data;
  }
}
