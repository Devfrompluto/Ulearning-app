import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_riverpod/common/widgets/app_bar.dart';
import 'package:ulearning_riverpod/common/widgets/app_textfields.dart';
import 'package:ulearning_riverpod/common/widgets/button_widgets.dart';
import 'package:ulearning_riverpod/common/widgets/text_widgets.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: buildAppBar(),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30.h),
                // more login option message
                Center(
                  child: text14Normal(
                      text: "Enter your details below & free sign up"),
                ),
                SizedBox(height: 40.h),
                // username text box
                appTextField(
                    text: "User name",
                    iconName: "assets/icons/user.png",
                    hintText: "Enter your user name"),
                SizedBox(height: 20.h),
                // email text box
                appTextField(
                    text: "Email",
                    iconName: "assets/icons/user.png",
                    hintText: "Enter your email address"),
                SizedBox(height: 20.h),
                // password text box
                appTextField(
                    text: "Password",
                    iconName: "assets/icons/lock.png",
                    hintText: "Enter your password",
                    obscureText: true),
                SizedBox(height: 20.h),
                // password text box
                appTextField(
                    text: "Confirm Password",
                    iconName: "assets/icons/lock.png",
                    hintText: "Enter your confirmed password",
                    obscureText: true),
                SizedBox(height: 20.h),
                // forgot text
                Container(
                  margin: EdgeInsets.only(left: 25.w),
                  child: text14Normal(
                      text:
                          "By creating an account you agree with our terms and conditions."),
                ),
                SizedBox(height: 70.h),

                // app register button
                Center(
                    child: appButton(
                  text: "Register",
                  isLogin: true,
                  context: context,
                )),
                //appButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
