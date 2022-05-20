import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyectodemo/flavors_config.dart';
import 'package:proyectodemo/services/movies_provider.dart';
import '../../utils/swiper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: FlavorsConfig.instance.primaryColor,
        leading: FlavorsConfig.instance.iconflavor,
        elevation: 0,
        title: Text(FlavorsConfig.instance.appbarName),
      ),
      body: SwiperAction(movies: moviesProvider.displayMovie),
    );
  }
}
