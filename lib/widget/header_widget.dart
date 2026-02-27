import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/controller/global_controller.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);
  String city = "";

  String date = DateFormat.yMMMMd().format(DateTime.now());

  @override
  void initState() {
    super.initState();
    getaddress(globalController.getLatitude().value,
        globalController.getLongitude().value);
  }

  getaddress(lat, lng) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);

    Placemark place = placemarks[0];
    setState(() {
      city = place.locality!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 5.w, right: 5.w),
          alignment: Alignment.topLeft,
          child: Text(
            city,
            style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(
          height: 1.h,
        ),
        Container(
          margin: EdgeInsets.only(left: 5.w, right: 5.w, bottom: 2.h),
          alignment: Alignment.topLeft,
          child: Text(
            date,
            style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: Colors.grey[700]),
          ),
        )
      ],
    );
  }
}
