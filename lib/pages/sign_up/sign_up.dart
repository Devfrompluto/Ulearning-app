import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_riverpod/common/global/global_loader.dart';
import 'package:ulearning_riverpod/common/utils/app_colors.dart';
import 'package:ulearning_riverpod/common/widgets/app_bar.dart';
import 'package:ulearning_riverpod/common/widgets/app_textfields.dart';
import 'package:ulearning_riverpod/common/widgets/button_widgets.dart';
import 'package:ulearning_riverpod/common/widgets/text_widgets.dart';
import 'package:ulearning_riverpod/pages/sign_up/notifier/register_notifier.dart';
import 'package:ulearning_riverpod/pages/sign_up/sign_up_controller.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({super.key});

  @override
  ConsumerState<SignUp> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
  late SignUpController _controller;

  @override
  void initState() {
    _controller = SignUpController(ref: ref);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final regProvider = ref.watch(registerNotifierProvider);
    // reg provider
    final loader = ref.watch(appLoaderProvider);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: buildAppBar(title: "Sign Up"),
          backgroundColor: Colors.white,
          body: loader == false
              ? SingleChildScrollView(
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
                        hintText: "Enter your user name",
                        func: (value) => ref
                            .read(registerNotifierProvider.notifier)
                            .onUserNameChange(value),
                      ),
                      SizedBox(height: 20.h),
                      // email text box
                      appTextField(
                        text: "Email",
                        iconName: "assets/icons/user.png",
                        hintText: "Enter your email address",
                        func: (value) => ref
                            .read(registerNotifierProvider.notifier)
                            .onUserEmailChange(value),
                      ),
                      SizedBox(height: 20.h),
                      // password text box
                      appTextField(
                        text: "Password",
                        iconName: "assets/icons/lock.png",
                        hintText: "Enter your password",
                        obscureText: true,
                        func: (value) => ref
                            .read(registerNotifierProvider.notifier)
                            .onUserPasswordChange(value),
                      ),
                      SizedBox(height: 20.h),
                      // password text box
                      appTextField(
                        text: "Confirm Password",
                        iconName: "assets/icons/lock.png",
                        hintText: "Enter your confirmed password",
                        obscureText: true,
                        func: (value) => ref
                            .read(registerNotifierProvider.notifier)
                            .onUserRePasswordChange(value),
                      ),
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
                        func: () => _controller.handleSignUp(),
                      )),
                      //appButton(),
                    ],
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.blue,
                    color: AppColors.primaryElement,
                  ),
                ),
        ),
      ),
    );
  }
}
