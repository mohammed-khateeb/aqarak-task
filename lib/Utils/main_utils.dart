import 'dart:math';

import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../Widgets/custom_button.dart';
import 'color_utils.dart';

class MainUtils {
  static final navKey = GlobalKey<NavigatorState>();


  static showErrorAlertDialog(String msg,
      {Widget? secondButton, Function? onPressButton, String? doneLabel,bool barrierDismissible = true,bool withIcon = true}) {
    Size size = MediaQuery.of(navKey.currentState!.context).size;
    bool isTablet =
        MediaQuery.of(MainUtils.navKey.currentContext!).size.shortestSide >=
            550;

    showGeneralDialog(
      barrierDismissible: barrierDismissible,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 300),
      barrierLabel: "close",
      context: navKey.currentState!.context,
      pageBuilder: (_, __, ___) {
        return const Center();
      },
      transitionBuilder: (context, a1, a2, widget) {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(
            opacity: a1.value,
            child: WillPopScope(
              onWillPop: () async {
                return barrierDismissible;
              },
              child: AlertDialog(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                titlePadding: EdgeInsetsDirectional.only(
                    end: size.height * 0.015,
                    top: isTablet ? size.height * 0.0 : size.height * 0.015),
                insetPadding: isTablet
                    ? EdgeInsets.only(
                    left: size.width * 0.21,
                    right: size.width * 0.21,
                    top: size.height * 0.21,
                    bottom: size.height * 0.21)
                    : const EdgeInsets.symmetric(
                    horizontal: 40.0, vertical: 24.0),
                contentPadding: EdgeInsets.symmetric(
                    vertical: isTablet ? size.height * 0.0 : size.height * 0.022,
                    horizontal: isTablet ? size.width * 0.0 : size.width * 0.035),
                content: Padding(
                  padding: isTablet
                      ? EdgeInsetsDirectional.only(bottom: size.height * 0.03)
                      : EdgeInsets.all(0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if(withIcon)
                        Padding(
                          padding:
                          isTablet ? EdgeInsets.all(12.0) : EdgeInsets.all(0.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              if(barrierDismissible)
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(
                                    Icons.close,
                                    size: size.height * 0.025,
                                    color: Colors.grey,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      Padding(
                        padding: isTablet
                            ? EdgeInsetsDirectional.only(
                            start: size.width * 0.04, end: size.width * 0.04)
                            : EdgeInsetsDirectional.all(0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            if(withIcon)
                              Container(
                                height: size.height * 0.095,
                                width: size.height * 0.095,
                                decoration: const BoxDecoration(
                                    color: kPrimaryColor, shape: BoxShape.circle),
                                child: Icon(
                                  Icons.close,
                                  color: Colors.white,
                                  size: size.height * 0.065,
                                ),
                              ),
                            if(withIcon)
                              SizedBox(
                                height: size.height * 0.05,
                              ),
                            Text(
                              msg,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color:withIcon? kPrimaryColor:Colors.grey[800],
                                  fontSize: size.height * 0.0195,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: size.height * 0.025,
                            ),
                            CustomButton(
                              width: size.width * 0.41,
                              height: size.height * 0.047,
                              label: doneLabel ?? "OK",
                              onPressed: () {
                                Navigator.pop(context);
                                if (onPressButton != null) onPressButton();

                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }


}
