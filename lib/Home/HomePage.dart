import 'dart:async';
import 'package:flutter/material.dart';
import 'package:login/Services/auth.dart';
import '../ActivePage/EditProfilePage.dart';
import '../Profile/ProfilePage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _radiusAnimation;
  final AuthServices _auth = AuthServices();
  final List<Widget> pages = [EditProfile(), Profile()];
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
          milliseconds: 300), // Tăng thời gian để hiệu ứng chậm lại
    );

    _radiusAnimation = Tween(begin: 150.0, end: 220.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _controller.addListener(() {
      setState(() {});
    });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse(); // Reverse animation when completed
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward(); // Forward animation when dismissed
      }
    });

    // Bỏ Timer.periodic và thay thế bằng lệnh gọi forward ở cuối initState()
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: AppBar(
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome to',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w200),
              ),
              // SizedBox(height: 10,),
              Text(
                'Troller Việt Nam',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          backgroundColor: const Color(0xFF1B1E69),
          actions: <Widget>[
            TextButton.icon(
              icon: Icon(Icons.person),
              label: const Text('Logout'),
              onPressed: () async {
                await _auth.signOut();
              },
            )
          ],
          leading: const Padding(
            padding: EdgeInsets.only(left: 10),
            child: CircleAvatar(
              backgroundImage: AssetImage(
                  'assets/meme.jpg'), // Thay đổi đường dẫn ảnh của bạn ở đây
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: InkWell(
          borderRadius: BorderRadius.circular(200),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Đã gửi tín hiệu cầu cứu!'),
            ));
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: _radiusAnimation.value,
                height: _radiusAnimation.value,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFECECEC),
                ),
              ),
              Container(
                width: _radiusAnimation.value * 0.8,
                height: _radiusAnimation.value * 0.8,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFA7C9F2),
                ),
              ),
              Container(
                width: _radiusAnimation.value * 0.6,
                height: _radiusAnimation.value * 0.6,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF7DA9DE),
                ),
              ),
              Container(
                width: _radiusAnimation.value * 0.4,
                height: _radiusAnimation.value * 0.4,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF465394),
                ),
              ),
              Container(
                child: Image.asset(
                  'assets/bell.png',
                  width: 50,
                  height: 50,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
