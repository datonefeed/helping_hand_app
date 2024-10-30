class ContactController {
  void sendMessage(String name, String email, String message) {
    if (name.isNotEmpty && email.isNotEmpty && message.isNotEmpty) {
      print('Liên hệ thành công');
    } else {
      print('Vui lòng điền đầy đủ thông tin');
    }
  }
}
