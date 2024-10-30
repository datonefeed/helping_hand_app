import 'package:flutter/material.dart';
import 'package:helping_hand_app/Widget/CustomWidget.dart';
import 'package:go_router/go_router.dart';
import 'package:alan_voice/alan_voice.dart';

import 'package:flutter/material.dart';
import '../../controller/ProfileController.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});
  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final ProfileController _profileController = ProfileController();

  @override
  Widget build(BuildContext context) {
    TextEditingController _usernameController = TextEditingController();
    TextEditingController _bioController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Chỉnh sửa hồ sơ'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Tên'),
            ),
            TextField(
              controller: _bioController,
              decoration: InputDecoration(labelText: 'Mô tả'),
            ),
            ElevatedButton(
              onPressed: () {
                String username = _usernameController.text;
                String bio = _bioController.text;
                _profileController.editProfile(username, bio);
              },
              child: Text('Lưu thay đổi'),
            ),
          ],
        ),
      ),
    );
  }
}
