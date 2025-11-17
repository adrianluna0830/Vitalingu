import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:vitalingu/injection.dart';
import 'package:vitalingu/services/audio_service.dart';
import 'dart:math';

@RoutePage()
class LanguageView extends StatefulWidget {
  const LanguageView({super.key});

  @override
  State<LanguageView> createState() => _LanguageViewState();
}

class _LanguageViewState extends State<LanguageView> {
  final _audioService = getIt<AudioService>();
  ActiveRecording? _recording;
  double _amplitude = 0.0;

  void _toggleRecording() async {
    if (_recording == null) {
      (await _audioService.startRecording()).fold(
        (e) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString()))),
        (rec) {
          setState(() => _recording = rec);
          rec.data.amplitudeStream.listen((amp) {
            setState(() => _amplitude = max(0.0, min(1.0, (amp.current + 45) / 25)));
          });
        },
      );
    } else {
      (await _recording!.stop()).fold(
        (e) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString()))),
        (path) {
          setState(() {
            _recording = null;
            _amplitude = 0.0;
          });
          _audioService.playAudio(path);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Language View')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 200,
              decoration: BoxDecoration(border: Border.all()),
              alignment: Alignment.bottomCenter,
              child: Container(width: 50, height: _amplitude * 200, color: Colors.blue),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _toggleRecording,
              child: Text(_recording == null ? 'Start' : 'Stop'),
            ),
          ],
        ),
      ),
    );
  }
}