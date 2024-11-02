class RegisterController {
  void register(String username, String email, String password) {
    if (username.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
      print('Đăng ký thành công');
    } else {
      print('Vui lòng điền đầy đủ thông tin');
    }
  }
}
