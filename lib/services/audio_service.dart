import 'dart:async';
import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:fpdart/fpdart.dart';
class MyAmplitude {
  final double current;
  final double max;

  const MyAmplitude({required this.current, required this.max});
}

class RecordingData {
  final String path;
  final Stream<MyAmplitude> amplitudeStream;

  const RecordingData({required this.path, required this.amplitudeStream});
}

class ActiveRecording {
  final RecordingData data;
  final Future<Either<Exception, String>> Function() stop;

  const ActiveRecording({required this.data, required this.stop});
}
@singleton

class AudioService {
  final AudioRecorder _recorder = AudioRecorder();
  final AudioPlayer _player = AudioPlayer();

  Future<Either<Exception, bool>> _checkAndRequestPermission() async {
    try {
      final hasPermission = await _recorder.hasPermission();
      return right(hasPermission);
    } catch (e) {
      return left(Exception('Error checking permissions: $e'));
    }
  }

  Future<Either<Exception, String>> _getRecordingPath() async {
    try {
      final Directory directory;

      if (Platform.isIOS || Platform.isMacOS) {
        directory = await getApplicationDocumentsDirectory();
      } else if (Platform.isAndroid) {
        final externalDir = await getExternalStorageDirectory();
        directory = externalDir ?? await getApplicationDocumentsDirectory();
      } else if (Platform.isWindows || Platform.isLinux) {
        directory = await getApplicationDocumentsDirectory();
      } else {
        return left(Exception('Unsupported platform: ${Platform.operatingSystem}'));
      }

      if (!await directory.exists()) {
        await directory.create(recursive: true);
      }

      final timestamp = DateTime.now().millisecondsSinceEpoch;
      return right('${directory.path}/recording_$timestamp.wav');
    } catch (e) {
      return left(Exception('Error getting recording path: $e'));
    }
  }

  Future<Either<Exception, ActiveRecording>> startRecording() async {
    try {
      final isRecording = await _recorder.isRecording();
      if (isRecording) {
        return left(Exception('Already recording.'));
      }

      final permissionResult = await _checkAndRequestPermission();
      if (permissionResult.isLeft()) {
        return left(permissionResult.getLeft().toNullable()!);
      }
      final hasPermission = permissionResult.getRight().toNullable()!;
      if (!hasPermission) {
        return left(Exception('Recording permissions were not granted.'));
      }

      const encoder = AudioEncoder.wav;
      final isSupported = await _recorder.isEncoderSupported(encoder);
      if (!isSupported) {
        return left(Exception('WAV encoder not supported on this platform.'));
      }

      final pathResult = await _getRecordingPath();
      if (pathResult.isLeft()) {
        return left(pathResult.getLeft().toNullable()!);
      }
      final path = pathResult.getRight().toNullable()!;

      const config = RecordConfig(
        encoder: encoder,
        bitRate: 256000,
        sampleRate: 16000,
        numChannels: 1,
        autoGain: false,
        echoCancel: false,
        noiseSuppress: false,
      );

      await _recorder.start(config, path: path);

      final amplitudeController = StreamController<MyAmplitude>.broadcast();
      final amplitudeSubscription = _recorder
          .onAmplitudeChanged(const Duration(milliseconds: 100))
          .listen((amplitude) {
        final myAmplitude = MyAmplitude(
          current: amplitude.current,
          max: amplitude.max,
        );
        amplitudeController.add(myAmplitude);
      });

      Future<Either<Exception, String>> stopRecording() async {
        try {
          if (!amplitudeController.isClosed) {
            await amplitudeSubscription.cancel();
            await amplitudeController.close();
          }
          final recordedPath = await _recorder.stop();
          if (recordedPath == null) {
            return left(Exception('Recording path is null.'));
          }
          return right(recordedPath);
        } catch (e) {
          return left(Exception('Error stopping recording: $e'));
        }
      }

      return right(ActiveRecording(
        data: RecordingData(
          path: path,
          amplitudeStream: amplitudeController.stream,
        ),
        stop: stopRecording,
      ));
    } catch (e) {
      return left(Exception('Error starting recording: $e'));
    }
  }

  Future<Either<Exception, Unit>> playAudio(String path) async {
    try {
      await _player.play(DeviceFileSource(path));
      return right(unit);
    } catch (e) {
      return left(Exception('Error playing audio: $e'));
    }
  }

  Future<Either<Exception, Unit>> pauseAudio() async {
    try {
      await _player.pause();
      return right(unit);
    } catch (e) {
      return left(Exception('Error pausing playback: $e'));
    }
  }

  Future<Either<Exception, Unit>> resumeAudio() async {
    try {
      await _player.resume();
      return right(unit);
    } catch (e) {
      return left(Exception('Error resuming playback: $e'));
    }
  }

  Future<Either<Exception, Unit>> stopAudio() async {
    try {
      await _player.stop();
      return right(unit);
    } catch (e) {
      return left(Exception('Error stopping playback: $e'));
    }
  }

  Future<Either<Exception, Unit>> cleanOldRecordings({int daysOld = 7}) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final files = directory.listSync();
      final now = DateTime.now();

      for (var file in files) {
        if (file.path.contains('recording_') && file is File) {
          final stat = await file.stat();
          if (now.difference(stat.modified).inDays > daysOld) {
            await file.delete();
          }
        }
      }
      return right(unit);
    } catch (e) {
      return left(Exception('Error cleaning old recordings: $e'));
    }
  }

  Future<Either<Exception, Unit>> dispose() async {
    try {
      await _recorder.dispose();
      await _player.dispose();
      return right(unit);
    } catch (e) {
      return left(Exception('Error disposing resources: $e'));
    }
  }
}