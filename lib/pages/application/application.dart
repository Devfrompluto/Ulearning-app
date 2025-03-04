import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_riverpod/common/utils/app_colors.dart';
import 'package:ulearning_riverpod/common/widgets/app_shadow.dart';
import 'package:ulearning_riverpod/pages/application/widgets/widgets.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: Container(),
          bottomNavigationBar: Container(
            width: 375.w,
            height: 58.h,
            decoration: appBoxShadowWithRadius(),
            child: BottomNavigationBar(
              elevation: 0,
              items: bottomTabs,
            ),
          ),
        ),
      ),
    );
  }
}
