# Examples

These Flutter applications demonstrate `google_speech_gdx_plus` with different audio sources and Google Cloud Speech-to-Text API versions.

- [`audio_file_example`](audio_file_example): recognize and stream a local audio file with API V1.
- [`audio_file_example_v2`](audio_file_example_v2): recognize a local audio file with API V2.
- [`mic_stream_example`](mic_stream_example): stream microphone audio with `sound_stream`.
- [`flutter_sound_example`](flutter_sound_example): stream microphone audio with `flutter_sound_lite` and API V1.
- [`flutter_sound_example_v2`](flutter_sound_example_v2): stream microphone audio with `flutter_sound_lite` and API V2.
- [`endless_streaming_example`](endless_streaming_example): demonstrate experimental endless streaming.

Each example references the package at `../../`. The current sample applications load `assets/test_service_account.json`; create that ignored file locally with development-only credentials before running them, and review each application's platform permissions. Never commit a real service-account file or access token, and do not use this asset-based approach in a distributed production application.

```sh
cd example/audio_file_example
flutter pub get
flutter run
```

See the main [README](../README.md) for setup, authentication, and credential-safety guidance.
