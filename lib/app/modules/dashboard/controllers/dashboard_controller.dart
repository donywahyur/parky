import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:parky/app/routes/app_pages.dart';

class DashboardController extends GetxController {
  Map<String, dynamic> user = {};
  late final box = Hive.box('user');
  final formAction = true.obs;
  var listNoKendaraan = <Map<String, dynamic>>[].obs;
  final log = [].obs;
  final slot = 0.obs;
  final slotTerisi = 0.obs;
  late StreamSubscription<QuerySnapshot> stream;

  TextEditingController noKendaraan = TextEditingController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void onInit() async {
    await getNoKendaraan();
    getLog();
    super.onInit();
  }

  @override
  void onClose() {
    stream.cancel();
    super.onClose();
  }

  getSlot() async {
    final cekSlot = await firestore.collection('slot').get();
    final cekSlot2 = cekSlot.docs.first.data();
    slot.value = cekSlot2['jumlah'];

    DateTime now = DateTime.now();
    DateTime date = DateTime(now.year, now.month, now.day);
    DateTime date2 = DateTime(now.year, now.month, now.day, 23, 59, 59);

    final cekSlotTerisi = await firestore
        .collection('log')
        .where('masuk', isGreaterThanOrEqualTo: date)
        .where('masuk', isLessThanOrEqualTo: date2)
        .where('akses', isEqualTo: 1)
        .get();

    slotTerisi.value = cekSlotTerisi.docs.length;
  }

  getLog() async {
    DateTime now = DateTime.now();
    DateTime date = DateTime(now.year, now.month, now.day);
    DateTime date2 = DateTime(now.year, now.month, now.day, 23, 59, 59);

    stream = firestore
        .collection('log')
        .where('nama', isEqualTo: box.get('userId'))
        .where('masuk', isGreaterThanOrEqualTo: date)
        .where('masuk', isLessThanOrEqualTo: date2)
        .snapshots()
        .listen((event) {
      log.value = event.docs.map((e) {
        Map<String, dynamic> doc = e.data();
        doc['waktu_masuk'] = splitDate(doc['masuk']);
        doc['waktu_keluar'] = splitDate(doc['keluar']);
        return doc;
      }).toList();
    });
  }

  splitDate(tanggal) {
    //split space
    if (tanggal == null) {
      return null;
    }
    var tanggal2 = tanggal.toDate();
    final split = tanggal2.toString().split(' ');
    return split;
  }

  getNoKendaraan() async {
    final data = await firestore
        .collection('plat')
        .where('userId', isEqualTo: box.get('userId'))
        .get();
    listNoKendaraan.value = data.docs.map((e) {
      final String docId = e.id;
      final Map<String, dynamic> docData = e.data();
      docData['docId'] = docId;

      return docData;
    }).toList();
  }

  addNoKendaraan() async {
    //cek jumlah kendaraan
    formAction(false);
    final cekData = await firestore
        .collection('plat')
        .where('userId', isEqualTo: box.get('userId'))
        .get();
    if (cekData.docs.length == 3) {
      Get.snackbar('Gagal', 'Maksimal 3 kendaraan');
      formAction(true);
      return;
    }

    //cek plat sudah ada atau belum
    final cekPlat = await firestore
        .collection('plat')
        .where('plat', isEqualTo: noKendaraan.text)
        .get();
    if (cekPlat.docs.isNotEmpty) {
      Get.snackbar('Gagal', 'Plat sudah terdaftar');
      formAction(true);
      return;
    }

    //insert plat
    await firestore.collection('plat').add({
      'plat': noKendaraan.text,
      'userId': box.get('userId'),
      'createdAt': DateTime.now()
    });

    Get.snackbar('Berhasil', 'No Kendaraan berhasil ditambahkan');
    noKendaraan.clear();
    await getNoKendaraan();
    formAction(true);
  }

  deleteKendaraan(docId) async {
    formAction(false);
    await firestore.collection('plat').doc(docId).delete();
    Get.snackbar('Berhasil', 'No Kendaraan berhasil dihapus');
    await getNoKendaraan();
    formAction(true);
  }

  logout() async {
    await box.clear();
    Get.offAllNamed(Routes.HOME);
  }
}
