import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'tambah_view.dart';

class HomeView extends StatelessWidget {
  final c = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Alumni'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => Get.offAllNamed('/'),
          )
        ],
      ),
      body: Obx(() => ListView.builder(
            itemCount: c.list.length,
            itemBuilder: (_, i) {
              final data = c.list[i];
              return Card(
                margin: EdgeInsets.all(10),
                child: ListTile(
                  title: Text(data.nama),
                  subtitle: Text(data.posisi),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit, color: Colors.blue),
                        onPressed: () {
                          Get.to(() => TambahView(
                                index: i,
                                data: data,
                              ));
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () => c.hapus(i),
                      ),
                    ],
                  ),
                ),
              );
            },
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => TambahView()),
        child: Icon(Icons.add),
      ),
    );
  }
}
