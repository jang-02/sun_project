import 'package:get/get.dart';
import 'package:sun_project/src/model/get_example_model.dart';
import 'package:sun_project/src/repository/get_example_repository.dart';

class LocationController extends GetxController {
  static LocationController get to => Get.find();
  late LocationRepository _locationRepository;
  Rx<LocationModel> locationData = LocationModel().obs;

  @override
  void onInit() {
    super.onInit();
    _locationRepository = LocationRepository();
    fetchLocationState();
  }

  void fetchLocationState() async {
    var result = await _locationRepository.fetchLocationData();
    if (result != null) {
      locationData(result);
    }
  }
}
