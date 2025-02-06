import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_riverpod/common/utils/app_colors.dart';
import 'package:ulearning_riverpod/common/widgets/app_shadow.dart';
import 'package:ulearning_riverpod/common/widgets/text_widgets.dart';

Widget appButton({
  String text = "Text",
  double width = 325,
  double height = 45,
  bool isLogin = true,
  BuildContext? context,
  void Function()? func,
}) {
  return GestureDetector(
    onTap: func,
    child: Container(
      width: width.w,
      height: height.h,
      decoration: appBoxShadow(
          color: isLogin ? AppColors.primaryElement : Colors.white,
          border: Border.all(
            color: AppColors.primaryFourElementText,
          )),
      child: Center(
          child: text16Normal(
        text: text,
        color: isLogin ? AppColors.primaryBackground : AppColors.primaryText,
      )),
    ),
  );
}
