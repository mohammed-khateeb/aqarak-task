class HeaderOffers {
  int? isvideo;
  String? title;
  String? image;
  String? screenname;
  int? id;
  int? isLink;

  HeaderOffers(
      {this.isvideo,
        this.title,
        this.image,
        this.screenname,
        this.id,
        this.isLink});

  HeaderOffers.fromJson(Map<String, dynamic> json) {
    isvideo = json['isvideo'];
    title = json['title'];
    image = json['image'];
    screenname = json['screenname'];
    id = json['id'];
    isLink = json['isLink'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['isvideo'] = isvideo;
    data['title'] = title;
    data['image'] = image;
    data['screenname'] = screenname;
    data['id'] = id;
    data['isLink'] = isLink;
    return data;
  }
}
