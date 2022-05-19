import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import '../clases/movie.dart';

class SwiperAction extends StatelessWidget {
  final List<Movie> movies;

  const SwiperAction({Key key, this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (movies.isEmpty) {
      return SizedBox(
        width: double.infinity,
        height: size.height * 0.7,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return SizedBox(
      width: double.infinity,
      height: size.height * 0.7,
      child: Swiper(
        itemBuilder: (_, index) {
          final movie = movies[index];

          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'details_screen', arguments: movie);
            },
            child: Hero(
              tag: movie.id,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: FadeInImage(
                  placeholder: const AssetImage('assets/no-picture.webp'),
                  image: NetworkImage(movie.posterimg),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
        itemCount: movies.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.5,
      ),
    );
  }
}
