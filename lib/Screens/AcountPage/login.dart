import 'package:flutter/material.dart';
import 'package:helping_hand_app/controller/LoginController.dart';

class LoginPage extends StatelessWidget {
  final LoginController _loginController = LoginController();

  @override
  Widget build(BuildContext context) {
    TextEditingController _usernameController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Đăng nhập'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Tên đăng nhập'),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Mật khẩu'),
            ),
            ElevatedButton(
              onPressed: () {
                String username = _usernameController.text;
                String password = _passwordController.text;
                _loginController.login(username, password);
              },
              child: Text('Đăng nhập'),
            ),
          ],
        ),
      ),
    );
  }
}
