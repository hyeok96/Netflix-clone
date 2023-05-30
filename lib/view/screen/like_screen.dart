import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/view/screen/detail_screen.dart';

import '../../model/movie_model.dart';

class LikeScreen extends StatefulWidget {
  const LikeScreen({super.key});

  @override
  State<LikeScreen> createState() => _LikeScreenState();
}

class _LikeScreenState extends State<LikeScreen> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List<MovieModel>> readData() async {
    var res = await firestore
        .collection('movie')
        .where('like', isEqualTo: true)
        .get();
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: readData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              itemCount: snapshot.data!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 3,
                crossAxisSpacing: 3,
                childAspectRatio: 1 / 1.5,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailScreen(movie: snapshot.data![index]),
                      ),
                    );
                  },
                  child: Image.network(
                    snapshot.data![index].poster,
                    fit: BoxFit.cover,
                  ),
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
