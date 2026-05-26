import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../models/alumni_model.dart';

class TambahView extends StatelessWidget {
  TambahView({super.key});

  final HomeController controller = Get.find<HomeController>();

  final TextEditingController namaController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController noHpController = TextEditingController();
  final TextEditingController linkedinController = TextEditingController();
  final TextEditingController instagramController = TextEditingController();
  final TextEditingController facebookController = TextEditingController();
  final TextEditingController tiktokController = TextEditingController();
  final TextEditingController tempatKerjaController = TextEditingController();
  final TextEditingController alamatKerjaController = TextEditingController();
  final TextEditingController posisiController = TextEditingController();
  final TextEditingController jenisController = TextEditingController();
  final TextEditingController sosmedPerusahaanController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Data Alumni'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildTextField(namaController, 'Nama Lengkap', Icons.person),
              const SizedBox(height: 12),
              _buildTextField(emailController, 'Email', Icons.email,
                  keyboardType: TextInputType.emailAddress),
              const SizedBox(height: 12),
              _buildTextField(noHpController, 'No HP', Icons.phone,
                  keyboardType: TextInputType.phone),
              const SizedBox(height: 12),
              _buildTextField(linkedinController, 'LinkedIn', Icons.work),
              const SizedBox(height: 12),
              _buildTextField(
                  instagramController, 'Instagram', Icons.camera_alt),
              const SizedBox(height: 12),
              _buildTextField(facebookController, 'Facebook', Icons.facebook),
              const SizedBox(height: 12),
              _buildTextField(tiktokController, 'TikTok', Icons.music_note),
              const SizedBox(height: 12),
              _buildTextField(
                  tempatKerjaController, 'Tempat Kerja', Icons.business),
              const SizedBox(height: 12),
              _buildTextField(
                  alamatKerjaController, 'Alamat Kerja', Icons.location_on),
              const SizedBox(height: 12),
              _buildTextField(posisiController, 'Posisi', Icons.work_history),
              const SizedBox(height: 12),
              _buildTextField(jenisController, 'Jenis', Icons.category),
              const SizedBox(height: 12),
              _buildTextField(
                  sosmedPerusahaanController, 'Sosmed Perusahaan', Icons.share),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _saveAlumni,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Simpan Data'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String label,
    IconData icon, {
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      keyboardType: keyboardType,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '$label tidak boleh kosong';
        }
        return null;
      },
    );
  }

  void _saveAlumni() {
    if (_formKey.currentState!.validate()) {
      final newAlumni = Alumni(
        nama: namaController.text,
        email: emailController.text,
        noHp: noHpController.text,
        linkedin: linkedinController.text,
        instagram: instagramController.text,
        facebook: facebookController.text,
        tiktok: tiktokController.text,
        tempatKerja: tempatKerjaController.text,
        alamatKerja: alamatKerjaController.text,
        posisi: posisiController.text,
        jenis: jenisController.text,
        sosmedPerusahaan: sosmedPerusahaanController.text,
      );

      controller.addAlumni(newAlumni);
      Get.back();
      Get.snackbar('Sukses', 'Data alumni berhasil ditambahkan');
    }
  }
}
