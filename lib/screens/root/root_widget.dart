import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mental_health_app/res/colors.dart';
import 'package:mental_health_app/screens/auth/welcome_screen.dart';
import 'package:mental_health_app/screens/meditation/meditation_screen.dart';
import 'package:mental_health_app/screens/playlist/playlist_screen.dart';
import 'package:mental_health_app/screens/profile/profile_screen.dart';
import 'package:mental_health_app/screens/root/bottom_nav.dart';
import 'package:mental_health_app/screens/home/home_screen.dart';
import 'package:mental_health_app/screens/Habit_Tracker/habit_tracker.dart';
import 'app_drawer.dart';
import 'header.dart';

class RootWidget extends StatefulWidget {
  const RootWidget({Key? key}) : super(key: key);

  @override
  _RootWidgetState createState() => _RootWidgetState();
}

class _RootWidgetState extends State<RootWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final List<StatefulWidget> Screens = [
    const ProfileScreen(),
    const MeditationScreen(),
    const HomeScreen(),
    const PlayListScreen(),
    const HabitTrackerScreen()
  ];
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.textColor),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text(
                "Something went wrong! :(",
                style: TextStyle(color: AppColors.textColor),
              ),
            );
          } else if (snapshot.hasData) {
            return Scaffold(
                key: scaffoldKey,
                extendBodyBehindAppBar: false,
                drawer: ClipRRect(
                    borderRadius:
                        BorderRadius.horizontal(right: Radius.circular(16.r)),
                    child: SizedBox(
                        width: 220.w,
                        child: AppDrawer(
                          selectedIndex: _selectedIndex,
                          onItemTapped: _onItemTapped,
                        ))),
                body: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [AppColors.customblue, Colors.white],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Column(
                    children: [
                      Header(scaffoldkey: scaffoldKey),
                      Expanded(child: Screens[_selectedIndex]),
                    ],
                  ),
                ),
                bottomNavigationBar: bottomNav(
                  selectedIndex: _selectedIndex,
                  onItemTapped: _onItemTapped,
                ));
          } else {
            return const WelcomeScreen();
          }
        });
  }
}
