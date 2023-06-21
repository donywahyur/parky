import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:parky/app/data/constant.dart';
import 'package:parky/app/modules/dashboard/views/slot_parkir.dart';
import 'package:parky/app/modules/dashboard/views/text_gradient.dart';

import '../controllers/dashboard_controller.dart';
import 'add_kendaraan.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200.h,
                decoration: const BoxDecoration(
                  gradient: gradientPrimary,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                ),
                child: SafeArea(
                    child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            //avatar
                            Container(
                                width: 60.w,
                                height: 60.h,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle),
                                child: const Icon(Icons.person,
                                    color: kBlue, size: 40)),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              controller.box.get('name'),
                              style: kHeading6.copyWith(color: Colors.white),
                            )
                          ],
                        ))),
              ),
              Positioned(
                top: 50.h,
                right: 5.w,
                child: IconButton(
                  onPressed: () {
                    controller.logout();
                  },
                  icon: const Icon(
                    Icons.logout,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
              Positioned(
                top: 160.h,
                child: Center(
                    child: Container(
                  width: MediaQuery.of(context).size.width * 0.70,
                  height: 100.h,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 4),
                          blurRadius: 4,
                          spreadRadius: 1),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              Container(
                                width: 40.w,
                                height: 40.h,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Image.asset('assets/wall-clock.png'),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Obx(() => controller.log.isNotEmpty &&
                                          controller.log[0]['waktu_masuk'] !=
                                              null
                                      ? Text(
                                          controller.log[0]['waktu_masuk'][1]
                                              .substring(0, 5),
                                          style: kHeading6.copyWith(
                                              fontSize: 20.sp),
                                        )
                                      : Text(
                                          '--.--',
                                          style: kHeading6.copyWith(
                                              fontSize: 20.sp),
                                        )),
                                  Text(
                                    'Masuk',
                                    style: kHeading6.copyWith(fontSize: 20.sp),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 3,
                        height: 50.h,
                        color: kBlue,
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              Container(
                                width: 40.w,
                                height: 40.h,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Image.asset('assets/wall-clock.png'),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Obx(() => controller.log.isNotEmpty &&
                                          controller.log[controller.log.length -
                                                  1]['waktu_keluar'] !=
                                              null
                                      ? Text(
                                          controller
                                              .log[controller.log.length - 1]
                                                  ['waktu_keluar'][1]
                                              .substring(0, 5),
                                          style: kHeading6.copyWith(
                                              fontSize: 20.sp),
                                        )
                                      : Text(
                                          '--.--',
                                          style: kHeading6.copyWith(
                                              fontSize: 20.sp),
                                        )),
                                  Text(
                                    'Keluar',
                                    style: kHeading6.copyWith(fontSize: 20.sp),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
              ),
            ],
          ),
          SizedBox(
            height: 90.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const AddKendaraan();
                      }));
                    },
                    child: Container(
                      width: 74.w,
                      height: 74.h,
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, gradient: gradientPrimary),
                      child: Image.asset('assets/motorcycle.png',
                          fit: BoxFit.fitHeight),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text('Kendaraan', style: kHeading6.copyWith(color: kMidGreen))
                ],
              ),
              SizedBox(
                width: 40.w,
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const SlotParkir();
                      }));
                    },
                    child: Container(
                      width: 74.w,
                      height: 74.h,
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, gradient: gradientPrimary),
                      child: Image.asset('assets/parking-area.png',
                          fit: BoxFit.fitHeight),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text('Slot', style: kHeading6.copyWith(color: kMidGreen))
                ],
              )
            ],
          ),
          SizedBox(
            height: 40.h,
          ),
          Container(
            height: 14.h,
            width: 72.w,
            decoration: BoxDecoration(
                color: kMidGreen, borderRadius: BorderRadius.circular(10)),
          ),
          SizedBox(
            height: 30.h,
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: TextGradient(teks: 'LIST KENDARAAN')),
                  Image.asset('assets/undraw_task_list.png', width: 130.w)
                ],
              )),
          Container(
            height: 280.h,
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 4),
                      blurRadius: 4,
                      spreadRadius: 1),
                ]),
            child: Table(
              columnWidths: {
                0: FixedColumnWidth(60.w),
                1: FixedColumnWidth(240.w),
              },
              border: TableBorder.symmetric(
                  inside: const BorderSide(color: kMidGreen, width: 1)),
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                TableRow(children: [
                  TextGradient(
                    teks: 'NO',
                  ),
                  TextGradient(
                    teks: 'PLAT KENDARAAN',
                  ),
                ]),
                for (int i = 0; i < 3; i++)
                  TableRow(children: [
                    TableCell(
                      child: TextGradient(
                        teks: (i + 1).toString(),
                      ),
                    ),
                    TableCell(
                      child: Obx(() {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 190.w,
                                child: TextGradient(
                                  align: Alignment.centerLeft,
                                  teks: controller.listNoKendaraan.length > i
                                      ? controller.listNoKendaraan[i]['plat']
                                      : '-',
                                ),
                              ),
                              controller.listNoKendaraan.length > i
                                  ? GestureDetector(
                                      onTap: () {
                                        if (controller.formAction.value) {
                                          controller.deleteKendaraan(controller
                                              .listNoKendaraan[i]['docId']);
                                        }
                                      },
                                      child: const Icon(
                                        Icons.delete,
                                        color: kMidGreen,
                                      ),
                                    )
                                  : Container()
                            ],
                          ),
                        );
                      }),
                    ),
                  ]),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
