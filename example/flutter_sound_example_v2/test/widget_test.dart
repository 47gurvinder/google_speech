import 'package:flutter_test/flutter_test.dart';
import 'package:google_speech_gdx_plus/google_speech.dart';

void main() {
  test('loads the maintained speech package', () {
    expect(AudioEncoding.LINEAR16.name, 'LINEAR16');
  });
}
