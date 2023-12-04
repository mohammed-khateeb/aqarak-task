
import 'package:aqarek_task/Model/api/header_gallery.dart';
import 'package:aqarek_task/Model/api/header_offer.dart';
import 'package:aqarek_task/Model/api/header_widget.dart';
import 'package:aqarek_task/Model/api/latest_project.dart';
import 'package:aqarek_task/Model/api/partner.dart';
import 'package:aqarek_task/Model/api/unit.dart';
import '../Model/Response/home_response.dart';
import '../Model/Response/request_response.dart';
import '../Services/home_service.dart';
import 'package:flutter/material.dart';
class HomeController with ChangeNotifier {
  String? lastProjectTitle;
  String? partnerTitle;
  String? unitTitle;

  List<HeaderGallery> headerGalleries = [];
  List<HeaderOffers> headerOffers = [];
  List<HeaderWidgets> headerWidgets = [];
  List<ProjectItems> latestProjects = [];
  List<Partner> partners = [];
  List<UnitItems> units = [];

  bool waiting = true;

  Future<void> getHomeData() async {
    final HomeService homeService = HomeService();

    RequestResponse response = await homeService.getHomeData();
    if(response.success){
      setHomeData(HomeResponse.fromJson(response.data!));
    }
  }

  setHomeData(HomeResponse response){
    headerGalleries = response.headerGallery ?? [];
    headerOffers = response.headerOffers ?? [];
    headerWidgets = response.headerWidgets ?? [];
    partners = response.partners ?? [];
    latestProjects = response.latestProjects?.items ?? [];
    units = response.units?.items ?? [];
    lastProjectTitle = response.latestprojectssectiontilte;
    unitTitle = response.unitssectiontilte;
    partnerTitle = response.partnerssectiontilte;
    waiting = false;
    notifyListeners();
  }


}
