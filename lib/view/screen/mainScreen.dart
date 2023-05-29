import 'package:flutter/material.dart';
import 'package:netflix_clone/view/screen/homeScreen.dart';

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
            Container(
              child: const Center(
                child: Text("search"),
              ),
            ),
            Container(
              child: const Center(
                child: Text("save"),
              ),
            ),
            Container(
              child: const Center(
                child: Text("list"),
              ),
            ),
          ],
        ),
        bottomNavigationBar: const BottomBar(),
      ),
    );
  }
}
