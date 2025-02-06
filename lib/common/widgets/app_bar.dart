import 'package:flutter/material.dart';
import 'package:ulearning_riverpod/common/utils/app_colors.dart';
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
