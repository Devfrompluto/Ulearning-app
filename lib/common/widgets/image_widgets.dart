import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget appImage({
  String iconPath = "assets/icons/user.png",
  double width = 16,
  double height = 16,
}) {
  return Image.asset(
    iconPath.isEmpty ? "assets/icons/user.png" : iconPath,
    width: width.w,
    height: height.h,
  );
}
