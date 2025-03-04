import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_riverpod/common/widgets/image_widgets.dart';

var bottomTabs = <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    icon: Container(
      width: 15.w,
      height: 15.w,
      child: appImageWithColor(),
    ),
    label: "Home",
  ),
  BottomNavigationBarItem(
    icon: Container(
      width: 15.w,
      height: 15.w,
      child: appImageWithColor(),
    ),
    label: "Search",
  )
];
