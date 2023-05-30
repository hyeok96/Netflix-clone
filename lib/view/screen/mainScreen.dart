import 'package:flutter/material.dart';
import 'package:netflix_clone/view/screen/homeScreen.dart';
import 'package:netflix_clone/view/screen/like_screen.dart';
import 'package:netflix_clone/view/screen/more_screen.dart';
import 'package:netflix_clone/view/screen/search_screen.dart';

import '../widget/BottomBar.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  late TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 4,
      child: Scaffold(
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            HomeScreen(),
            SearchScreen(),
            LikeScreen(),
            MoreScreen(),
          ],
        ),
        bottomNavigationBar: BottomBar(),
      ),
    );
  }
}
