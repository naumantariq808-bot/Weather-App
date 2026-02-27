import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import '../controller/global_controller.dart'; // Apna path check kar lijiye ga

class DailyWeatherWidget extends StatelessWidget {
  const DailyWeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalController globalController = Get.find();

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F9), // Light greyish-blue background
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Heading
          Text(
            "Next Days",
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 2.h),

          // Daily List
          Obx(() {
            if (globalController.hourlyWeatherList.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }

            return ListView.builder(
              shrinkWrap: true, // Zaroori hai taake Column ke andar theek se fit ho
              physics: const NeverScrollableScrollPhysics(), // Is list ko khud scroll nahi hone dena
              itemCount: 5, // 5 din ka data
              itemBuilder: (context, index) {
                // Har din mein 8 pehar (3 hours each) hotay hain. 
                // Hum har din ka data uthane ke liye index ko 8 se multiply kar rahe hain.
                int dataIndex = index * 8; 
                
                // Safety check taake app crash na ho agar data kam aaye
                if (dataIndex >= globalController.hourlyWeatherList.length) {
                  dataIndex = globalController.hourlyWeatherList.length - 1;
                }

                var dailyData = globalController.hourlyWeatherList[dataIndex];
                
                // Date ko format kar ke din ka naam (Mon, Tue) nikalna
                DateTime time = DateTime.fromMillisecondsSinceEpoch(dailyData['dt'] * 1000);
                String dayName = DateFormat('EEE').format(time); // 'EEE' gives Mon, Tue, Wed
                
                // Icons aur Temps
                String iconCode = dailyData['weather'][0]['icon'];
                int tempMax = (dailyData['main']['temp_max'] as num).round();
                int tempMin = (dailyData['main']['temp_min'] as num).round();

                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.5.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // 1. Day Name (Sat, Sun, Mon)
                      SizedBox(
                        width: 15.w,
                        child: Text(
                          dayName,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      
                      // 2. Weather Icon
                      Image.asset(
                        "assets/weather/$iconCode.png",
                        width: 8.w,
                        height: 8.w,
                      ),
                      
                      // 3. Min/Max Temp (e.g. 35°/28°)
                      Text(
                        "$tempMax°/$tempMin°",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black54,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }),
        ],
      ),
    );
  }
}