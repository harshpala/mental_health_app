import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mental_health_app/globals.dart';
import 'package:mental_health_app/res/colors.dart';
import 'package:mental_health_app/screens/auth/welcome_screen.dart';
import 'package:mental_health_app/screens/meditation/meditation_screen.dart';
import 'package:mental_health_app/screens/playlist/playlist_screen.dart';
import 'package:mental_health_app/screens/profile/profile_screen.dart';
import 'package:mental_health_app/screens/root/bottom_nav.dart';
import 'package:mental_health_app/screens/home/home_screen.dart';

import '../auth/auth_screen.dart';

class RootWidget extends StatefulWidget {
  const RootWidget({Key? key}) : super(key: key);

  @override
  _RootWidgetState createState() => _RootWidgetState();
}

class _RootWidgetState extends State<RootWidget> {
  Tabs currentTab = Tabs.home;

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
              body: Stack(
                // fit: StackFit.expand,
                children: [
                  ProfileScreen(
                    isCurrent: currentTab == Tabs.profile,
                    key: Key(Tabs.profile.name),
                  ),
                  MeditationScreen(
                    isCurrent: currentTab == Tabs.meditation,
                    key: Key(Tabs.meditation.name),
                  ),
                  HomeScreen(
                    isCurrent: currentTab == Tabs.home,
                    key: Key(Tabs.home.name),
                  ),
                  PlayListScreen(
                    isCurrent: currentTab == Tabs.Album,
                    key: Key(Tabs.Album.name),
                  ),
                ],
              ),
              bottomNavigationBar: BottomNav(
                currentTab: currentTab,
                didSelectTab: (tab) {
                  setState(() {
                    currentTab = tab;
                  });
                },
              ),
            );
          } else {
            return const WelcomeScreen();
          }
        });
  }
}
