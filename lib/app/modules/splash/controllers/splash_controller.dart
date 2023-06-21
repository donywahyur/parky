import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:parky/app/routes/app_pages.dart';

class SplashController extends GetxController {
  checkLogin() async {
    await Future.delayed(const Duration(seconds: 3));
    final box = await Hive.openBox('user');
    final userId = box.get('userId');
    if (userId != null) {
      Get.offNamed(Routes.DASHBOARD);
    } else {
      Get.offNamed(Routes.HOME);
    }
  }
}
