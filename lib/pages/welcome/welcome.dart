import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_riverpod/pages/welcome/notifier/welcome_notifier.dart';
import 'package:ulearning_riverpod/pages/welcome/widgets.dart';

//final indexProvider = StateProvider<int>((ref) => 0);

class Welcome extends ConsumerWidget {
  Welcome({super.key});

  final PageController _controller = PageController();
  //int dotsIndex = 0;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(indexDotProvider);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            margin: EdgeInsets.only(top: 30.h),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                // showing our three welcome pages
                PageView(
                  onPageChanged: (value) {
                    //dotsIndex == value;
                    ref.read(indexDotProvider.notifier).changeIndex(value);
                  },
                  controller: _controller,
                  children: [
                    // first page
                    appOnboardingPage(
                      _controller,
                      imagePath: "assets/images/reading.png",
                      title: "First See Learning",
                      subTitle:
                          "Forget about of paper all knowledge in one learning.",
                      index: 1,
                      context: context,
                    ),
                    // second page
                    appOnboardingPage(
                      _controller,
                      imagePath: "assets/images/man.png",
                      title: "Connect With Everyone",
                      subTitle:
                          "Always connect with your tutor and friends. Let's get connected",
                      index: 2,
                      context: context,
                    ),
                    // third page
                    appOnboardingPage(
                      _controller,
                      imagePath: "assets/images/boy.png",
                      title: "Always Fascinated Learning",
                      subTitle:
                          "Anywhere, anytime. The time is at your discretion. So study wherever you can",
                      index: 3,
                      context: context,
                    ),
                  ],
                ),
                // for showing dots indicator

                Positioned(
                  bottom: 50,
                  child: DotsIndicator(
                    position: index,
                    dotsCount: 3,
                    mainAxisAlignment: MainAxisAlignment.center,
                    decorator: DotsDecorator(
                      size: Size.square(9.0),
                      activeSize: Size(24, 8.0),
                      activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.w)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
