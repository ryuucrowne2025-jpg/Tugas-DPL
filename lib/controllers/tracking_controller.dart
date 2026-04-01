import 'package:get/get.dart';
import '../models/tracking_result_model.dart';

class TrackingController extends GetxController {
  var result = Rxn<TrackingResult>();
  var isLoading = false.obs;

  void trackAlumni(String nama) async {
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 2));

    result.value = TrackingResult(
      jabatan: "Software Engineer",
      instansi: "Tokopedia",
      lokasi: "Jakarta",
      score: 85,
    );

    isLoading.value = false;
  }
}
