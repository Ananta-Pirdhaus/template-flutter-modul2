import 'package:flutter/material.dart';

class MyTabBar extends StatelessWidget {
  final List<List<dynamic>> tabOptions; // [ ["Recent", Widget] ]
  MyTabBar({
    Key? key,
    required this.tabOptions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          unselectedLabelStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelColor: Colors.grey,
          labelStyle: TextStyle(
            fontSize: 27,
          ),
          labelColor: Colors.blue,
          // Tambahkan baris ini
          tabs: [
            Tab(
              child: Text(
                tabOptions[0][0],
              ),
            ),
            Tab(
              child: Text(
                tabOptions[1][0],
              ),
            ),
            Tab(
              child: Text(
                tabOptions[2][0],
              ),
            ),
          ],
        ),
        Expanded(
          child: TabBarView(
            children: [
              tabOptions[0][1],
              tabOptions[1][1],
              tabOptions[2][1],
            ],
          ),
        )
      ],
    );
  }
}
