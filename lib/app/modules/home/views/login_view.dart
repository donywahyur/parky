import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'input.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.w,
      height: 280.h,
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Input(
            text: 'Telephone',
          ),
          SizedBox(
            height: 20,
          ),
          Input(
            text: 'Password',
          )
        ],
      ),
    );
  }
}
