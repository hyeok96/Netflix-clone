import 'package:flutter/material.dart';
import 'package:netflix_clone/model/movie_model.dart';

import '../screen/detail_screen.dart';

class CircleSlider extends StatelessWidget {
  const CircleSlider({
    super.key,
    required this.movies,
  });
  final List<MovieModel> movies;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("미리보기"),
          SizedBox(
            height: 120,
            child: ListView(
                scrollDirection: Axis.horizontal,
                children: makeCircleImages(context, movies)),
          )
        ],
      ),
    );
  }
}

List<Widget> makeCircleImages(BuildContext context, List<MovieModel> movies) {
  List<Widget> results = [];
  for (var i = 0; i < movies.length; i++) {
    results.add(
      InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              fullscreenDialog: true,
              builder: (context) => DetailScreen(movie: movies[i]),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.only(right: 10),
          child: Align(
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/images/${movies[i].poster}"),
              radius: 48,
            ),
          ),
        ),
      ),
    );
  }
  return results;
}