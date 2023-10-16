import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileController extends GetxController {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController posisiController = TextEditingController();
  Rx<XFile?> pickedImage = Rx<XFile?>(null);

  void getImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      this.pickedImage.value = pickedImage;
    }
  }

  void applyChanges() {
    String newNama = namaController.text;
    String newPosisi = posisiController.text;

    // Implementasi logika untuk menerapkan perubahan

    // Kembali ke halaman sebelumnya dengan hasil perubahan
    Get.back(result: true);
  }
}

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
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: controller.namaController,
              decoration: InputDecoration(labelText: 'Nama Lengkap'),
            ),
            TextField(
              controller: controller.posisiController,
              decoration: InputDecoration(labelText: 'Posisi / Jabatan'),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => controller.getImage(ImageSource.gallery),
                  child: Text('Pilih dari Galeri'),
                ),
                ElevatedButton(
                  onPressed: () => controller.getImage(ImageSource.camera),
                  child: Text('Ambil dari Kamera'),
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
            ),
          ],
        ),
      ),
    );
  }
}
