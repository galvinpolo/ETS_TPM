import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Beranda"),
        BottomNavigationBarItem(icon: Icon(Icons.group), label: "Anggota"),
        BottomNavigationBarItem(icon: Icon(Icons.logout), label: "Logout"),
      ],
    );
  }
}
