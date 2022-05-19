import 'package:flutter/material.dart';

import '../../clases/movie.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context).settings.arguments as Movie;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(movie),
          SliverList(
              delegate: SliverChildListDelegate([
            _ImagePosterName(movie),
            _DescripcionMovie(movie),
            _DescripcionMovie(movie),
            _DescripcionMovie(movie),
            _DescripcionMovie(movie),
          ]))
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  final Movie movie;
  const _CustomAppBar(this.movie);

  @override
  Widget build(Object context) {
    return SliverAppBar(
      backgroundColor: Colors.black,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          height: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          padding: const EdgeInsets.all(10),
          child: Text(
            movie.title,
            style: const TextStyle(fontSize: 16),
          ),
        ),
        background: FadeInImage(
          placeholder: const AssetImage('assets/no-picture.webp'),
          image: NetworkImage(movie.backdroppathimg),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _ImagePosterName extends StatelessWidget {
  final Movie movie;

  const _ImagePosterName(this.movie);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Hero(
            tag: movie.id,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  placeholder: const AssetImage('assets/no-picture.webp'),
                  image: NetworkImage(movie.posterimg),
                  height: 150,
                )),
          ),
          const SizedBox(width: 20),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: size.width - 200),
            child: Column(
              children: [
                Text(
                  movie.title,
                  style: Theme.of(context).textTheme.headline5,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
                Text(
                  movie.originalTitle,
                  style: Theme.of(context).textTheme.subtitle1,
                  overflow: TextOverflow.fade,
                  maxLines: 2,
                ),
                Row(
                  children: [
                    const Icon(Icons.star, size: 25, color: Colors.yellow),
                    const SizedBox(
                      width: 5,
                    ),
                    Text('${movie.voteAverage}',
                        style: Theme.of(context).textTheme.caption)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _DescripcionMovie extends StatelessWidget {
  final Movie movie;

  const _DescripcionMovie(this.movie);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        movie.overview,
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}
