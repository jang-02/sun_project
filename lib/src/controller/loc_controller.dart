import 'package:get/get.dart';
import 'package:sun_project/src/repository/loc_repository.dart';

class NaverApiController extends GetxController {
  late NaverApiRepository _naverApiRepository;

  @override
  void onInit() {
    super.onInit();
    _naverApiRepository = NaverApiRepository();
    fetchLocationState();
  }

  void fetchLocationState() {
    _naverApiRepository.fetchNaverApiStatistics();
  }
}
