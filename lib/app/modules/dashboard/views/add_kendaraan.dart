import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:parky/app/data/constant.dart';
import 'package:parky/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:parky/app/modules/dashboard/views/app_bar.dart';
import 'package:parky/app/modules/dashboard/views/text_gradient.dart';

class AddKendaraan extends StatelessWidget {
  const AddKendaraan({super.key});
  static final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DashboardController>();

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: const MyAppBar(
          menu: 'Kendaraan',
        ),
        body: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
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
                          teks: 'Tambah Kendaraan',
                          align: Alignment.centerLeft,
                          gradient: 1,
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
                        height: 60.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: const GradientBoxBorder(
                                gradient: gradientPrimary, width: 2)),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 50.w,
                                height: 60.h,
                                decoration: const BoxDecoration(
                                    border: Border(
                                  right: BorderSide(
                                    width: 2,
                                    color: kBlue,
                                  ),
                                )),
                                child: const Icon(
                                  Icons.add,
                                  color: kBlue,
                                  size: 40,
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Expanded(
                                child: TextFormField(
                                  style: kHeading6.copyWith(color: kBlue),
                                  onTap: () {},
                                  controller: controller.noKendaraan,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'No Kendaraan',
                                    fillColor: kBlue,
                                  ),
                                ),
                              )
                            ]),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (controller.formAction.value == false) {
                            return;
                          }
                          if (controller.noKendaraan.text.isEmpty) {
                            Get.snackbar(
                                'Error', 'No Kendaraan tidak boleh kosong');
                            return;
                          }
                          controller.addNoKendaraan();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: gradientPrimary,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          width: 300.w,
                          height: 60.h,
                          child: Center(
                            child: Obx(() => Text(
                                  !controller.formAction.value
                                      ? 'Please Wait...'
                                      : 'Add',
                                  style: kHeading5.copyWith(
                                    color: Colors.white,
                                    decoration: TextDecoration.none,
                                  ),
                                )),
                          ),
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
                          'assets/undraw_add_document.png',
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
