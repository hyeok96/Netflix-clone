import 'package:flutter/material.dart';
import 'package:netflix_clone/view/screen/homeScreen.dart';
import 'package:netflix_clone/view/screen/more_screen.dart';
import 'package:netflix_clone/view/screen/search_screen.dart';

import '../widget/BottomBar.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  late TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            const HomeScreen(),
            const SearchScreen(),
            Container(
              child: const Center(
                child: Text("save"),
              ),
            ),
            const MoreScreen(),
          ],
        ),
        bottomNavigationBar: const BottomBar(),
      ),
    );
  }
}
