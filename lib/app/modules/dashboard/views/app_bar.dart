import 'package:flutter/material.dart';
import 'package:parky/app/data/constant.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  const MyAppBar({Key? key, required this.menu}) : super(key: key);
  final String menu;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            kGreen,
            kBlue,
          ]),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          )),
      child: AppBar(
        title: Text(
          menu,
          style: kHeading5.copyWith(color: Colors.white),
        ),
        centerTitle: false,
        backgroundColor: Colors.transparent, // Make the app bar transparent
        elevation: 0, // Remove the app bar elevation
      ),
    );
  }
}
