import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

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
                  const SizedBox(width: 20,),
                  const Text('Add Contact', style: TextStyle(fontSize: 30, color: Colors.white),),
            ],
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 30, 0, 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    child: Icon(Icons.add_circle, color: Color(0xFF1B1E69), size: 40,),
                  ),
                  const SizedBox(width: 20,),
                  const Text('Add Contact', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400, color:Color(0xFF1B1E69) ),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
