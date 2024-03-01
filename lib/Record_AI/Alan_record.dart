import 'package:flutter/material.dart';
import 'package:alan_voice/alan_voice.dart';
import 'package:HelpingHand/Services/auth.dart';

class AIRecord extends StatefulWidget {
  const AIRecord({super.key});

  @override
  State<AIRecord> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<AIRecord> {
  _MyHomePageState() {
    /// Init Alan Button with project key from Alan AI Studio
    AlanVoice.addButton("533730c687eb4dc945998a3232afc7b42e956eca572e1d8b807a3e2338fdd0dc/stage");

    /// Handle commands from Alan AI Studio
    AlanVoice.onCommand.add((command) {
      debugPrint("got new command ${command.toString()}");
    });
  }
  @override
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

          leading: const Padding(
            padding: EdgeInsets.only(left: 10),
            child: CircleAvatar(
              backgroundImage: AssetImage(
                  'assets/meme.jpg'), // Thay đổi đường dẫn ảnh của bạn ở đây
            ),
          ),
        ),
      ),
    );
  }
}

