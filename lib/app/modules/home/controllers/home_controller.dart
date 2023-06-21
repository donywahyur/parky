import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parky/app/modules/home/views/login_view.dart';
import 'package:parky/app/modules/home/views/register_view.dart';
import 'package:parky/app/modules/home/views/splash_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: depend_on_referenced_packages
import 'package:crypto/crypto.dart';
import 'package:hive/hive.dart';
import 'package:parky/app/routes/app_pages.dart';

class HomeController extends GetxController {
  final count = 0.obs;
  final selectedIndex = 0.obs;
  final formAction = true.obs;
  //firestore
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  List<Widget> pages = [
    const SplashView(),
    const RegisterView(),
    const LoginView(),
  ];
  List menu = [
    'GET STARTED',
    'REGISTER',
    'LOGIN',
  ];
  //text controller
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController telephoneController = TextEditingController();

  register() async {
    formAction(false);
    final cekData = await firestore
        .collection('user')
        .where('email', isEqualTo: nameController.text)
        .get();
    if (cekData.docs.isNotEmpty) {
      Get.snackbar('Error', 'Email already registered');
      formAction(true);
    } else {
      await firestore.collection('user').add({
        'name': nameController.text,
        'password': passwordEncypt(passwordController.text),
        'telephone': telephoneController.text,
      });
      Get.snackbar('Success', 'Register success');
      clear();
      formAction(true);
    }
  }

  passwordEncypt(String password) {
    final bytes = utf8.encode(password);
    final hash = sha256.convert(bytes);
    return hash.toString();
  }

  clear() {
    nameController.clear();
    passwordController.clear();
    telephoneController.clear();
  }

  login() async {
    formAction(false);

    final cekData = await firestore
        .collection('user')
        .where('telephone', isEqualTo: telephoneController.text)
        .get();
    if (cekData.docs.isNotEmpty) {
      final data = cekData.docs.first.data();
      if (data['password'] == passwordEncypt(passwordController.text)) {
        final box = await Hive.openBox('user');
        box.put('name', data['name']);
        box.put('telephone', data['telephone']);
        box.put('userId', cekData.docs.first.id);

        clear();
        formAction(true);
        Get.offAllNamed(Routes.DASHBOARD);
      } else {
        Get.snackbar('Error', 'Password wrong');
        formAction(true);
      }
    } else {
      Get.snackbar('Error', 'Email not registered');
      formAction(true);
    }
  }
}
