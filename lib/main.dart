import 'package:aqarek_task/Controller/home_controller.dart';
import 'package:aqarek_task/Home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Utils/main_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeController>(
          create: (context) => HomeController(),
        ),
      ],
      child: MaterialApp(
        navigatorKey: MainUtils.navKey,
        title: 'Aqarek task',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "Arabic_Font",
          useMaterial3: true,
        ),
        home: const HomeScreen(),
        builder: (context, child) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: child!,
          );
        },
      ),
    );
  }
}

