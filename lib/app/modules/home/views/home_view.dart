import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:parky/app/data/constant.dart';
import 'package:parky/app/routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onHorizontalDragEnd: (details) {
            var selectedIndex = controller.selectedIndex.toInt();
            if (details.primaryVelocity! > 0) {
              if (selectedIndex == 0) {
                controller.selectedIndex.value = 2;
              } else {
                controller.selectedIndex.value--;
              }
            } else if (details.primaryVelocity! < 0) {
              if (selectedIndex == 2) {
                controller.selectedIndex.value = 0;
              } else {
                controller.selectedIndex.value++;
              }
            }
          },
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                    height: 200.h,
                    width: 200.w,
                    child: Image.asset(
                      'assets/logo.png',
                      fit: BoxFit.contain,
                    )),
                SizedBox(
                  height: 50.h,
                ),
                Obx(() => controller.pages[controller.selectedIndex.toInt()]),
                SizedBox(
                  height: 60.h,
                ),
                Obx(() {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildShape(0, controller.selectedIndex.toInt()),
                      buildShape(1, controller.selectedIndex.toInt()),
                      buildShape(2, controller.selectedIndex.toInt()),
                    ],
                  );
                }),
                SizedBox(
                  height: 20.h,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                  onPressed: () {
                    if (controller.formAction.value) {
                      var selectedIndex = controller.selectedIndex.toInt();
                      if (selectedIndex == 0) {
                        controller.selectedIndex.value = 1;
                      } else if (selectedIndex == 1) {
                        if (formKey.currentState!.validate()) {
                          //register
                          controller.register();
                        }
                      } else {
                        //login
                        if (formKey.currentState!.validate()) {
                          //login
                          controller.login();
                        }
                      }
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: gradientPrimary,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    width: 240.w,
                    height: 60.h,
                    child: Center(
                      child: Obx(() => Text(
                            !controller.formAction.value
                                ? 'Please Wait...'
                                : controller
                                    .menu[controller.selectedIndex.toInt()],
                            style: kHeading5.copyWith(
                              color: Colors.white,
                            ),
                          )),
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

  Widget buildShape(int index, int selectedIndex) {
    final double width = index == selectedIndex ? 60 : 15;
    const double height = 15;

    return Container(
      margin: const EdgeInsets.all(8),
      width: width,
      height: height,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.blue,
      ),
    );
  }
}
