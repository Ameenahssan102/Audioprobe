import 'package:audio_probe/Dio/dio_client.dart';
import 'package:audio_probe/Navigation/nav.dart';
import 'package:audio_probe/repo.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RecordingProvider with ChangeNotifier {
  final Repo repo;
  final DioClient dioClient;
  final NavigationService ns;
  final SharedPreferences sharedPreferences;
  RecordingProvider(
      {required this.repo,
      required this.ns,
      required this.dioClient,
      required this.sharedPreferences});

  bool _isRecording = false;
  bool get isRecording => _isRecording;

  void toggleRecording() {
    _isRecording = !_isRecording;
    notifyListeners();
  }
  
}
