import 'package:get/get.dart';
import '../models/alumni_model.dart';

class HomeController extends GetxController {
  var list = <Alumni>[].obs;

  @override
  void onInit() {
    super.onInit();

    list.addAll([
      Alumni(
        nama: "Catur Rahmani Oktavia",
        email: "catur@gmail.com",
        noHp: "081234567890",
        linkedin: "linkedin.com/catur",
        instagram: "@catur",
        facebook: "catur.fb",
        tiktok: "@caturtok",
        tempatKerja: "PT Maju Jaya",
        alamatKerja: "Jakarta",
        posisi: "Staff Akuntansi",
        jenis: "Swasta",
        sosmedPerusahaan: "@ptmajujaya",
      ),
      Alumni(
        nama: "Indayati",
        email: "indayati@gmail.com",
        noHp: "081234567891",
        linkedin: "linkedin.com/indayati",
        instagram: "@inda",
        facebook: "inda.fb",
        tiktok: "@indatok",
        tempatKerja: "Instansi Pemerintah",
        alamatKerja: "Bandung",
        posisi: "Admin",
        jenis: "PNS",
        sosmedPerusahaan: "@pemda",
      ),
      Alumni(
        nama: "Assa Idhika",
        email: "assa@gmail.com",
        noHp: "081234567892",
        linkedin: "linkedin.com/assa",
        instagram: "@assa",
        facebook: "assa.fb",
        tiktok: "@assatok",
        tempatKerja: "Usaha Sendiri",
        alamatKerja: "Bekasi",
        posisi: "Owner",
        jenis: "Wirausaha",
        sosmedPerusahaan: "@usahaku",
      ),
      Alumni(
        nama: "Yuli ka Yanti",
        email: "yuli@gmail.com",
        noHp: "081234567893",
        linkedin: "linkedin.com/yuli",
        instagram: "@yuli",
        facebook: "yuli.fb",
        tiktok: "@yulitok",
        tempatKerja: "PT Sejahtera",
        alamatKerja: "Surabaya",
        posisi: "Staff Keuangan",
        jenis: "Swasta",
        sosmedPerusahaan: "@sejahtera",
      ),
      Alumni(
        nama: "Gunawan",
        email: "gunawan@gmail.com",
        noHp: "081234567894",
        linkedin: "linkedin.com/gunawan",
        instagram: "@gunawan",
        facebook: "gunawan.fb",
        tiktok: "@gunawantok",
        tempatKerja: "PT Nusantara",
        alamatKerja: "Jakarta",
        posisi: "Supervisor",
        jenis: "Swasta",
        sosmedPerusahaan: "@nusantara",
      ),
    ]);
  }

  void tambah(Alumni data) => list.add(data);

  void hapus(int index) => list.removeAt(index);

  void edit(int index, Alumni dataBaru) {
    list[index] = dataBaru;
    list.refresh();
  }
}
