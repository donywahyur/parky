// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parky/app/data/constant.dart';

class TextGradient extends StatelessWidget {
  var align;
  var gradient;

  TextGradient({
    Key? key,
    required this.teks,
    this.align = Alignment.center,
    this.gradient = '0',
  }) : super(key: key);
  final String teks;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: align,
      padding: const EdgeInsets.all(10),
      child: ShaderMask(
        shaderCallback: (bounds) {
          return LinearGradient(
              begin:
                  gradient == "0" ? Alignment.topCenter : Alignment.centerLeft,
              end: gradient == "0"
                  ? Alignment.bottomCenter
                  : Alignment.centerRight,
              colors: const [kBlue, kGreen]).createShader(bounds);
        },
        child: Text(
          teks,
          style: kHeading6.copyWith(
            fontSize: 20.sp,
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontFamily: GoogleFonts.codaCaption().fontFamily,
            decoration: TextDecoration.none,
          ),
          overflow: TextOverflow.clip,
          maxLines: 1,
        ),
      ),
    );
  }
}
