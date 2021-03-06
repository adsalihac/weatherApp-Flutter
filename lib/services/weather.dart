import 'dart:convert';
import 'package:flutter/foundation.dart';

import '../services/networking.dart';
import '../services/location.dart';
import '../utilities/constants.dart';

class WeatherModel {

  static const openWeatherApi = 'https://api.openweathermap.org/data/2.5/weather';

  Future<dynamic> getCityWeather(String cityName) async {
    if (kDebugMode) {
      print('getLocationWeather');
    }

    NetworkHelper networkHelper = NetworkHelper();
    String apiUrl = '$openWeatherApi?q=$cityName&units=metric&appid=$weatherApiKey';
    var weatherData = await networkHelper.getData(apiUrl);
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location loc = Location();
    await loc.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper();

    const openWeatherApi = 'https://api.openweathermap.org/data/2.5/weather';

    String apiUrl = '$openWeatherApi?lat=${loc.lattitude}&lon=${loc.longitude}&units=metric&appid=$weatherApiKey';

    var weatherData = await networkHelper.getData(apiUrl);

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
