import 'package:get/get.dart';
import 'package:opiny/models/api_model.dart';
import 'package:opiny/viewModel/fatch_data.dart';

class MatchController extends GetxController {
  var match = Rxn<Datum>();

  @override
  void onInit() {
    super.onInit();
    fetchMatchData();
  }

  Future<void> fetchMatchData() async {
    final response = await FatchData().fatchData();
    if (response != null && response.data.isNotEmpty) {
      match.value = response.data[0]; // the first match
    } else {
      Get.log("something went wrong while fetching match data");
    }
  }
}
