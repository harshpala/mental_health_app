// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter/material.dart';
import 'package:mental_health_app/globals.dart';
import 'package:mental_health_app/screens/auth/auth_screen.dart';
import 'package:mental_health_app/screens/playlist/playing_now_screen.dart';
import 'package:mental_health_app/screens/playlist/playlist_screen.dart';
import 'package:mental_health_app/screens/playlist/album_screen.dart';
import 'package:mental_health_app/screens/root/root_widget.dart';
import 'package:mental_health_app/screens/search_result/search_result_screen.dart';
import 'package:mental_health_app/screens/splashscreen/splash_screen.dart';

import 'fade_route.dart';
import 'routes.dart';

class ScreenRouter {
  // static const String root = '/';
  // static const String login = '/login';
  // static const String home = '/home';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initial:
        return FadeRoute(
          page: const SplashScreen(),
        );

      case Routes.home:
        return FadeRoute(
          page: const RootWidget(),
        );

      case Routes.searchResult:
        return FadeRoute(
          page: const SearchResultScreen(),
        );

      case Routes.playlist:
        return FadeRoute(
          page: const AlbumScreen(
            isCurrent: true,
          ),
        );
      case Routes.playingNow:
        return FadeRoute(
          page: const PlayingNowScreen(),
        );
      case Routes.album:
        return FadeRoute(
          page: const PlayListScreen(
            isCurrent: true,
          ),
        );
      // case Routes.home:
      //   return FadeRoute(
      //     page: const RootWidget(),
      //   );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
              body:
                  Center(child: Text('No route defined for ${settings.name}'))),
        );
    }
  }
}
