import 'package:get/get.dart';
import '../models/alumni_model.dart';

class HomeController extends GetxController {
  var alumniList = <Alumni>[
    Alumni(nama: "Muhammad Rizky", prodi: "Informatika", tahun: 2022),
    Alumni(nama: "Siti Aisyah", prodi: "Sistem Informasi", tahun: 2021),
  ].obs;
}
