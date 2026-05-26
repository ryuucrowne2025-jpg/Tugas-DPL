import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../models/alumni_model.dart';

class TambahView extends StatelessWidget {
  final HomeController c = Get.find<HomeController>();

  final int? index;
  final Alumni? data;

  TambahView({this.index, this.data});

  final nama = TextEditingController();
  final email = TextEditingController();
  final noHp = TextEditingController();
  final linkedin = TextEditingController();
  final instagram = TextEditingController();
  final facebook = TextEditingController();
  final tiktok = TextEditingController();
  final tempatKerja = TextEditingController();
  final alamatKerja = TextEditingController();
  final posisi = TextEditingController();
  final jenis = TextEditingController();
  final sosmedPerusahaan = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (data != null) {
      nama.text = data!.nama;
      email.text = data!.email;
      noHp.text = data!.noHp;
      linkedin.text = data!.linkedin;
      instagram.text = data!.instagram;
      facebook.text = data!.facebook;
      tiktok.text = data!.tiktok;
      tempatKerja.text = data!.tempatKerja;
      alamatKerja.text = data!.alamatKerja;
      posisi.text = data!.posisi;
      jenis.text = data!.jenis;
      sosmedPerusahaan.text = data!.sosmedPerusahaan;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(data == null ? 'Tambah Data' : 'Edit Data'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
                controller: nama,
                decoration: InputDecoration(labelText: 'Nama')),
            TextField(
                controller: email,
                decoration: InputDecoration(labelText: 'Email')),
            TextField(
                controller: noHp,
                decoration: InputDecoration(labelText: 'No HP')),
            TextField(
                controller: linkedin,
                decoration: InputDecoration(labelText: 'LinkedIn')),
            TextField(
                controller: instagram,
                decoration: InputDecoration(labelText: 'Instagram')),
            TextField(
                controller: facebook,
                decoration: InputDecoration(labelText: 'Facebook')),
            TextField(
                controller: tiktok,
                decoration: InputDecoration(labelText: 'TikTok')),
            TextField(
                controller: tempatKerja,
                decoration: InputDecoration(labelText: 'Tempat Kerja')),
            TextField(
                controller: alamatKerja,
                decoration: InputDecoration(labelText: 'Alamat Kerja')),
            TextField(
                controller: posisi,
                decoration: InputDecoration(labelText: 'Posisi')),
            TextField(
                controller: jenis,
                decoration: InputDecoration(labelText: 'Jenis')),
            TextField(
                controller: sosmedPerusahaan,
                decoration: InputDecoration(labelText: 'Sosmed Perusahaan')),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final dataBaru = Alumni(
                  nama: nama.text,
                  email: email.text,
                  noHp: noHp.text,
                  linkedin: linkedin.text,
                  instagram: instagram.text,
                  facebook: facebook.text,
                  tiktok: tiktok.text,
                  tempatKerja: tempatKerja.text,
                  alamatKerja: alamatKerja.text,
                  posisi: posisi.text,
                  jenis: jenis.text,
                  sosmedPerusahaan: sosmedPerusahaan.text,
                );

                if (index == null) {
                  c.tambah(dataBaru);
                } else {
                  c.edit(index!, dataBaru);
                }

                Get.back();
              },
              child: Text(data == null ? 'Simpan' : 'Update'),
            )
          ],
        ),
      ),
    );
  }
}
