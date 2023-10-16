import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  var newNama = ''.obs;
  var newPosisi = ''.obs;
  var selectedImage = Rxn<XFile>();

  void setNewNama(String nama) {
    newNama.value = nama;
  }

  void setNewPosisi(String posisi) {
    newPosisi.value = posisi;
  }

  void pickImage(ImageSource source) async {
    if (source == ImageSource.camera) {
      selectedImage.value = await _getCameraImage();
    } else {
      final picker = ImagePicker();
      XFile? pickedImage = await picker.pickImage(source: source);
      selectedImage.value = pickedImage;
    }
  }

  Future<XFile?> _getCameraImage() async {
    return XFile('path_to_default_camera_image.jpg');
  }

  void applyChanges() {
    // Implement logic to apply changes here
    // You can access newNama.value, newPosisi.value, and selectedImage.value
  }
}
