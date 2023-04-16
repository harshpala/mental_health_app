import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mental_health_app/res/assets.dart';
import 'package:mental_health_app/res/colors.dart';

class bottomNav extends StatelessWidget {
  final selectedIndex;
  final Function(int) onItemTapped;
  bottomNav({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  List<String> selectedIcon = [
    Assets.PROFILE_SELECTED_TAB,
    Assets.MED_SELECTED_TAB,
    Assets.HOME_SELECTED_TAB,
    Assets.PLAYLIST_SELECTED_TAB,
    Assets.TRACKER_SELECTED_TAB,
  ];
  List<String> unSelectedIcon = [
    Assets.PROFILE_UNSELECTED_TAB,
    Assets.MED_UNSELECTED_TAB,
    Assets.HOME_UNSELECTED_TAB,
    Assets.PLAYLIST_UNSELECTED_TAB,
    Assets.TRACKER_UNSELECTED_TAB,
  ];

  List<String> label_name = [
    "Profile",
    "Meditation",
    "Home",
    "Album",
    "Tracker",
  ];
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r)),
      child: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(
              selectedIndex == 0
                  ? selectedIcon[selectedIndex]
                  : unSelectedIcon[0],
              height: 60.h,
            ),
            label: label_name[0],
          ),
          BottomNavigationBarItem(
              icon: Image.asset(
                selectedIndex == 1
                    ? selectedIcon[selectedIndex]
                    : unSelectedIcon[1],
                height: 60.h,
              ),
              label: label_name[1]),
          BottomNavigationBarItem(
              icon: Image.asset(
                selectedIndex == 2
                    ? selectedIcon[selectedIndex]
                    : unSelectedIcon[2],
                height: 60.h,
              ),
              label: label_name[2]),
          BottomNavigationBarItem(
              icon: Image.asset(
                selectedIndex == 3
                    ? selectedIcon[selectedIndex]
                    : unSelectedIcon[3],
                height: 60.h,
              ),
              label: label_name[3]),
          BottomNavigationBarItem(
              icon: Image.asset(
                selectedIndex == 4
                    ? selectedIcon[selectedIndex]
                    : unSelectedIcon[4],
                height: 60.h,
              ),
              label: label_name[4]),
        ],
        currentIndex: selectedIndex,
        onTap: onItemTapped,
        elevation: 0,
        unselectedLabelStyle: const TextStyle(
            fontSize: 1, fontWeight: FontWeight.w600, height: 1),
        selectedLabelStyle: const TextStyle(
            fontSize: 11, fontWeight: FontWeight.w600, height: 1),
        backgroundColor: AppColors.secondary,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
