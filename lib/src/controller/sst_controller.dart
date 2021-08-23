import 'package:get/get.dart';
import 'package:sun_project/src/model/sst.dart';
import 'package:sun_project/src/repository/sst_repository.dart';

class SunsetTimeController extends GetxController {
  late SunsetTimeRepository _sunsetTimeRepository;
  Rx<SunsetTimeModel> sunsetTimeStatistic = SunsetTimeModel().obs;

  @override
  void onInit() {
    super.onInit();
    _sunsetTimeRepository = SunsetTimeRepository();
    fetchSunsetTimeState();
  }

  void fetchSunsetTimeState() async {
    var result = await _sunsetTimeRepository.fetchSunSetTimeStatistics();
    if (result != null) {
      sunsetTimeStatistic(result);
    }
  }
}
