import 'package:flutter/material.dart';
import 'package:project/app/modules/home/views/profile_view.dart';

typedef void OnTapCallback(int index);

class MyBottomBar extends StatelessWidget {
  final int index;
  final OnTapCallback onTap;

  MyBottomBar({required this.index, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
      onTap: (int newIndex) {
        if (newIndex == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProfileView()),
          );
        } else {
          onTap(newIndex);
        }
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}
