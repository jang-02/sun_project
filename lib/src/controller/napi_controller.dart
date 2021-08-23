import 'package:get/get.dart';
import 'package:sun_project/src/model/napi.dart';
import 'package:sun_project/src/repository/napi_repository.dart';

class NaverApiController extends GetxController {
  late NaverApiRepository _naverApiRepository;
  Rx<NaverApiModel> naverapiStatistic = NaverApiModel().obs;

  @override
  void onInit() {
    super.onInit();
    _naverApiRepository = NaverApiRepository();
    fetchLocationState();
  }

  void fetchLocationState() async {
    var result = await _naverApiRepository.fetchNaverApiStatistics();
    if (result != null) {
      naverapiStatistic(result);
    }
  }
}
