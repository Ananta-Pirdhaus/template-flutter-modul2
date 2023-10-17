import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/app/modules/home/controllers/edit_profile_controller.dart';

class EditProfileView extends StatelessWidget {
  final EditProfileController controller = Get.put(EditProfileController());
  final String initialNama;
  final String initialPosisi;

  EditProfileView({required this.initialNama, required this.initialPosisi});

  @override
  Widget build(BuildContext context) {
    controller.namaController.text = initialNama;
    controller.posisiController.text = initialPosisi;

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profil'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back(); // Kembali ke halaman sebelumnya
          },
        ),
        backgroundColor: Colors.grey[700], // Ganti warna app bar
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: controller.namaController,
              decoration: InputDecoration(
                labelText: 'Masukkan Nama Anda',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: controller.posisiController,
              decoration: InputDecoration(
                labelText: 'Posisi / Jabatan',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => controller.getImage(ImageSource.gallery),
                  child: Text('Pilih dari Galeri'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey[700], // Warna latar belakang tombol
                    onPrimary: Colors.white, // Warna teks tombol
                  ),
                ),
                ElevatedButton(
                  onPressed: () => controller.getImage(ImageSource.camera),
                  child: Text('Ambil dari Kamera'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey[700], // Warna latar belakang tombol
                    onPrimary: Colors.white, // Warna teks tombol
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Obx(() {
              if (controller.pickedImage.value != null) {
                return Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image:
                          FileImage(File(controller.pickedImage.value!.path)),
                    ),
                  ),
                );
              } else {
                return SizedBox.shrink();
              }
            }),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => controller.applyChanges(),
              child: Text('Simpan Perubahan'),
              style: ElevatedButton.styleFrom(
                primary: Colors.grey[700], // Warna latar belakang tombol
                onPrimary: Colors.white, // Warna teks tombol
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey[300], // Ganti latar belakang
    );
  }
}
