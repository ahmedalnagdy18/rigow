import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final String userImage;

  const BottomNavigationBarWidget({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.userImage,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: true,
      showUnselectedLabels: true,
      currentIndex: currentIndex,
      selectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 11,
      ),
      selectedFontSize: 11,
      unselectedFontSize: 10,
      unselectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 10,
      ),
      onTap: onTap,
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.black,
      backgroundColor: Colors.white,
      items: [
        BottomNavigationBarItem(
          backgroundColor: Colors.white,
          icon: Container(
            height: 24,
            width: 24,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            clipBehavior: Clip.antiAlias,
            child: Image.network(
              userImage,
              fit: BoxFit.cover,
            ),
          ),
          label: 'Profile',
        ),
        const BottomNavigationBarItem(
          backgroundColor: Colors.white,
          icon: Icon(Icons.people_outline_sharp),
          label: 'Rooms',
        ),
        const BottomNavigationBarItem(
          backgroundColor: Colors.white,
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        const BottomNavigationBarItem(
          backgroundColor: Colors.white,
          icon: Icon(Icons.video_library_outlined),
          label: 'Reels',
        ),
        const BottomNavigationBarItem(
          backgroundColor: Colors.white,
          icon: Icon(Icons.shopping_bag_outlined),
          label: 'Offers',
        ),
      ],
    );
  }
}
