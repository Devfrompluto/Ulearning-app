import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_riverpod/common/widgets/button_widgets.dart';
import 'package:ulearning_riverpod/common/widgets/text_widgets.dart';
import 'package:ulearning_riverpod/pages/sign_in/widgets/sign_in_widget.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

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
                // top login button
                thirdPartyLogin(),
                // more login option message
                Center(
                  child:
                      text14Normal(text: "Or use your email account to login"),
                ),
                SizedBox(height: 50.h),
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
                // forgot text
                Container(
                  margin: EdgeInsets.only(left: 25.w),
                  child: textUnderline(text: "Forgot Password?"),
                ),
                SizedBox(height: 90.h),
                // app login button
                Center(child: appButton(text: "Login")),
                SizedBox(height: 20),
                // app register button
                Center(child: appButton(text: "Register", isLogin: false)),
                //appButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
