import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'dart:typed_data';

import 'package:vitalingu/services/azure_speech_service.dart';

@RoutePage()
class LanguageView extends StatefulWidget {
  const LanguageView({super.key});

  @override
  State<LanguageView> createState() => _LanguageViewState();
}

class _LanguageViewState extends State<LanguageView> {
  Future<dynamic> _callApiAndPrint(
    String methodName, 
    Future<dynamic> Function() apiCall
  ) async {
    print('Llamando a: $methodName');
    try {
      final result = await apiCall();
      print('Éxito - Resultado de $methodName:');
      if (result is Uint8List) {
        print('Tipo: Uint8List, Longitud: ${result.length} bytes');
      } else {
        print('Resultado: $result');
      }
    } catch (e) {
      print('Error en $methodName: $e');
    }
    print('');
  }
  
  void _synthesizeTextSSML() {
    _callApiAndPrint(
      'synthesizeTextSSML',
      () => AzureSpeechService.synthesizeTextSSML(
        apiKey: 'TU_API_KEY_DUMMY',
        endpoint: 'TU_ENDPOINT_DUMMY',
        ssml: '<speak version="1.0" xml:lang="en-US"><voice name="en-US-JennyNeural">Hello, world.</voice></speak>',
      ),
    );
  }

  void _assessPronunciation() {
    _callApiAndPrint(
      'assessPronunciation',
      () => AzureSpeechService.assessPronunciation(
        apiKey: 'TU_API_KEY_DUMMY',
        endpoint: 'TU_ENDPOINT_DUMMY',
        voice: 'en-US-JennyNeural',
        audio: Uint8List.fromList([1, 2, 3, 4]),
        referenceText: 'Hello world',
      ),
    );
  }

  void _recognizeSpeech() {
    _callApiAndPrint(
      'recognizeSpeech',
      () => AzureSpeechService.recognizeSpeech(
        apiKey: 'TU_API_KEY_DUMMY',
        endpoint: 'TU_ENDPOINT_DUMMY',
        voice: 'en-US-JennyNeural',
        audio: Uint8List.fromList([1, 2, 3, 4]),
        languageCandidates: ['en-US', 'es-ES'],
      ),
    );
  }

  void _fastTranscription() {
    _callApiAndPrint(
      'fastTranscription',
      () => AzureSpeechService.fastTranscription(
        apiKey: 'TU_API_KEY_DUMMY',
        endpoint: 'TU_ENDPOINT_DUMMY',
        voice: 'en-US-JennyNeural',
        audio: Uint8List.fromList([1, 2, 3, 4]),
        locale: 'en-US',
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: _synthesizeTextSSML,
              child: const Text('synthesizeTextSSML'),
            ),
            ElevatedButton(
              onPressed: _assessPronunciation,
              child: const Text('assessPronunciation'),
            ),
            ElevatedButton(
              onPressed: _recognizeSpeech,
              child: const Text('recognizeSpeech'),
            ),
            ElevatedButton(
              onPressed: _fastTranscription,
              child: const Text('fastTranscription'),
            ),
          ],
        ),
      ),
    );
  }
}