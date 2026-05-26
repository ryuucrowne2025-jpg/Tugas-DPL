import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:alumni_tracker/controllers/home_controller.dart';
import 'package:alumni_tracker/models/alumni_model.dart';

class StubAlumniRepository implements AlumniRepository {
  List<Alumni> _dataAlumni = [];

  StubAlumniRepository() {
    _dataAlumni = [
      Alumni(
        nama: "Catur Rahmani Oktavia",
        email: "catur@gmail.com",
        noHp: "081234567890",
        linkedin: "linkedin.com/catur",
        instagram: "@catur",
        facebook: "catur.fb",
        tiktok: "@caturtok",
        tempatKerja: "PT Contoh",
        alamatKerja: "Jakarta",
        posisi: "Developer",
        jenis: "Alumni",
        sosmedPerusahaan: "@contoh",
      ),
    ];
  }

  @override
  Future<List<Alumni>> fetchAllAlumni() async {
    return _dataAlumni;
  }

  @override
  Future<void> addAlumni(Alumni alumni) async {
    _dataAlumni.add(alumni);
  }

  @override
  Future<void> deleteAlumni(String noHp) async {
    _dataAlumni.removeWhere((a) => a.noHp == noHp);
  }
}

void main() {
  setUp(() {
    Get.reset();
  });

  test('Test 1: Load alumni berhasil mengambil data', () async {
    StubAlumniRepository stubRepo = StubAlumniRepository();
    HomeController controller = HomeController(repository: stubRepo);

    await controller.loadAlumni();

    expect(controller.alumniList.length, 1);
    expect(controller.alumniList[0].nama, "Catur Rahmani Oktavia");
  });

  test('Test 2: Tambah alumni baru berhasil', () async {
    StubAlumniRepository stubRepo = StubAlumniRepository();
    HomeController controller = HomeController(repository: stubRepo);

    await controller.loadAlumni();
    expect(controller.alumniList.length, 1);

    Alumni newAlumni = Alumni(
      nama: "Budi Santoso",
      email: "budi@gmail.com",
      noHp: "089876543210",
      linkedin: "linkedin.com/budi",
      instagram: "@budi",
      facebook: "budi.fb",
      tiktok: "@buditok",
      tempatKerja: "PT Budi",
      alamatKerja: "Bandung",
      posisi: "Manager",
      jenis: "Alumni",
      sosmedPerusahaan: "@budi",
    );

    await controller.addAlumni(newAlumni);
    await controller.loadAlumni();

    expect(controller.alumniList.length, 2);
  });

  test('Test 3: Hapus alumni berhasil berdasarkan noHp', () async {
    StubAlumniRepository stubRepo = StubAlumniRepository();
    HomeController controller = HomeController(repository: stubRepo);

    await controller.loadAlumni();
    expect(controller.alumniList.length, 1);

    await controller.deleteAlumni("081234567890");
    await controller.loadAlumni();

    expect(controller.alumniList.length, 0);
  });
}
