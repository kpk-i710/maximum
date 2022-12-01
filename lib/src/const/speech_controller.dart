import 'dart:math';

import 'package:get/get.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechController extends GetxController {
  bool _hasSpeech = false;
  double level = 0.0;
  double minSoundLevel = 50000;
  double maxSoundLevel = -50000;
  final lastWords = ''.obs;
  final lastError = ''.obs;
  String lastStatus = '';
  String _currentLocaleId = '';
  int resultListened = 0;
  List<LocaleName> _localeNames = [];
  final SpeechToText speech = SpeechToText();

  final listening = false.obs;
  Function(String text)? onResult;

  @override
  void onInit() {
    super.onInit();
    initSpeechState();
  }

  Future<void> initSpeechState() async {
    var hasSpeech = await speech.initialize(
        onError: errorListener,
        onStatus: statusListener,
        debugLogging: true,
        finalTimeout: Duration(milliseconds: 0));
    if (hasSpeech) {
      _localeNames = await speech.locales();

      var systemLocale = await speech.systemLocale();
      _currentLocaleId = systemLocale!.localeId;
    }

    _hasSpeech = hasSpeech;
  }

  bool isListening() => speech.isListening;

  void setListeners({Function(String text)? onResult}) {
    this.onResult = onResult;
  }

  void startListening() {
    lastWords.value = '';
    lastError.value = '';
    speech.listen(
        onResult: resultListener,
        listenFor: Duration(seconds: 5),
        pauseFor: Duration(seconds: 5),
        partialResults: false,
        localeId: _currentLocaleId,
        onSoundLevelChange: soundLevelListener,
        cancelOnError: true,
        listenMode: ListenMode.confirmation);
  }

  void stopListening() {
    speech.stop();
    level = 0.0;
  }

  void cancelListening() {
    speech.cancel();
    level = 0.0;
  }

  void resultListener(SpeechRecognitionResult result) {
    ++resultListened;
    print('Result listener $resultListened');
    lastWords.value = '${result.recognizedWords} - ${result.finalResult}';
    if(onResult != null) {
      onResult!(result.recognizedWords);
    }
  }

  void soundLevelListener(double level) {
    minSoundLevel = min(minSoundLevel, level);
    maxSoundLevel = max(maxSoundLevel, level);

    this.level = level;
  }

  void errorListener(SpeechRecognitionError error) {
    print("Received error status: $error, listening: ${speech.isListening}");
    lastError.value = '${error.errorMsg} - ${error.permanent}';
  }

  void statusListener(String status) {
    print('Received listener status: $status, listening: ${speech.isListening}');
    lastStatus = '$status';
    listening.value = speech.isListening;
  }
}