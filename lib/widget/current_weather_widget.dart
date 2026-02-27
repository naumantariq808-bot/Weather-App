import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final int temperature;
  final String weatherDescription;
  final String weatherIconCode;
  final double windSpeed;
  final int clouds;
  final int humidity;

  const CurrentWeatherWidget({
    super.key,
    required this.temperature,
    required this.weatherDescription,
    required this.weatherIconCode,
    required this.windSpeed,
    required this.clouds,
    required this.humidity,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // --- Upper Section: Icon & Temperature ---
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Dynamic Icon: API code ke mutabiq image change hogi
              Image.asset(
                "assets/weather/$weatherIconCode.png",
                width: 25.w,
                height: 25.w,
                fit: BoxFit.contain,
              ),
              
              // Darmyan wali line (Divider)
              Container(
                height: 8.h,
                width: 1.5,
                color: Colors.grey[300],
              ),
              
              // Temperature details
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "$temperature",
                        style: TextStyle(
                          fontSize: 55.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        "°",
                        style: TextStyle(
                          fontSize: 35.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    weatherDescription,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.grey[500],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),

        SizedBox(height: 5.h),

        // --- Lower Section: 3 Chotay Cards (Wind, Clouds, Humidity) ---
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _weatherDetailItem("assets/icons/windspeed.png", "${windSpeed.toStringAsFixed(1)}km/h"),
            _weatherDetailItem("assets/icons/clouds.png", "$clouds%"),
            _weatherDetailItem("assets/icons/humidity.png", "$humidity%"),
          ],
        ),
      ],
    );
  }

  // Chotay cards banane ka helper function
  Widget _weatherDetailItem(String iconPath, String value) {
    return Column(
      children: [
        Container(
          height: 18.w,
          width: 18.w,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFFF0F2F5),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Image.asset(iconPath),
        ),
        SizedBox(height: 1.h),
        Text(
          value,
          style: TextStyle(
            fontSize: 11.sp,
            fontWeight: FontWeight.w500,
            color: Colors.black54,
          ),
        )
      ],
    );
  }
}