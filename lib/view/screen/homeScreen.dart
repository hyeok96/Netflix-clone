import 'package:flutter/material.dart';
import 'package:netflix_clone/model/movie_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<MovieModel> movies = [
    MovieModel.fromMap({
      'title': "사랑의 불시착",
      "keyword": '사랑/판타지/로맨스',
      "poster": 'test_movie_1.png',
      'like': false
    })
  ];

  @override
  Widget build(BuildContext context) {
    return const TapBar();
  }
}

class TapBar extends StatelessWidget {
  const TapBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 7,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/images/bbongflix_logo.png',
            fit: BoxFit.contain,
            height: 25,
          ),
          Container(
            padding: const EdgeInsets.only(right: 1),
            child: const Text(
              'TV',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(right: 1),
            child: const Text(
              '영화',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(right: 1),
            child: const Text(
              '내가 찜한 콘텐츠',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
