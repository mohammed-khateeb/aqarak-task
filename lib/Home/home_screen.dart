import 'package:aqarek_task/Home/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Controller/home_controller.dart';
import '../Shimmers/home_shimmer.dart';
import '../Utils/dimensions.dart';
import '../bottom_bar/custom_nav_bar.dart';
import '../bottom_bar/notch_bottom_bar_controller.dart';
import 'Components/banner.dart';
import 'Components/categories_view.dart';
import 'Components/latest_projects_view.dart';
import 'Components/middle_banner.dart';
import 'Components/partners_view.dart';
import 'Components/units_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen();

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final NotchBottomBarController _controller = NotchBottomBarController();

  @override
  void initState() {
    context.read<HomeController>().getHomeData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        bottomNavigationBar: CustomNavBar(),
        body: Consumer<HomeController>(
          builder: (context,homeData,_) {
            return homeData.waiting
                ?const HomeShimmer()
                :ListView(
              padding: EdgeInsets.zero,
              children:  [
                HomeBanner(galleries: homeData.headerGalleries,),
                const SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE,),
                CategoriesView(headerWidgets: homeData.headerWidgets),
                const SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE,),
                MiddleBanner(headerOffers: homeData.headerOffers,),
                TitleWidget(title: homeData.lastProjectTitle,),
                LatestProjectsView(latestProjects: homeData.latestProjects,),
                TitleWidget(title: homeData.unitTitle,),
                UnitsView(units: homeData.units,),
                TitleWidget(title: homeData.partnerTitle,),
                PartnersView(partners: homeData.partners,),
                const SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE,),
              ],
            );
          }
        ),
      ),
    );
  }
}
