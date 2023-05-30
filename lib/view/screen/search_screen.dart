import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/view/screen/detail_screen.dart';

import '../../model/movie_model.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  FocusNode focusNode = FocusNode();
  String searchText = "";
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<MovieModel> movies = [];

  _SearchScreenState() {
    _textEditingController.addListener(() {
      setState(() {
        searchText = _textEditingController.text;
      });
    });
  }

  Future<List<MovieModel>> readData() async {
    var res = await firestore.collection('movie').get();

    if (searchText == "") {
      var result = res.docs
          .map(
            (e) => MovieModel.fromMap(
              Map<String, dynamic>.from(
                e.data(),
              ),
            ),
          )
          .toList();
      movies = result;
      return result;
    } else {
      List<MovieModel> items = [];
      for (var element in res.docs) {
        var item = MovieModel.fromMap(
          Map<String, dynamic>.from(
            element.data(),
          ),
        );
        if (item.toString().contains(searchText)) {
          items.add(item);
        }
      }
      return items;
    }
  }

  @override
  void initState() {
    super.initState();
    readData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const Padding(padding: EdgeInsets.all(30)),
          Container(
            color: Colors.black,
            padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
            child: Row(
              children: [
                Expanded(
                  flex: 6,
                  child: TextField(
                    focusNode: focusNode,
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                    autofocus: false,
                    controller: _textEditingController,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      hintText: "검색",
                      filled: true,
                      fillColor: Colors.white12,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.white60,
                        size: 20,
                      ),
                      suffixIcon: focusNode.hasFocus
                          ? IconButton(
                              onPressed: () {
                                _textEditingController.clear();
                                searchText = "";
                                setState(() {});
                              },
                              icon: const Icon(
                                Icons.cancel,
                                color: Colors.white,
                              ),
                            )
                          : Container(),
                    ),
                  ),
                ),
                focusNode.hasFocus
                    ? Expanded(
                        child: TextButton(
                          onPressed: () {
                            _textEditingController.clear();
                            searchText = "";
                            focusNode.unfocus();
                          },
                          child: const Text(
                            "취소",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    : Expanded(
                        flex: 0,
                        child: Container(),
                      ),
              ],
            ),
          ),
          FutureBuilder(
            future: readData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Expanded(
                  child: GridView.builder(
                    itemCount: snapshot.data!.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1 / 1.5,
                      mainAxisSpacing: 3,
                      crossAxisSpacing: 3,
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                DetailScreen(movie: snapshot.data![index]),
                          ));
                        },
                        child: Image.network(
                          snapshot.data![index].poster,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                );
              }
              return const CircularProgressIndicator();
            },
          ),
        ],
      ),
    );
  }
}
