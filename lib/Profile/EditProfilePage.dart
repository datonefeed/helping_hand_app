import 'package:flutter/material.dart';
import 'package:HelpingHand/Widget/CustomWidget.dart';
class EditProfile extends StatelessWidget {
  const EditProfile({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: AppBar(
          backgroundColor: Color(0xFF1B1E69),
          title: Row(
            children: [
              InkWell(
                  onTap: (){},
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset('assets/return.png',width: 30,height: 30,)),
              SizedBox(width: 20,),
              Text('Edit profile', style: TextStyle(fontSize: 30, color: Colors.white),),
            ],
          ),
        ),
      ),
      body: SafeArea(
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
                      colors: [Colors.blue, Colors.pinkAccent], // Màu của viền
                      begin: Alignment.topLeft, // Điểm bắt đầu của gradient
                      end: Alignment.bottomRight, // Điểm kết thúc của gradient
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 70, // Bán kính của avatar
                    backgroundImage: AssetImage('assets/meme-ech-xanh-25.jpg',), // Đường dẫn ảnh avatar
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                  "My profile",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1B1E69),
                  ),
                ),
                SizedBox(height: 20,),
                CustomTextField(hintText: 'My Dad'),
                SizedBox(height: 10,),
                CustomTextField(hintText: 'Phone Number'),
                SizedBox(height: 10,),
                CustomTextField(hintText: 'Address'),
                SizedBox(height: 10,),
                CustomTextField(hintText: 'Citizen identification card'),
                SizedBox(height: 20,),
                CustomElevatedButton(
                    onPressed: (){},
                    child: Text('Save', style: TextStyle(fontSize: 25, color: Colors.white,fontWeight: FontWeight.w500),))


              ],
            ),
          ),
        ),
      ),
    );
  }
}
