import '../api/header_gallery.dart';
import '../api/header_offer.dart';
import '../api/header_widget.dart';
import '../api/latest_project.dart';
import '../api/partner.dart';
import '../api/unit.dart';

class HomeResponse {
  String? assistantTilte;
  String? assistantSubTilte;
  String? assistantImageUrl;
  String? fundingTilte;
  String? fundingSubTilte;
  String? fundingImageUrl;
  List<HeaderGallery>? headerGallery;
  List<HeaderOffers>? headerOffers;
  List<HeaderWidgets>? headerWidgets;
  String? partnerssectiontilte;
  List<Partner>? partners;
  String? latestprojectssectiontilte;
  LatestProjects? latestProjects;
  String? unitssectiontilte;
  Unit? units;
  int? showfilterdata;
  String? lastseensectiontitle;
  int? showAssistant;
  int? notificationCount;
  int? showPartners;
  int? showOffers;
  int? showUnits;
  int? showLatestProjects;
  int? showLastSeen;
  int? showFundingEligibility;
  int? showprojectsGroups;

  HomeResponse(
      {this.assistantTilte,
        this.assistantSubTilte,
        this.assistantImageUrl,
        this.fundingTilte,
        this.fundingSubTilte,
        this.fundingImageUrl,
        this.headerGallery,
        this.headerOffers,
        this.headerWidgets,
        this.partnerssectiontilte,
        this.partners,
        this.latestprojectssectiontilte,
        this.latestProjects,
        this.unitssectiontilte,
        this.units,
        this.showfilterdata,
        this.lastseensectiontitle,
        this.showAssistant,
        this.notificationCount,
        this.showPartners,
        this.showOffers,
        this.showUnits,
        this.showLatestProjects,
        this.showLastSeen,
        this.showFundingEligibility,
        this.showprojectsGroups});

  HomeResponse.fromJson(Map<String, dynamic> json) {
    assistantTilte = json['assistantTilte'];
    assistantSubTilte = json['assistantSubTilte'];
    assistantImageUrl = json['assistantImageUrl'];
    fundingTilte = json['fundingTilte'];
    fundingSubTilte = json['fundingSubTilte'];
    fundingImageUrl = json['fundingImageUrl'];
    if (json['headerGallery'] != null) {
      headerGallery = <HeaderGallery>[];
      json['headerGallery'].forEach((v) {
        headerGallery!.add( HeaderGallery.fromJson(v));
      });
    }
    if (json['headerOffers'] != null) {
      headerOffers = <HeaderOffers>[];
      json['headerOffers'].forEach((v) {
        headerOffers!.add( HeaderOffers.fromJson(v));
      });
    }
    if (json['headerWidgets'] != null) {
      headerWidgets = <HeaderWidgets>[];
      json['headerWidgets'].forEach((v) {
        headerWidgets!.add( HeaderWidgets.fromJson(v));
      });
    }
    partnerssectiontilte = json['partnerssectiontilte'];
    if (json['partners'] != null) {
      partners = <Partner>[];
      json['partners'].forEach((v) {
        partners!.add( Partner.fromJson(v));
      });
    }
    latestprojectssectiontilte = json['latestprojectssectiontilte'];
    latestProjects = json['latestProjects'] != null
        ?  LatestProjects.fromJson(json['latestProjects'])
        : null;
    unitssectiontilte = json['unitssectiontilte'];
    units = json['units'] != null ?  Unit.fromJson(json['units']) : null;

    showfilterdata = json['showfilterdata'];
    lastseensectiontitle = json['lastseensectiontitle'];
    showAssistant = json['showAssistant'];
    notificationCount = json['notificationCount'];
    showPartners = json['showPartners'];
    showOffers = json['showOffers'];
    showUnits = json['showUnits'];
    showLatestProjects = json['showLatestProjects'];
    showLastSeen = json['showLastSeen'];
    showFundingEligibility = json['showFundingEligibility'];
    showprojectsGroups = json['showprojectsGroups'];
  }

}









