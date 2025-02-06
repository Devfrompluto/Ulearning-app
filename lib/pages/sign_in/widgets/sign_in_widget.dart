import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_riverpod/common/utils/app_colors.dart';
import 'package:ulearning_riverpod/common/widgets/app_shadow.dart';
import 'package:ulearning_riverpod/common/widgets/image_widgets.dart';
import 'package:ulearning_riverpod/common/widgets/text_widgets.dart';

/* 
preferredSize widget gives us a space or height from the appbar downwards and we can put child 
in the given space
*/

AppBar buildAppBar() {
  return AppBar(
    //backgroundColor: Colors.white,
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(1),
      child: Container(
        color: Colors.grey.withOpacity(0.3),
        height: 1,
      ),
    ),
    title: text16Normal(text: "Login", color: AppColors.primaryText),
  );
}

Widget thirdPartyLogin() {
  return Container(
    margin: EdgeInsets.only(left: 80.w, right: 80.w, top: 40.h, bottom: 20.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _loginButton("assets/icons/google.png"),
        _loginButton("assets/icons/apple.png"),
        _loginButton("assets/icons/facebook.png"),
      ],
    ),
  );
}

Widget _loginButton(String imagePath) {
  return GestureDetector(
    onTap: () {},
    child: SizedBox(
      width: 40.w,
      height: 40.h,
      child: Image.asset(imagePath),
    ),
  );
}

Widget appTextField({
  String text = "",
  String iconName = "",
  String hintText = "Type in your info",
  bool obscureText = false,
}) {
  return Container(
    padding: EdgeInsets.only(left: 25.w, right: 25.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        text14Normal(text: text),
        SizedBox(height: 5.h),
        Container(
          width: 325.w,
          height: 50.h,
          //color: Colors.red,
          decoration: appBoxDecorationTextField(),
          // row contains icons and textfield
          child: Row(
            children: [
              // for showing icons
              Container(
                margin: EdgeInsets.only(left: 17.w),
                child: appImage(iconPath: iconName),
              ),
              // our text field
              Container(
                margin: EdgeInsets.only(top: 3.h),
                width: 260.w,
                height: 50.h,
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    hintText: hintText,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    // defaukt border without any enabled
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    // focused border is with input
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                  ),
                  onChanged: (value) {},
                  maxLines: 1,
                  autocorrect: false,
                  obscureText: obscureText,
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}
