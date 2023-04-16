import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mental_health_app/res/assets.dart';
import 'package:mental_health_app/res/colors.dart';

enum Tabs { profile, meditation, home, album, tracker }

extension TabExt on Tabs {
  String get name {
    switch (this) {
      case Tabs.profile:
        return "Profile";
      case Tabs.meditation:
        return "Meditation";
      case Tabs.home:
        return "Home";
      case Tabs.album:
        return "Album";
      case Tabs.tracker:
        return "Tracker";
      default:
        return "";
    }
  }

  String get selectedIcon {
    switch (this) {
      case Tabs.profile:
        return Assets.PROFILE_SELECTED_TAB;
      case Tabs.meditation:
        return Assets.MED_SELECTED_TAB;
      case Tabs.home:
        return Assets.HOME_SELECTED_TAB;
      case Tabs.album:
        return Assets.PLAYLIST_SELECTED_TAB;
      case Tabs.tracker:
        return Assets.TRACKER_SELECTED_TAB;
      default:
        return "";
    }
  }

  String get unSelectedIcon {
    switch (this) {
      case Tabs.profile:
        return Assets.PROFILE_UNSELECTED_TAB;
      case Tabs.meditation:
        return Assets.MED_UNSELECTED_TAB;
      case Tabs.home:
        return Assets.HOME_UNSELECTED_TAB;
      case Tabs.album:
        return Assets.PLAYLIST_UNSELECTED_TAB;
      case Tabs.tracker:
        return Assets.TRACKER_UNSELECTED_TAB;
      default:
        return "";
    }
  }
}

class BottomNav extends StatelessWidget {
  final Tabs currentTab;
  final ValueChanged<Tabs> didSelectTab;
  const BottomNav({
    Key? key,
    required this.currentTab,
    required this.didSelectTab,
  }) : super(key: key);

  void selectTab(Tabs tab) {
    didSelectTab(tab);
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r)),
      child: BottomNavigationBar(
          elevation: 0,
          unselectedLabelStyle: const TextStyle(
              fontSize: 1, fontWeight: FontWeight.w600, height: 1),
          selectedLabelStyle: const TextStyle(
              fontSize: 11, fontWeight: FontWeight.w600, height: 1),
          backgroundColor: AppColors.secondary,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            didSelectTab(Tabs.values.toList()[index]);
          },
          items: Tabs.values.map((tab) => _buildItem(tab, context)).toList()),
    );
  }

  BottomNavigationBarItem _buildItem(Tabs tab, BuildContext context) {
    return BottomNavigationBarItem(
      icon: Image.asset(
          currentTab == tab ? tab.selectedIcon : tab.unSelectedIcon,
          height: 60.h),
      label: tab.name,
    );
  }
}
