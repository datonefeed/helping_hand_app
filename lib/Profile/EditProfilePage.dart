import 'package:flutter/material.dart';
import 'package:HelpingHand/Widget/CustomWidget.dart';
import 'package:go_router/go_router.dart';
import 'package:alan_voice/alan_voice.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final NameController = TextEditingController();
  final PhoneController = TextEditingController();
  final AddressController = TextEditingController();

  _EditProfileState() {
    /// Khởi tạo Alan Button với project key từ Alan AI Studio
    AlanVoice.addButton(
        "533730c687eb4dc945998a3232afc7b42e956eca572e1d8b807a3e2338fdd0dc/stage");

    /// Xử lý các lệnh từ Alan AI Studio
    AlanVoice.onCommand.add((command) => _handleCommand(command.data));
  }

  void _handleCommand(Map<String, dynamic> command){
    switch(command["command"]){
      case "getName":
        NameController.text = command["text"];
        break;
      case "getAddress":
        AddressController.text = command["text"];
        break;
      case "getPhone":
        PhoneController.text = command["text"];
        break;
      default:
        debugPrint("Unknown command");

    }
  }
  @override
  void dispose() {
    NameController.dispose();
    AddressController.dispose();
    PhoneController.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: AppBar(
          backgroundColor: Color(0xFF1B1E69),
          title: Row(
            children: [
              InkWell(
                  onTap: () {
                    context.goNamed("Profile");
                  },
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    'assets/return.png',
                    width: 30,
                    height: 30,
                  )),
              SizedBox(
                width: 20,
              ),
              Text(
                'Edit profile',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 30, 8, 0),
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      // color: Colors.blue, // Màu nền của hình tròn
                      border: Border.all(
                        color: Colors.transparent, // Màu viền
                        width: 5, // Độ rộng của viền
                      ),
                      gradient: LinearGradient(
                        colors: [Colors.blue, Colors.pinkAccent],
                        // Màu của viền
                        begin: Alignment.topLeft,
                        // Điểm bắt đầu của gradient
                        end:
                            Alignment.bottomRight, // Điểm kết thúc của gradient
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 70, // Bán kính của avatar
                      backgroundImage: AssetImage(
                        'assets/meme-ech-xanh-25.jpg',
                      ), // Đường dẫn ảnh avatar
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "My profile",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1B1E69),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    hintText: 'Name',
                    controller: NameController,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    hintText: 'Phone Number',
                    controller: PhoneController,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    hintText: 'Address',
                    controller: AddressController,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CustomElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Save',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
