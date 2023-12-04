
import 'package:aqarek_task/Controller/home_controller.dart';
import 'package:aqarek_task/Services/api_services.dart';
import 'package:aqarek_task/Utils/main_utils.dart';
import 'package:provider/provider.dart';

import '../Constant/api_end_pionts.dart';
import '../Model/Response/request_response.dart';

class HomeService{
  final ApiServices _apiServices = ApiServices();
  Future<RequestResponse> getHomeData() async {
    final RequestResponse response = await _apiServices.get(
        url: '${EndPoints.baseUrl}${EndPoints.homeData}');
    if(!response.success){
      Future.delayed(Duration(seconds: 1)).then((value) {
        MainUtils.showErrorAlertDialog(response.error??"Error",doneLabel: "Try Again",onPressButton: (){
          MainUtils.navKey.currentContext!.read<HomeController>().getHomeData();
        });
      });

    }
    return response;
  }
}