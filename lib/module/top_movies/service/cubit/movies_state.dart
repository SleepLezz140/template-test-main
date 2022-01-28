part of 'movies_cubit.dart';

@immutable
abstract class MoviesState {
  const MoviesState(this.message);
  final String message;
}

class MoviesInitial extends MoviesState {
  const MoviesInitial(String message) : super(message);
}

class FetchTopMoviesSuccess extends MoviesState {
  const FetchTopMoviesSuccess(String message, this.movies) : super(message);
  final List<MovieObject> movies;
}

class FetchTopMoviesFailed extends MoviesState {
  const FetchTopMoviesFailed(this.errorCode, String message) : super(message);

  final String errorCode;
}

class FetchTopMoviesLoading extends MoviesState {
  const FetchTopMoviesLoading(String message) : super(message);
}
