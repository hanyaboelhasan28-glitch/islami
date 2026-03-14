import 'package:flutter/material.dart';
import 'package:islami/core/constants/assets.dart';
import 'package:islami/core/constants/colors.dart';
import 'package:islami/features/radio/screens/radio_screen.dart';
import 'package:islami/features/tasbeeh/screens/tasbeeh_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 2; // Default to Tasbeeh

  final List<Widget> _screens = [
    const Center(child: Text('Quran', style: TextStyle(color: Colors.white, fontSize: 30))),
    const Center(child: Text('Hadith', style: TextStyle(color: Colors.white, fontSize: 30))),
    const TasbeehScreen(),
    const RadioScreen(),
    const Center(child: Text('Time', style: TextStyle(color: Colors.white, fontSize: 30))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.primary,
        selectedItemColor: AppColors.white,
        unselectedItemColor: AppColors.black,
        showUnselectedLabels: false,
        selectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
        items: [
          _buildBottomNavItem('assets/icons/quran.png', 'Quran', 0),
          _buildBottomNavItem('assets/icons/hadith.png', 'Hadith', 1),
          _buildBottomNavItem(AppAssets.sebhaIcon, 'Tasbeeh', 2),
          _buildBottomNavItem(AppAssets.radioIcon, 'Radio', 3),
          _buildBottomNavItem('assets/icons/time.png', 'Time', 4),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavItem(String iconPath, String label, int index) {
    bool isSelected = _selectedIndex == index;
    return BottomNavigationBarItem(
      icon: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.black.withOpacity(0.6) : Colors.transparent,
          borderRadius: BorderRadius.circular(66),
        ),
        child: ImageIcon(
          AssetImage(iconPath),
          size: 26,
        ),
      ),
      label: label,
    );
  }
}
