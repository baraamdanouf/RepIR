import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test7/utils/const_colors.dart';
import 'package:test7/utils/const_images.dart';
import 'package:test7/view/splash/splash_controller.dart';

class Splash extends GetView<SplashController> {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    controller.animationController.forward();
//    Timer(Duration(seconds: 7), () => Get.off(Onboarding()));
    return ScreenUtilInit(
      designSize: const Size(414, 900),
      minTextAdapt: true,
      splitScreenMode: true,
      builder:(context, child) =>  Scaffold(
        key: controller.splashKey,
        body: Container(
            width: width,
            height: height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  primaryColor,
                  secondaryColor
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SlideTransition(
                    position: controller.animation2,
                    child: Padding(
                      padding: EdgeInsets.only(top: 350.sp),
                      child: Image.asset(
                        IMG_LOGO,
                        height: 200.h,
                        width: 500.w,
                      ),
                    )),
                Row(
                  children: List.generate(
                   3,
                        (index) =>  Container(
                        margin: const EdgeInsets.all(4),
                        width: 12.sp,
                        height: 12.sp,
                        decoration: const BoxDecoration(
                            color: greyDark,
                            shape: BoxShape.circle),
                    ),
                  ),
                ),
                SlideTransition(
                  position: controller.animation1,
                  child: Text(
                          "All Right Reserved to REPAIR HOME SERVICE® 2022",
                          style: TextStyle(
                            fontSize: textVeryVerySmall,
                            color: Colors.white,
                          ),
                        ),
                ),
              ],
            )),
      ),
    );
  }
}
