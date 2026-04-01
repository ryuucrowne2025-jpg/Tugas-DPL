import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/alumni_model.dart';
import 'tracking_view.dart';

class DetailView extends StatelessWidget {
  final Alumni alumni;

  DetailView({required this.alumni});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail Alumni")),
      body: Column(
        children: [
          Text(alumni.nama, style: TextStyle(fontSize: 20)),
          Text(alumni.prodi),
          Text("Tahun: ${alumni.tahun}"),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Get.to(() => TrackingView(nama: alumni.nama));
            },
            child: Text("Lacak Alumni"),
          )
        ],
      ),
    );
  }
}
