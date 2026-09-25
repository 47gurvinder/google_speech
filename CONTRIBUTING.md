# Contributing

Thank you for helping maintain `google_speech_gdx_plus`. Bug reports, feature requests, documentation improvements, tests, and code contributions are welcome.

## Before opening an issue

- Search [existing issues](https://github.com/47gurvinder/google_speech/issues).
- For usage questions, include a minimal reproducible example without credentials or private audio.
- For bugs, include the package version, Flutter and Dart versions, platform, expected behavior, actual behavior, and relevant logs.

Use the [feature request form](https://github.com/47gurvinder/google_speech/issues/new?template=feature_request.yml) for proposed enhancements.

## Development setup

```sh
flutter pub get
flutter analyze
flutter test
```

The examples use a local path dependency on the package. Never commit a real service-account JSON file, access token, private audio, or other secret.

## Pull Requests

1. Fork the repository and create a focused branch.
2. Keep changes scoped and preserve the existing public API unless the change explicitly requires a breaking release.
3. Add or update tests for behavior changes.
4. Run formatting, analysis, and tests.
5. Update the changelog only when requested by the maintainer or when preparing a release.
6. Open a [Pull Request](https://github.com/47gurvinder/google_speech/pulls) with a clear description and testing notes.

Generated protobuf sources under `lib/generated/` should be changed only by updating the source definitions or generator workflow. Explain any generated-code change in the Pull Request.

By contributing, you agree that your contribution is licensed under the repository's [MIT License](LICENSE).
