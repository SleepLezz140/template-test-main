import 'package:bloc/bloc.dart';
import 'package:flirt/infrastructures/api_error_response.dart';
import 'package:flirt/infrastructures/models/movies/movie_response.dart';
import 'package:flirt/infrastructures/repository/movies_repository.dart';
import 'package:flutter/material.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit() : super(const MoviesInitial(''));
  final MoviesRepository _moviesRepository = MoviesRepository();

  Future<void> fetchTopMovies() async {
    try {
      emit(const FetchTopMoviesLoading(''));

      final MoviesTop250RequestResponse response =
          await _moviesRepository.fetchTopMovies();

      emit(FetchTopMoviesSuccess('', response.items));
    } catch (e) {
      final APIErrorResponse error = e as APIErrorResponse;
      emit(FetchTopMoviesFailed(error.code, error.message));
    }
  }
}
