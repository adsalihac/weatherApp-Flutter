

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:weather/screens/location_screen.dart';
import '../services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../utilities/constants.dart';
import '../services/weather.dart';
import 'location_screen.dart';
import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


  // late final Permission _permission;
  // PermissionStatus _permissionStatus = PermissionStatus.denied;
  late double lattitude;
  late double longitude;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

   void getLocation() async {

    var weatherData = await WeatherModel().getLocationWeather();

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
       LocationScreen(
        locationWeather: weatherData,
      )),
    );
    //
    // if (kDebugMode) {
    //   print(tenp);
    //   print(condition);
    //   print(city);
    // }
  }

  // Future<void> getLocation() async {
  //   bool serviceEnabled;
  //   LocationPermission permission;
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //
  //   if (!serviceEnabled) {
  //     // Location services are not enabled don't continue
  //     // accessing the position and request users of the
  //     // App to enable the location services.
  //     return Future.error('Location services are disabled.');
  //   }
  //
  //   permission = await Geolocator.checkPermission();
  //
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       getLocation();
  //       // Permissions are denied, next time you could try
  //       // requesting permissions again (this is also where
  //       // Android's shouldShowRequestPermissionRationale
  //       // returned true. According to Android guidelines
  //       // your App should show an explanatory UI now.
  //       return Future.error('Location permissions are denied');
  //     }
  //   }
  //
  //   if (permission == LocationPermission.deniedForever) {
  //     // Permissions are denied forever, handle appropriately.+
  //     await Geolocator.openLocationSettings();
  //
  //     return Future.error(
  //         'Location permissions are permanently denied, we cannot request permissions.');
  //   }
  //
  //   Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  //   if (kDebugMode) {
  //     print('position $position');
  //   }
  // }
  //
  // void getData(double lattitude, double longitude) async {
  //   http.Response response = await http.get(Uri.parse(''));
  //
  //   if(response.statusCode == 200) {
  //     String data = response.body;
  //
  //     var decodedData = jsonDecode(data);
  //
  //     double tenp = decodedData['main']['temp'];
  //     int condition = decodedData['weather'][0]['id'];
  //     String city = decodedData['name'];
  //
  //     if (kDebugMode) {
  //       print(tenp);
  //       print(condition);
  //       print(city);
  //     }
  //   } else {
  //     if (kDebugMode) {
  //       print('Response status: ${response.statusCode}');
  //       print('Response reasonPhrase: ${response.reasonPhrase}');
  //       print('Response body: ${response.body}');
  //     }
  //   }
  //
  // }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
