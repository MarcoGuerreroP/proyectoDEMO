import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyectodemo/utils/theme.dart';
import 'package:proyectodemo/widgets/screens/details_movie_screen.dart';
import 'package:proyectodemo/widgets/screens/home_screen.dart';
import 'package:proyectodemo/widgets/screens/splash_screen.dart';
import 'services/movies_provider.dart';

void main() {
  runApp(const MyAppState());
}

class MyAppState extends StatelessWidget {
  const MyAppState({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MoviesProvider(),
          lazy: false,
        ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Catalago de Peliculas DEMO',
      initialRoute: 'home_screen',
      routes: {
        'home_screen': (_) => const HomeScreen(),
        'splash_screen': (_) => const SplashScreen(),
        'details_screen': (_) => const DetailsScreen(),
      },
      theme: themeDataDark,
    );
  }
}
