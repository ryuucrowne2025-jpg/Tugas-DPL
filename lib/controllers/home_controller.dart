import 'package:get/get.dart';
import '../models/alumni_model.dart';

abstract class AlumniRepository {
  Future<List<Alumni>> fetchAllAlumni();
  Future<void> addAlumni(Alumni alumni);
  Future<void> deleteAlumni(String noHp);
}

class HomeController extends GetxController {
  final AlumniRepository repository;
  var alumniList = <Alumni>[].obs;

  HomeController({required this.repository});

  Future<void> loadAlumni() async {
    alumniList.value = await repository.fetchAllAlumni();
  }

  Future<void> addAlumni(Alumni alumni) async {
    await repository.addAlumni(alumni);
    await loadAlumni();
  }

  Future<void> deleteAlumni(String noHp) async {
    await repository.deleteAlumni(noHp);
    await loadAlumni();
  }
}
