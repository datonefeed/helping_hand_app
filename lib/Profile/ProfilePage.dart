import 'package:flutter/material.dart';
import 'package:HelpingHand/Widget/CustomWidget.dart';
import 'package:go_router/go_router.dart';
class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90),
        child: AppBar(
          backgroundColor: Color(0xFF1B1E69),
          title: Row(
            children: [
              InkWell(
                  onTap: (){},
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset('assets/return.png',width: 30,height: 30,)),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Column(
                children: [
                  Container(
                    height: 75,
                    color:Color(0xFF1B1E69),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 90, 0, 0),
                        child: Text(
                          'Đạt Chưa Chín',
                          style: TextStyle(
                              fontSize: 30,
                              color: Color(0xFF1B1E69),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        'datxanhle11@gmail.com',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFF1B1E69),
                        ),
                      ),
                      SizedBox(height: 30,),
                      CustomElevatedButtonWithIcon(
                        icon: Icons.person,
                        onPressed: (){
                          context.pushReplacementNamed("EditProFile");

                        },
                        label: Text('Edit profile'),
                      ),
                      SizedBox(height: 10,),
                      CustomElevatedButtonWithIcon(
                        icon: Icons.notifications,
                        onPressed: (){},
                        label: Text('Notification setting'),
                      ),
                      SizedBox(height: 10,),
                      CustomElevatedButtonWithIcon(
                        icon: Icons.support,
                        onPressed: (){},
                        label: Text('Support'),
                      ),
                      SizedBox(height: 10,),
                      CustomElevatedButtonWithIcon(
                        icon: Icons.settings,
                        onPressed: (){},
                        label: Text('Setting'),
                      ),

                    ],
                  ),
                ],
              ),
              Container(
                width: 150,
                height: 150,
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
            ],
          )
        ),
      ),
      );
  }
}
