import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_riverpod/common/global/global_loader.dart';
import 'package:ulearning_riverpod/common/utils/app_colors.dart';
import 'package:ulearning_riverpod/common/widgets/app_bar.dart';
import 'package:ulearning_riverpod/common/widgets/app_textfields.dart';
import 'package:ulearning_riverpod/common/widgets/button_widgets.dart';
import 'package:ulearning_riverpod/common/widgets/text_widgets.dart';
import 'package:ulearning_riverpod/pages/sign_in/notifier/sign_in_notifier.dart';
import 'package:ulearning_riverpod/pages/sign_in/sign_in_controller.dart';
import 'package:ulearning_riverpod/pages/sign_in/widgets/sign_in_widget.dart';

class SignIn extends ConsumerStatefulWidget {
  const SignIn({super.key});

  @override
  ConsumerState<SignIn> createState() => _SignInState();
}

class _SignInState extends ConsumerState<SignIn> {
  late SignInController _controller;

  @override
  void initState() {
    // TODO: implement initState
    _controller = SignInController(ref);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final signInProvider = ref.watch(signInNotifierProvider);
    final loader = ref.watch(appLoaderProvider);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: buildAppBar(title: "Login"),
          backgroundColor: Colors.white,
          body: loader == false
              ? SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // top login button
                      thirdPartyLogin(),
                      // more login option message
                      Center(
                        child: text14Normal(
                            text: "Or use your email account to login"),
                      ),
                      SizedBox(height: 50.h),
                      // email text box
                      appTextField(
                        controller: _controller.emailController,
                        text: "Email",
                        iconName: "assets/icons/user.png",
                        hintText: "Enter your email address",
                        func: (value) => ref
                            .read(signInNotifierProvider.notifier)
                            .onUserEmailChange(value),
                      ),
                      SizedBox(height: 20.h),
                      // password text box
                      appTextField(
                        controller: _controller.passwordController,
                        text: "Password",
                        iconName: "assets/icons/lock.png",
                        hintText: "Enter your password",
                        obscureText: true,
                        func: (value) => ref
                            .read(signInNotifierProvider.notifier)
                            .onUserPasswordChange(value),
                      ),
                      SizedBox(height: 20.h),
                      // forgot text
                      Container(
                        margin: EdgeInsets.only(left: 25.w),
                        child: textUnderline(text: "Forgot Password?"),
                      ),
                      SizedBox(height: 90.h),
                      // app login button
                      Center(
                        child: appButton(
                          text: "Login",
                          func: () => _controller.handleSignIn(),
                        ),
                      ),
                      SizedBox(height: 20),
                      // app register button
                      Center(
                        child: appButton(
                            text: "Register",
                            isLogin: false,
                            context: context,
                            func: () =>
                                Navigator.pushNamed(context, "/register")),
                      ),
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
