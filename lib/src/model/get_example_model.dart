import 'package:geolocator/geolocator.dart';

class LocationModel {
  double? long;
  double? lati;

  LocationModel({this.long, this.lati});

  factory LocationModel.fromLoc(Position location) {
    return LocationModel(long: location.longitude, lati: location.latitude);
  }
}
