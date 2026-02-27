// import 'dart:convert';

// import 'package:geolocator/geolocator.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:weatherapp_starter_project/model/weather_model/weather.dart';

// class GlobalController extends GetxController {
//   // create various variable//

//   final RxBool _isloading = true.obs;
//   final RxDouble _latitude = 0.0.obs;
//   final RxDouble _longitude = 0.0.obs;

//   final Rxn<Weather> _weatherData = Rxn<Weather>();

//   // instance for them to be called//

//   RxBool checkLoading() => _isloading;
//   RxDouble getLatitude() => _latitude;
//   RxDouble getLongitude() => _longitude;

//   Weather? getWeatherData() => _weatherData.value;

//   @override
//   void onInit() {
//     if (_isloading.isTrue) {
//       getLocation();
//     }

//     super.onInit();
//   }

//   getLocation() async {
//     bool isserviceEnabled;

//     LocationPermission locationPermission;

//     isserviceEnabled = await Geolocator.isLocationServiceEnabled();
// // return if service is not enabled//
//     if (!isserviceEnabled) {
//       return Future.error("Location not enabled");
//     }

//     // status of permission//

//     locationPermission = await Geolocator.checkPermission();

//     if (locationPermission == LocationPermission.deniedForever) {
//       return Future.error("Location permission are denied forever");
//     } else if (locationPermission == LocationPermission.denied) {
//       locationPermission = await Geolocator.requestPermission();

//       if (locationPermission == LocationPermission.denied) {
//         return Future.error("Location permission are denied");
//       }
//     }

//     ///getting the current location//

//     return await Geolocator.getCurrentPosition(
//             desiredAccuracy: LocationAccuracy.high)
//         .then((value) {
//       _latitude.value = value.latitude;
//       _longitude.value = value.longitude;
//       _isloading.value = false;
//     });
//   }

//   Future<void> fetchWeather(double lat, double lon) async {

//     const apiKey = "bff0781c8cd232b505aaf2aa94910b72"; 
    
//     final url = "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey&units=metric";

//     try {
//       final response = await http.get(Uri.parse(url));
      
//       if (response.statusCode == 200) {
//         var jsonString = jsonDecode(response.body);
//         // Data aagaya, ab isko apne Weather Model mein daal diya
//         _weatherData.value = Weather.fromJson(jsonString);
//       } else {
//         print("API Error: ${response.statusCode}");
//       }
//     } catch (e) {
//       print("Error fetching data: $e");
//     }
//   }
// }



import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather_model/weather.dart';

class GlobalController extends GetxController {
  final RxBool _isloading = true.obs;
  final RxDouble _latitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;
  final Rxn<Weather> _weatherData = Rxn<Weather>();
  final RxList<dynamic> hourlyWeatherList = <dynamic>[].obs;

  RxBool checkLoading() => _isloading;
  RxDouble getLatitude() => _latitude;
  RxDouble getLongitude() => _longitude;
  Weather? getWeatherData() => _weatherData.value;

  @override
  void onInit() {
    if (_isloading.isTrue) {
      getLocation();
    }
    super.onInit();
  }

  getLocation() async {
    bool isserviceEnabled;
    LocationPermission locationPermission;

    isserviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isserviceEnabled) return Future.error("Location not enabled");

    locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error("Location permission are denied forever");
    } else if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        return Future.error("Location permission are denied");
      }
    }

    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((value) async {
      _latitude.value = value.latitude;
      _longitude.value = value.longitude;

      // ZAROORI: Ab yahan API call hogi loading false karne se pehle
      await fetchWeather(value.latitude, value.longitude);
      await fetchHourlyWeather(value.latitude, value.longitude);
      _isloading.value = false;
    });
  }

  Future<void> fetchWeather(double lat, double lon) async {
    const apiKey = "bff0781c8cd232b505aaf2aa94910b72"; 
    final url = "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey&units=metric";

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var jsonString = jsonDecode(response.body);
        _weatherData.value = Weather.fromJson(jsonString);
      } else {
        print("API Error: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching data: $e");
    }
  }

  Future<void> refreshweather() async{
    _isloading.value = true;

    await getLocation();
  }

  Future<void> fetchHourlyWeather(double lat , double lon) async {
    const apikey = "bff0781c8cd232b505aaf2aa94910b72";
    final url = "https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$lon&appid=$apikey&units=metric";

    try{
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200){
        var jsonData = jsonDecode(response.body);
        hourlyWeatherList.value = jsonData['list'];
      } else {
        print("API Error: ${response.statusCode}");

      }
    } catch (e){
      print("Error fetching hourly data: $e");
    }
  }


}