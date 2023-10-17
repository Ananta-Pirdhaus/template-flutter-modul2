import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/modules/home/controllers/edit_profile_controller.dart';
import 'package:project/app/modules/home/views/edit_profile_view.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  var newNama = 'Ananta Pirdhaus'.obs;
  var newPosisi = 'CEO'.obs;

  @override
  Widget build(BuildContext context) {
    var pickedImage = Get.put(EditProfileController()).pickedImage.value;

    return Scaffold(
      backgroundColor: Colors.grey[300], // Ganti latar belakang
      appBar: AppBar(
        title: Text(
          'Profil Saya',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[700], // Ganti warna app bar
        elevation: 0, // Hilangkan shadow
        leading: Builder(
          builder: (context) => IconButton(
            icon: Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Icon(
                Icons.menu,
                color: Colors.black,
              ),
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Logo
                DrawerHeader(
                  child: Image.asset(
                    'lib/images/logo.png',
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Divider(
                    color: Colors.grey[800],
                  ),
                ),
                // Other Page

                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Home",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.info,
                      color: Colors.white,
                    ),
                    title: Text(
                      "About",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 25.0, bottom: 25),
                  child: ListTile(
                    leading: Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Logout",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ), // Pindah drawer ke sini
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            CircleAvatar(
              radius: 70,
              backgroundImage: pickedImage != null
                  ? FileImage(File(pickedImage.path))
                  : AssetImage('lib/images/apiens_1.png')
                      as ImageProvider<Object>,
            ),
            SizedBox(height: 10),
            Center(
              child: Column(
                children: <Widget>[
                  Obx(
                    () => Text(
                      newNama.value,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 5),
                  Obx(
                    () => Text(
                      newPosisi.value,
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            SizedBox(height: 10),
            buildInfoTile(Icons.email, 'email@domain.com'),
            buildInfoTile(Icons.phone, '+1234567890'),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () async {
                bool changesApplied = await Get.to(
                  () => EditProfileView(
                    initialNama: newNama.value,
                    initialPosisi: newPosisi.value,
                  ),
                );

                if (changesApplied == true) {
                  newNama.value =
                      Get.find<EditProfileController>().newNama.value;
                  newPosisi.value =
                      Get.find<EditProfileController>().newPosisi.value;
                }
              },
              child: SizedBox(
                height: 50,
                width: 150,
                child: Center(
                  child: Text(
                    'Edit Profil',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.grey[700],
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInfoTile(IconData icon, String text) {
    return ListTile(
      leading: Icon(icon, size: 30, color: Colors.grey[700]),
      title: Text(
        text,
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
