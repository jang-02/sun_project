import 'package:get/get.dart';
import 'package:sun_project/src/repository/loc_repository.dart';

class LocationController extends GetxController {
  late LocationRepository _locationRepository;

  @override
  void onInit() {
    super.onInit();
    _locationRepository = LocationRepository();
    fetchLocationState();
  }

  void fetchLocationState() {
    _locationRepository.fetchLocaitonStatistics();
  }
}
