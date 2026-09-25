import 'package:google_speech_gdx_plus/config/recognition_config_v1.dart';
import 'package:google_speech_gdx_plus/config/recognition_config_v1p1beta1.dart';
import 'package:google_speech_gdx_plus/config/recognition_config_v2.dart';
import 'package:google_speech_gdx_plus/generated/google/cloud/speech/v1/cloud_speech.pb.dart'
    as speech_v1;
import 'package:google_speech_gdx_plus/generated/google/cloud/speech/v1p1beta1/cloud_speech.pb.dart'
    as speech_beta;
import 'package:google_speech_gdx_plus/generated/google/cloud/speech/v2/cloud_speech.pb.dart'
    as speech_v2;
import 'package:google_speech_gdx_plus/generated/google/protobuf/field_mask.pb.dart';

class StreamingRecognitionConfig {
  /// Required. Provides information to the recognizer that specifies
  /// how to process the request.
  final RecognitionConfig config;

  /// If false or omitted, the recognizer will perform continuous recognition
  /// (continuing to wait for and process audio even if the user pauses speaking)
  /// until the client closes the input stream (gRPC API) or until the maximum
  /// time limit has been reached. May return multiple
  /// StreamingRecognitionResults with the is_final flag set to true.
  ///
  /// If true, the recognizer will detect a single spoken utterance.
  /// When it detects that the user has paused or stopped speaking,
  /// it will return an END_OF_SINGLE_UTTERANCE event and cease recognition.
  /// It will return no more than one StreamingRecognitionResult with the
  /// is_final flag set to true.
  final bool singleUtterance;

  /// If true, interim results (tentative hypotheses) may be returned as
  /// they become available (these interim results are indicated with the
  /// is_final=false flag). If false or omitted, only is_final=true result(s)
  /// are returned.
  final bool interimResults;

  /// A streaming speech recognition result corresponding to a portion of
  /// the audio that is currently being processed.
  StreamingRecognitionConfig({
    required this.config,
    this.singleUtterance = false,
    this.interimResults = false,
  });

  speech_v1.StreamingRecognitionConfig toConfig() =>
      (speech_v1.StreamingRecognitionConfig()
        ..config = config.toConfig()
        ..singleUtterance = singleUtterance
        ..interimResults = interimResults);
}

class StreamingRecognitionConfigBeta {
  /// Required. Provides information to the recognizer that specifies
  /// how to process the request.
  final RecognitionConfigBeta config;

  /// If false or omitted, the recognizer will perform continuous recognition
  /// (continuing to wait for and process audio even if the user pauses speaking)
  /// until the client closes the input stream (gRPC API) or until the maximum
  /// time limit has been reached. May return multiple
  /// StreamingRecognitionResults with the is_final flag set to true.
  ///
  /// If true, the recognizer will detect a single spoken utterance.
  /// When it detects that the user has paused or stopped speaking,
  /// it will return an END_OF_SINGLE_UTTERANCE event and cease recognition.
  /// It will return no more than one StreamingRecognitionResult with the
  /// is_final flag set to true.
  final bool singleUtterance;

  /// If true, interim results (tentative hypotheses) may be returned as
  /// they become available (these interim results are indicated with the
  /// is_final=false flag). If false or omitted, only is_final=true result(s)
  /// are returned.
  final bool interimResults;

  /// A streaming speech recognition result corresponding to a portion of
  /// the audio that is currently being processed.
  StreamingRecognitionConfigBeta({
    required this.config,
    this.singleUtterance = false,
    this.interimResults = false,
  });

  speech_beta.StreamingRecognitionConfig toConfig() =>
      (speech_beta.StreamingRecognitionConfig()
        ..config = config.toConfig()
        ..singleUtterance = singleUtterance
        ..interimResults = interimResults);
}

class StreamingRecognitionConfigV2 {
  /// Required. Provides information to the recognizer that specifies
  /// how to process the request.
  final RecognitionConfigV2 config;

  final speech_v2.StreamingRecognitionFeatures? streamingFeatures;

  final FieldMask? configMask;

  /// A streaming speech recognition result corresponding to a portion of
  /// the audio that is currently being processed.
  StreamingRecognitionConfigV2({
    required this.config,
    this.streamingFeatures,
    this.configMask,
  });

  speech_v2.StreamingRecognitionConfig toConfig() =>
      speech_v2.StreamingRecognitionConfig(
        config: config.toConfig(),
        streamingFeatures: streamingFeatures,
        configMask: configMask,
      );
}
