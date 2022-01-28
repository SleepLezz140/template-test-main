import 'package:flirt/module/top_movies/service/cubit/movies_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopMoviesScreen extends StatefulWidget {
  const TopMoviesScreen({Key? key}) : super(key: key);

  static const String routeName = '/top-movies';

  @override
  _TopMoviesScreenState createState() => _TopMoviesScreenState();
}

class _TopMoviesScreenState extends State<TopMoviesScreen> {
  @override
  void initState() {
    super.initState();
    context.read<MoviesCubit>().fetchTopMovies();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: BlocBuilder<MoviesCubit, MoviesState>(
          builder: (BuildContext context, MoviesState state) {
            if (state is FetchTopMoviesSuccess) {
              return ListView.builder(
                itemCount: state.movies.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: ClipRRect(
                      child: Image.network(state.movies[index].image),
                    ),
                    title: Text(
                      state.movies[index].rank + "." + state.movies[index].title +" (" +state.movies[index].year +")",
                      style: _theme.textTheme.bodyText2
                          ?.copyWith(color: Colors.white),
                    ),
                    subtitle: Column(
                      // ignore: always_specify_types
                      children: [
                        Wrap(
                          // ignore: always_specify_types
                          children: [
                            Text(
                              state.movies[index].crew,
                              style: _theme.textTheme.bodyText2
                                  ?.copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                        Row(
                          // ignore: always_specify_types
                          children: [
                            const Icon(Icons.star, color: Colors.white, size: 10.0),
                            Text(
                              state.movies[index].imDbRating,
                              style: _theme.textTheme.bodyText2
                                  ?.copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.yellow[800],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
