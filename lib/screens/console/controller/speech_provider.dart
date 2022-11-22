import 'package:flutter/cupertino.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechProvider extends ChangeNotifier {
  SpeechToText _speechToText = SpeechToText();
  get speechToTextGet => _speechToText;

  /// Each time to start a speech recognition session
  void startListening(TextEditingController textEditingController) async {
    await _speechToText.listen(onResult: (SpeechRecognitionResult result) {
      textEditingController.text = result.recognizedWords;
    });
    notifyListeners();
  }

  void initSpeech() async {
    await _speechToText.initialize();
    notifyListeners();
  }

  void stopListening() async {
    await _speechToText.stop();
    notifyListeners();
  }

  // void _onSpeechResult(SpeechRecognitionResult result,
  //     TextEditingController textEditingController) {
  //   textEditingController.text = '${result.recognizedWords}.';
  //   notifyListeners();
  // }
}
