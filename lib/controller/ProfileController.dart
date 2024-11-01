class ProfileController {
  void editProfile(String username, String bio) {
    if (username.isNotEmpty && bio.isNotEmpty) {
      print('Cập nhật hồ sơ thành công');
    } else {
      print('Vui lòng điền đủ thông tin');
    }
  }
}
