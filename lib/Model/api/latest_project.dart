
class LatestProjects {
  String? description;
  List<ProjectItems>? items;

  LatestProjects({this.description, this.items});

  LatestProjects.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    if (json['items'] != null) {
      items = <ProjectItems>[];
      json['items'].forEach((v) {
        items!.add( ProjectItems.fromJson(v));
      });
    }
  }
}

class ProjectItems {
  String? screenname;
  int? id;
  String? title;
  String? image;
  String? cityname;
  String? icon;

  ProjectItems(
      {this.screenname,
        this.id,
        this.title,
        this.image,
        this.cityname,
        this.icon});

  ProjectItems.fromJson(Map<String, dynamic> json) {
    screenname = json['screenname'];
    id = json['id'];
    title = json['title'];
    image = json['image'];
    cityname = json['cityname'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['screenname'] = screenname;
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
    data['cityname'] = cityname;
    data['icon'] = icon;
    return data;
  }
}
