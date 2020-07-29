import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:learningflutterexamples/examples/audio/audio_screen.dart';

//Audio Service widget wrapping the audio screen
class AudioServiceExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AudioServiceWidget(
      child: AudioScreen(),
    );
  }
}
