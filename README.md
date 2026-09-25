# Google Speech GDX Plus

[![pub package](https://img.shields.io/pub/v/google_speech_gdx_plus.svg)](https://pub.dev/packages/google_speech_gdx_plus)
[![MIT license](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![GitHub issues](https://img.shields.io/github/issues/47gurvinder/google_speech.svg)](https://github.com/47gurvinder/google_speech/issues)

A community-maintained Flutter client for the [Google Cloud Speech-to-Text API](https://cloud.google.com/speech-to-text/docs). It uses gRPC from Dart and supports synchronous recognition, streaming recognition, long-running recognition, API V1, V1p1beta1, V2, and experimental endless streaming.

### Recognition demo

![Recognition demo](https://media.giphy.com/media/LNfVGfBpOrIJhEI2GR/giphy.gif)

### Streaming demo

![Streaming recognition demo](https://media.giphy.com/media/hrEltlpfVKj1rVr2DA/giphy.gif)

## Requirements and compatibility

- Dart 3.8 or later (below Dart 4)
- Flutter 3.32 or later
- Android, iOS, Linux, macOS, or Windows
- A Google Cloud project with the Speech-to-Text API enabled

The package uses `dart:io` and does not support Flutter Web. Google Cloud availability, quotas, supported audio formats, and pricing are documented in the [official Speech-to-Text documentation](https://cloud.google.com/speech-to-text/docs).

## Installation

Add the package to your application:

```sh
flutter pub add google_speech_gdx_plus
```

Or add it to `pubspec.yaml`:

```yaml
dependencies:
  google_speech_gdx_plus: ^6.0.0
```

Then import the public library:

```dart
import 'package:google_speech_gdx_plus/google_speech.dart';
```

## Google Cloud setup

Create or select a Google Cloud project, enable the Speech-to-Text API, and configure credentials by following Google's [client-library quickstart](https://cloud.google.com/speech-to-text/docs/quickstart-client-libraries).

> [!IMPORTANT]
> Do not ship service-account private keys in a mobile or desktop application. For production client applications, obtain short-lived access credentials from a trusted backend and use `ThirdPartyAuthenticator` or `SpeechToText.viaToken`. Service-account loading is most appropriate for trusted environments and local development.

## Authentication

### Third-party authenticator

Use a trusted service to issue or refresh short-lived credentials:

```dart
final speechToText = SpeechToText.viaThirdPartyAuthenticator(
  ThirdPartyAuthenticator(
    obtainCredentialsFromThirdParty: () async {
      final json = await requestCredentialsFromMyBackend();
      return AccessCredentials.fromJson(json);
    },
  ),
);
```

### Access token

You are responsible for refreshing the token before it expires:

```dart
final speechToText = SpeechToText.viaToken(
  'Bearer',
  '<access-token>',
);
```

### Service account

Load credentials from a JSON file in a trusted environment:

```dart
import 'dart:io';
import 'package:google_speech_gdx_plus/google_speech.dart';

final serviceAccount = ServiceAccount.fromFile(
  File('path/to/service-account.json'),
);
final speechToText = SpeechToText.viaServiceAccount(serviceAccount);
```

You can also load the JSON string directly:

```dart
final serviceAccount = ServiceAccount.fromString(
  await rootBundle.loadString('assets/service-account.json'),
);
final speechToText = SpeechToText.viaServiceAccount(serviceAccount);
```

Never commit credential files. Bundling a service-account key as a Flutter asset exposes it to application users.

## Recognize an audio file

Create a recognition configuration:

```dart
final config = RecognitionConfig(
  encoding: AudioEncoding.LINEAR16,
  model: RecognitionModel.basic,
  enableAutomaticPunctuation: true,
  sampleRateHertz: 16000,
  languageCode: 'en-US',
);
```

Load audio and send the request:

```dart
final audio = await File('test.wav').readAsBytes();
final response = await speechToText.recognize(config, audio);

for (final result in response.results) {
  print(result.alternatives.first.transcript);
}
```

## Stream audio

Pass a `Stream<List<int>>` from a file or microphone source:

```dart
final streamingConfig = StreamingRecognitionConfig(
  config: config,
  interimResults: true,
);

final audioStream = File('test.wav').openRead();
final responseStream = speechToText.streamingRecognize(
  streamingConfig,
  audioStream,
);

responseStream.listen((response) {
  for (final result in response.results) {
    print(result.alternatives.first.transcript);
  }
});
```

## API variants

- Use `SpeechToText` for the stable V1 API.
- Use `SpeechToTextBeta` for V1p1beta1 features.
- Use `SpeechToTextV2` for the V2 API. See [`example/audio_file_example_v2`](example/audio_file_example_v2).
- Use `EndlessStreamingService`, `EndlessStreamingServiceBeta`, or `EndlessStreamingServiceV2` for experimental endless streaming.

```dart
final service = EndlessStreamingService.viaServiceAccount(serviceAccount);

service.endlessStream.listen((response) {
  // Handle recognition results.
});

service.endlessStreamingRecognize(
  StreamingRecognitionConfig(config: config, interimResults: true),
  audioStream,
);
```

## Troubleshooting empty responses

An empty response is commonly caused by audio encoding, sample rate, channel, or language settings that do not match the supplied audio. Review Google's [empty-response troubleshooting guide](https://cloud.google.com/speech-to-text/docs/troubleshooting#returns_an_empty_response). Historical discussion is preserved in [upstream issue #25](https://github.com/felixjunghans/google_speech/issues/25).

## Examples

Runnable examples are available in the [`example`](example) directory for file recognition, V2 recognition, microphone streaming, `flutter_sound`, and endless streaming. The examples intentionally reference the package through a local path when run from this repository.

## Maintained Package

`google_speech_gdx_plus` is a community-maintained continuation of Felix Junghans's original [`google_speech`](https://github.com/felixjunghans/google_speech) project. This fork continues maintenance because the upstream package is inactive. Original copyright, license, commit history, and contributor credit remain intact.

## Feature Requests

Feature requests and Pull Requests are always welcome.

- [Request a feature](https://github.com/47gurvinder/google_speech/issues/new?template=feature_request.yml)
- [Report a bug](https://github.com/47gurvinder/google_speech/issues)
- [Open or review a Pull Request](https://github.com/47gurvinder/google_speech/pulls)
- Read the [contribution guide](CONTRIBUTING.md)

## Need Help?

Professional help is available for Google Cloud Speech integration, Flutter development, package and plugin maintenance, upgrades, and production troubleshooting. Visit [gurwinderdevx.com](https://gurwinderdevx.com) to discuss a project.

## Maintainer

Maintained by Gurwinder Singh.

- [Website](https://gurwinderdevx.com)
- [GitHub](https://github.com/47gurvinder)
- [LinkedIn](https://www.linkedin.com/in/gurwinderDevX)
- [Upwork](https://www.upwork.com/freelancers/gurwinderdevx)

## Acknowledgements

The project was originally created and maintained by [Felix Junghans](https://github.com/felixjunghans). Thanks to Felix and all [upstream contributors](https://github.com/felixjunghans/google_speech/graphs/contributors) whose work established and improved the package.

## License

Licensed under the [MIT License](LICENSE). The original copyright notice is preserved.
