import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: const SizedBox(
        height: 70,
        child: TabBar(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white60,
          indicatorColor: Colors.transparent,
          tabs: [
            Tab(
              icon: Icon(
                Icons.home,
                size: 22,
              ),
              child: Text(
                "홈",
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
            ),
            Tab(
              icon: Icon(
                Icons.search,
                size: 22,
              ),
              child: Text(
                "검색",
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
            ),
            Tab(
              icon: Icon(
                Icons.save_alt,
                size: 22,
              ),
              child: Text(
                "저장한 건텐츠 목록",
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
            ),
            Tab(
              icon: Icon(
                Icons.list,
                size: 22,
              ),
              child: Text(
                "더보기",
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
