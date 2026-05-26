import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../models/alumni_model.dart';
import 'tambah_view.dart';
import 'detail_view.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Alumni'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Get.offAllNamed('/');
            },
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.alumniList.isEmpty) {
          return const Center(child: Text('Belum ada data alumni'));
        }

        return ListView.builder(
          itemCount: controller.alumniList.length,
          itemBuilder: (context, index) {
            final alumni = controller.alumniList[index];
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ListTile(
                leading: CircleAvatar(
                  child: Text(alumni.nama[0].toUpperCase()),
                ),
                title: Text(
                  alumni.nama,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(alumni.email),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.visibility, color: Colors.blue),
                      onPressed: () {
                        Get.to(() => DetailView(alumni: alumni));
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        _showDeleteDialog(context, alumni.noHp);
                      },
                    ),
                  ],
                ),
                onTap: () {
                  Get.to(() => DetailView(alumni: alumni));
                },
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => TambahView());
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showDeleteDialog(BuildContext context, String noHp) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Hapus Data'),
        content: const Text('Apakah Anda yakin ingin menghapus data ini?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              controller.deleteAlumni(noHp);
              Navigator.pop(context);
              Get.snackbar('Sukses', 'Data berhasil dihapus');
            },
            child: const Text('Hapus', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
