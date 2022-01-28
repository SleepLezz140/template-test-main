import 'package:flirt/module/top_movies/interfaces/screens/top_movies_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    const bool _hasInternet = true;

    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final ThemeData _theme = Theme.of(context);

    void seeTopMovies() {
      if (_hasInternet) {
        Navigator.of(context).pushNamed(TopMoviesScreen.routeName);
      } 
    }

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: mediaQuery.size.height * 0.25),
          child: Image.asset(
            'assets/images/imdb.png',
            fit: BoxFit.fitHeight,
            width: mediaQuery.size.width * 0.4,
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 36.0),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.yellow[700]),
              ),
              onPressed: seeTopMovies,
              child: Text(
                'See Top 250 Movies',
                style: _theme.textTheme.button?.copyWith(color: Colors.black),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
