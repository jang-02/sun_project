import 'package:geolocator/geolocator.dart';
import 'package:sun_project/src/model/get_example_model.dart';

class LocationRepository {
  Future<LocationModel> fetchLocationData() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return LocationModel.fromLoc(position);
  }
}
