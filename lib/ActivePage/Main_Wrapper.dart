import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;
  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int selectedIndex = 0;

  void _goToBrach(int index) {
    widget.navigationShell.goBranch(
        index,
        initialLocation: index == widget.navigationShell.currentIndex,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: widget.navigationShell,
      ),
      bottomNavigationBar: GNav(
        onTabChange: (index) {
          setState(() {
            selectedIndex = index;
          });
          _goToBrach(index);
        },
        gap: 5,
        backgroundColor: Color(0xFF1B1E69),
        color: Colors.white,
        activeColor: Color(0xFF1B1E69),
        tabBackgroundColor: Colors.white,
        tabBorderRadius: 8,
        tabMargin: EdgeInsets.all(10),
        padding: EdgeInsets.all(8),
        tabs: [
          GButton(
            icon: Icons.home,
            text: "Home",
          ),
          GButton(
            icon: Icons.add,
            text: "Add contact",
          ),
          GButton(
            icon: Icons.person,
            text: "Profile",
          ),
        ],

      ),
    );
  }
}
