import 'package:flutter/material.dart';
import 'package:alan_voice/alan_voice.dart';

class AlanButton extends StatefulWidget {
  const AlanButton({Key? key}) : super(key: key);
  @override
  _AlanButtonState createState() => _AlanButtonState();
}

class _AlanButtonState extends State<AlanButton> {

  _AlanButtonState() {
    /// Khởi tạo Alan Button với project key từ Alan AI Studio
    AlanVoice.addButton("533730c687eb4dc945998a3232afc7b42e956eca572e1d8b807a3e2338fdd0dc/stage");

    /// Xử lý các lệnh từ Alan AI Studio
    AlanVoice.onCommand.add((command) {
      debugPrint("got new command ${command.toString()}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        // Xử lý sự kiện khi button của Alan được nhấn
      },
      child: Icon(Icons.mic),
    );
  }
}
