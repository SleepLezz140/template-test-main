import 'package:json_annotation/json_annotation.dart';

part 'api_error_response.g.dart';

@JsonSerializable()
class APIErrorResponse {
  APIErrorResponse({
    required this.code,
    required this.message,
  });

  factory APIErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$APIErrorResponseFromJson(json);
  Map<String, dynamic> toJson() => _$APIErrorResponseToJson(this);

  static Map<String, dynamic> socketErrorResponse() {
    return <String, dynamic>{
      'error': 'NO_INTERNET_CONNECTION',
      'user_message': 'No Internet Connection',
    };
  }

  @JsonKey(name: 'error')
  final String code;
  @JsonKey(name: 'user_message')
  final String message;
}
