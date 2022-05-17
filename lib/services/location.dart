import 'package:geolocator/geolocator.dart';

class Location {
  var lattitude = 0.0;
  double longitude = 0.0;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

      lattitude = position.latitude;
      longitude = position.longitude;
      print('position $position');
    } catch (e) {
      print(e);
    }
  }

}