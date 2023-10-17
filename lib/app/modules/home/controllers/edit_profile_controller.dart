import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileController extends GetxController {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController posisiController = TextEditingController();
  Rx<XFile?> pickedImage = Rx<XFile?>(null);
  Rx<String> newNama = Rx<String>('');
  Rx<String> newPosisi = Rx<String>('');

  void getImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      this.pickedImage.value = pickedImage;
    }
  }

  void applyChanges() {
    newNama.value = namaController.text;
    newPosisi.value = posisiController.text;
    Get.back(result: true);
  }
}
