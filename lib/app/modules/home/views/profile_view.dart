import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/modules/home/views/edit_profile_view.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  var newNama = 'Nama Lengkap'.obs;
  var newPosisi = 'Posisi / Jabatan'.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil Saya'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('lib/images/apiens_1.png'),
            ),
            SizedBox(height: 20),
            Obx(() => Text(
                  newNama.value,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                )),
            SizedBox(height: 10),
            Obx(() => Text(
                  newPosisi.value,
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                )),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.email, size: 30),
                SizedBox(width: 10),
                Text(
                  'email@domain.com',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.phone, size: 30),
                SizedBox(width: 10),
                Text(
                  '+1234567890',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                bool changesApplied = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditProfileView(
                      initialNama: newNama.value,
                      initialPosisi: newPosisi.value,
                    ),
                  ),
                );

                if (changesApplied == true) {
                  // Jika perubahan diterapkan, perbarui nilai di ProfileView
                  newNama.value = '';
                  newPosisi.value = '';
                }
              },
              child: Text('Edit Profil'),
            ),
          ],
        ),
      ),
    );
  }
}
