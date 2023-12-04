class HeaderGallery {
  int? isvideo;
  String? image;
  int? isLink;
  String? linktext;

  HeaderGallery(
      {this.isvideo,
        this.image,
        this.isLink,
        this.linktext});

  HeaderGallery.fromJson(Map<String, dynamic> json) {
    isvideo = json['isvideo'];
    image = json['image'];
    isLink = json['isLink'];
    linktext = json['linktext'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['isvideo'] = isvideo;
    data['image'] = image;
    data['isLink'] = isLink;
    data['linktext'] = linktext;
    return data;
  }
}
