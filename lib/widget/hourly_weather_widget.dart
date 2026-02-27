import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:weather_app/controller/global_controller.dart';
import 'package:sizer/sizer.dart';


class HourlyWeatherWidget extends StatelessWidget {
  const HourlyWeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalController globalController = Get.find();
    return  Column(
        children: [
        Text("Today", style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),),

        SizedBox(
          height: 2.h,
        ),
        SizedBox(

          height: 16.h,
          child: Obx(() {

         if (globalController.hourlyWeatherList.isEmpty) {

            return const Center(child: CircularProgressIndicator());
         }
            return
           ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context , index ){
              bool isactive = index ==0;
              var hourlyData = globalController.hourlyWeatherList[index];
                
                // Time ko format kar rahe hain (e.g. 03:00 PM)
                DateTime time = DateTime.fromMillisecondsSinceEpoch(hourlyData['dt'] * 1000);
                String formattedTime = DateFormat('h:mm a').format(time);
                
                // Temp aur Icon nikal rahe hain
                int temp = (hourlyData['main']['temp'] as num).round();
                String iconCode = hourlyData['weather'][0]['icon'];
              return Container(
                width: 20.w,
                margin: EdgeInsets.only(
                  right: 3.w, 
                  left: index == 0 ? 5.w : 0, // Pehle item ke start mein thori space
                ),
                decoration: BoxDecoration(
                  color: isactive ? const Color(0xFF4A80F0) : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(formattedTime, style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: isactive ? Colors.white : Colors.black87,
                    ),),
                    SizedBox(height: 1.h,),
                    Image.asset("assets/weather/$iconCode.png", width: 10.w, height: 10.w, fit: BoxFit.contain,),
                    SizedBox(height: 1.h,),
                    Text("$temp°", style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: isactive ? Colors.white : Colors.black87,
                    ),),
                  ],
                ),
              );

            },
          );
 })
        )
        ],
      );
    
  }
}