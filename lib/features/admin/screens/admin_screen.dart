import 'package:amazon_clone/constrains/global_variables.dart';
import 'package:amazon_clone/features/admin/screens/post_screen.dart';

import 'package:flutter/material.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 8;

  List<Widget> pages = [
    const PostScreen(),
    const Center(
      child: Text("Analytics Page"),
    ),
    const Center(
      child: Text("Cart Page"),
    ),
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Image(
                    image: AssetImage(
                      'assets/images/amazon_in.png',
                    ),
                    width: 160,
                    color: Colors.black,
                  ),
                ),
                const Text(
                  'Admin',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ),
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _page,
          selectedItemColor: GlobalVariables.selectedNavBarColor,
          unselectedItemColor: GlobalVariables.unselectedNavBarColor,
          backgroundColor: GlobalVariables.backgroundColor,
          iconSize: 28,
          onTap: updatePage,
          items: [
            //Home Page
            BottomNavigationBarItem(
                icon: Container(
                  width: bottomBarWidth,
                  decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            width: bottomBarBorderWidth,
                            color: _page == 0
                                ? GlobalVariables.selectedNavBarColor
                                : GlobalVariables.backgroundColor)),
                  ),
                  child: const Icon(Icons.home_outlined),
                ),
                label: ''),

            //Analytics

            BottomNavigationBarItem(
                icon: Container(
                  width: bottomBarWidth,
                  decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            width: bottomBarBorderWidth,
                            color: _page == 1
                                ? GlobalVariables.selectedNavBarColor
                                : GlobalVariables.backgroundColor)),
                  ),
                  child: const Icon(Icons.analytics_outlined),
                ),
                label: ''),

            //Orders

            BottomNavigationBarItem(
                icon: Container(
                  width: bottomBarWidth,
                  decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            width: bottomBarBorderWidth,
                            color: _page == 2
                                ? GlobalVariables.selectedNavBarColor
                                : GlobalVariables.backgroundColor)),
                  ),
                  child: const Icon(Icons.all_inbox_outlined),
                ),
                label: '')
          ]),
    );
  }
}
