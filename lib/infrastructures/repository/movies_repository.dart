import 'dart:convert';
import 'dart:io';
import 'package:flirt/infrastructures/api_error_response.dart';
import 'package:flirt/infrastructures/models/movies/movie_response.dart';
import 'package:http/http.dart' as http;

class MoviesRepository {
  final String _baseURL = 'imdb-api.com';
  final String _moviesRepoURL = '/en/API';
  final String _apiKey = 'k_341c941d';

  Future<MoviesTop250RequestResponse> fetchTopMovies() async {
    try {
      final http.Response response = await http.get(
        Uri.https(
          _baseURL,
          '$_moviesRepoURL/Top250Movies/$_apiKey',
        ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      final MoviesTop250RequestResponse result =
          MoviesTop250RequestResponse.fromJson(
              jsonDecode(response.body) as Map<String, dynamic>);

      return result;
    } on SocketException {
      final APIErrorResponse error =
          APIErrorResponse.fromJson(APIErrorResponse.socketErrorResponse());

      throw error;
    }
  }
}
