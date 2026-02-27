import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/controller/global_controller.dart';
import 'package:weather_app/widget/current_weather_widget.dart';
import 'package:weather_app/widget/daily_weather_widget.dart';
import 'package:weather_app/widget/header_widget.dart';
import 'package:weather_app/widget/hourly_weather_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Obx(() => globalController.checkLoading().isTrue
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : RefreshIndicator(
                  onRefresh: () async {
                    await globalController.refreshweather();
                  },
                child:ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    SizedBox(
                      height: 5.h,
                    ),
                    const HeaderWidget(),

                    CurrentWeatherWidget(
                    // Temperature: .round() se point khatam ho jayenge
                    temperature: globalController.getWeatherData()?.main?.temp?.round() ?? 0,
                    
                    // Description: maslan "clear sky" ya "mist"
                    weatherDescription: globalController.getWeatherData()?.weather?[0].description ?? "",
                    
                    // Icon Code: maslan "01d" ya "04n"
                    weatherIconCode: globalController.getWeatherData()?.weather?[0].icon ?? "01d",
                    
                    // Wind Speed: meter/sec ko 3.6 se multiply kar ke km/h banaya
                    windSpeed: (globalController.getWeatherData()?.wind?.speed ?? 0.0) * 3.6,
                    
                    // Clouds aur Humidity
                    clouds: globalController.getWeatherData()?.clouds?.all ?? 0,
                    humidity: globalController.getWeatherData()?.main?.humidity ?? 0,
                  ),
                  SizedBox(height: 4.h,),
                 const HourlyWeatherWidget(),

                 SizedBox(height: 4.h), 
                    
             
                    const DailyWeatherWidget(), 
                    
                    SizedBox(height: 4.h),
                  ],
              )
                ))),
    );
  }
}
