class LoginController {
  void login(String username, String password) {
    if (username == 'admin' && password == 'password') {
      print('Login thành công');
    } else {
      print('Sai tên đăng nhập hoặc mật khẩu');
    }
  }
}
