import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:parky/app/data/constant.dart';
import 'package:parky/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:parky/app/modules/dashboard/views/app_bar.dart';
import 'package:parky/app/modules/dashboard/views/text_gradient.dart';

class SlotParkir extends StatelessWidget {
  const SlotParkir({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DashboardController>();
    controller.getSlot();
    final formKey = GlobalKey<FormState>();
    return Scaffold(
        appBar: const MyAppBar(
          menu: 'Slot Parkir',
        ),
        body: Container(
          color: Colors.white,
          child: Form(
            key: formKey,
            child: Column(children: [
              Container(
                  margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: TextGradient(
                          teks: 'Slot Parkir',
                          align: Alignment.centerLeft,
                          gradient: 1,
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 25),
                        decoration: BoxDecoration(
                          gradient: gradientPrimary,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        width: 320.w,
                        height: 260.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 100.w,
                              height: 260.h,
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'SLOT',
                                    style: kHeading6.copyWith(
                                      fontSize: 18.sp,
                                      color: Colors.white,
                                      fontFamily:
                                          GoogleFonts.codaCaption().fontFamily,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40.h,
                                  ),
                                  Obx(() => Text(
                                        controller.slot.value.toString(),
                                        style: kHeading6.copyWith(
                                          fontSize: 18.sp,
                                          color: Colors.white,
                                          fontFamily: GoogleFonts.codaCaption()
                                              .fontFamily,
                                        ),
                                      )),
                                ],
                              ),
                            ),
                            Container(
                              color: Colors.white,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: SizedBox(
                                width: 2,
                                height: 260.h,
                              ),
                            ),
                            Container(
                              width: 170.w,
                              height: 260.h,
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'SLOT TERSEDIA',
                                    style: kHeading6.copyWith(
                                      fontSize: 18.sp,
                                      color: Colors.white,
                                      fontFamily:
                                          GoogleFonts.codaCaption().fontFamily,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40.h,
                                  ),
                                  Obx(() => Text(
                                        (controller.slot.value -
                                                controller.slotTerisi.value)
                                            .toString(),
                                        style: kHeading6.copyWith(
                                          fontSize: 18.sp,
                                          color: Colors.white,
                                          fontFamily: GoogleFonts.codaCaption()
                                              .fontFamily,
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
              Expanded(
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 50,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Image.asset(
                          'assets/undraw_Projections.png',
                          width: MediaQuery.of(context).size.width - 40,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ]),
          ),
        ));
  }
}
