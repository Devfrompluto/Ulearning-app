import 'package:flutter/material.dart';
import 'package:ulearning_riverpod/common/widgets/app_shadow.dart';
import 'package:ulearning_riverpod/common/widgets/text_widgets.dart';
import 'package:ulearning_riverpod/pages/sign_in/sign_in.dart';

Widget appOnboardingPage(PageController controller,
    {String imagePath = 'assets/images/reading.png',
    String title = "",
    String subTitle = "",
    index = 0,
    required BuildContext context}) {
  return Column(
    children: [
      Image.asset(
        imagePath,
        fit: BoxFit.fitWidth,
      ),
      Container(
        margin: EdgeInsets.only(top: 15),
        child: text24Normal(text: title),
      ),
      Container(
        margin: EdgeInsets.only(top: 15),
        padding: EdgeInsets.only(left: 30, right: 30),
        child: text16Normal(
          text: subTitle,
        ),
      ),
      _nextButton(index, controller, context)
    ],
  );
}

Widget _nextButton(int index, PageController controller, BuildContext context) {
  return GestureDetector(
    onTap: () {
      if (index < 3) {
        controller.animateToPage(
          index,
          duration: Duration(milliseconds: 300),
          curve: Curves.linear,
        );
      } else {
        Navigator.pushNamed(
          context,
          "/signIn",
        );
      }
    },
    child: Container(
      margin: EdgeInsets.only(top: 100, left: 25, right: 25),
      width: 325,
      height: 50,
      decoration: appBoxShadow(),
      child: Center(
          child: text16Normal(
              text: index < 3 ? "Next" : "Get started", color: Colors.white)),
    ),
  );
}
