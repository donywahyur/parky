import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:parky/app/data/constant.dart';
import 'package:parky/app/modules/home/controllers/home_controller.dart';

class Input extends StatelessWidget {
  const Input({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;
  RegExp get _emailRegex => RegExp(r'^\S+@\S+$');

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Container(
      //get width from screen
      width: MediaQuery.of(context).size.width,
      height: 60.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: const GradientBoxBorder(gradient: gradientPrimary, width: 2)),
      child: Row(children: [
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
          child: Icon(
            text == 'Name'
                ? Icons.person
                : text == 'Telephone'
                    ? Icons.phone
                    : Icons.lock,
            color: kBlue,
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        Expanded(
            child: text == 'Name'
                ? TextFormField(
                    style: kSubtitle.copyWith(color: kBlue),
                    controller: controller.nameController,
                    validator: ((value) {
                      if (value!.isEmpty) {
                        return 'Insert your name';
                      }
                      // if (!_emailRegex.hasMatch(value)) {
                      //   return 'Insert a valid email';
                      // }
                      return null;
                    }),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Name',
                      fillColor: kBlue,
                    ),
                  )
                : text == 'Telephone'
                    ? TextFormField(
                        style: kSubtitle.copyWith(color: kBlue),
                        controller: controller.telephoneController,
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return 'Insert your telephone';
                          }
                          return null;
                        }),
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Telephone',
                          fillColor: kBlue,
                        ),
                      )
                    : TextFormField(
                        style: kSubtitle.copyWith(color: kBlue),
                        onTap: () {},
                        controller: controller.passwordController,
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return 'Insert your password';
                          }
                          return null;
                        }),
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password',
                          fillColor: kBlue,
                        ),
                      )),
      ]),
    );
  }
}
