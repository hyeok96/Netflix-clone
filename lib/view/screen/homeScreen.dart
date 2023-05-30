import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/model/movie_model.dart';
import 'package:netflix_clone/view/widget/box_slider.dart';
import 'package:netflix_clone/view/widget/carousel_slider.dart';
import 'package:netflix_clone/view/widget/circle_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  // late List<MovieModel> movies;

  // List<MovieModel> movies = [];

  Future<List<MovieModel>> readData() async {
    var res = await firestore.collection('movie').get();
    var result = res.docs
        .map(
          (e) => MovieModel.fromMap(
            Map<String, dynamic>.from(
              e.data(),
            ),
          ),
        )
        .toList();
    return result;
  }

  @override
  void initState() {
    super.initState();
    readData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: readData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView(
            children: [
              Stack(
                children: [
                  CarouselSliderWidget(
                    movies: snapshot.data!,
                    firestore: firestore,
                  ),
                  const TapBar(),
                ],
              ),
              CircleSlider(
                movies: snapshot.data!,
              ),
              BoxSlider(
                movies: snapshot.data!,
              ),
            ],
          );
        }
        return const CircularProgressIndicator();
      },
    );
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
