import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/alumni_model.dart';

class DetailView extends StatelessWidget {
  final Alumni alumni;

  const DetailView({super.key, required this.alumni});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Alumni'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailItem('Nama', alumni.nama),
            _buildDetailItem('Email', alumni.email),
            _buildDetailItem('No HP', alumni.noHp),
            _buildDetailItem('LinkedIn', alumni.linkedin),
            _buildDetailItem('Instagram', alumni.instagram),
            _buildDetailItem('Facebook', alumni.facebook),
            _buildDetailItem('TikTok', alumni.tiktok),
            _buildDetailItem('Tempat Kerja', alumni.tempatKerja),
            _buildDetailItem('Alamat Kerja', alumni.alamatKerja),
            _buildDetailItem('Posisi', alumni.posisi),
            _buildDetailItem('Jenis', alumni.jenis),
            _buildDetailItem('Sosmed Perusahaan', alumni.sosmedPerusahaan),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(fontSize: 16),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
