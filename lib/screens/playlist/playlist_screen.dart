import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mental_health_app/models/album_model.dart';
import '../root/bottom_nav.dart';
import '../root/header.dart';
import '../root/app_drawer.dart';
import '/globals.dart' as globals;
import '../../res/colors.dart';

class PlayListScreen extends StatefulWidget {
  const PlayListScreen({
    Key? key,
  }) : super(key: key);

  @override
  _PlayListScreenState createState() => _PlayListScreenState();
}

class _PlayListScreenState extends State<PlayListScreen> {
  var repeatPosition = [0, 0, 0, 0, 0];

  InAppWebViewController? webView;
  InAppWebViewGroupOptions settings = InAppWebViewGroupOptions(
      android: AndroidInAppWebViewOptions(
          overScrollMode: AndroidOverScrollMode.OVER_SCROLL_ALWAYS));
  List<AlbumModel> models = [
    AlbumModel(
      id: 1,
      image: "assets/png/home/home1.png",
      title: 'Satisfied',
      artist: 'Mercy Chinwo',
      year: '2021',
      download: 1,
      plays: 2,
      songs: 2,
      genre: "",
      like: 2,
    ),
    AlbumModel(
      id: 2,
      image: "assets/png/home/home2.png",
      title: 'The Cross: My Gaze',
      artist: 'Mercy Chinwo',
      year: '2021',
      download: 1,
      plays: 2,
      songs: 2,
      genre: "",
      like: 2,
    ),
    AlbumModel(
      id: 3,
      image: "assets/png/home/home3.png",
      title: 'Yahweh',
      artist: 'Mercy Chinwo',
      year: '2021',
      download: 1,
      plays: 2,
      songs: 2,
      genre: "",
      like: 2,
    ),
    AlbumModel(
      id: 4,
      image: "assets/png/home/home4.png",
      title: 'Onyedikagi',
      artist: 'Mercy Chinwo',
      year: '2021',
      download: 1,
      plays: 2,
      songs: 2,
      genre: "",
      like: 2,
    ),
    AlbumModel(
      id: 5,
      image: "assets/png/home/home5.png",
      title: 'Igwe',
      artist: 'Mercy Chinwo',
      year: '2021',
      download: 1,
      plays: 2,
      songs: 2,
      genre: "",
      like: 2,
    ),
    AlbumModel(
      id: 6,
      image: "assets/png/home/home6.png",
      title: 'Eze',
      artist: 'Mercy Chinwo',
      year: '2021',
      download: 1,
      plays: 2,
      songs: 2,
      genre: "",
      like: 2,
    )
  ];

  final scaffoldKey = GlobalKey<ScaffoldState>();

  // Tabs _currentTab = Tabs.album;
  // void _selectTab(Tabs tab) {
  //   setState(() {
  //     _currentTab = tab;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    Uri setMusicUrl() {
      final music = [globals.url1, globals.url2, globals.url3];
      final url = music[repeatPosition[globals.selectedCategoryIndex]];
      return Uri.dataFromString(''' <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Music app</title>
</head>
<body style="background:none #0000000;">
    <iframe style="border-radius:12px" src=${url[globals.selectedCategoryIndex]} width="100%" height="1000" frameBorder="0" allowfullscreen="" allowtransparency="true" allow="autoplay; clipboard-write; encrypted-media; fullscreen; picture-in-picture" loading="lazy"></iframe>
</body>
</html>''', mimeType: 'text/html', encoding: Encoding.getByName('utf-8'));
    }

    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.75,
      child: InAppWebView(
        initialUrlRequest: URLRequest(url: setMusicUrl()),
        initialOptions: settings,
        gestureRecognizers: Set()
          ..add(
            Factory<VerticalDragGestureRecognizer>(
              () => VerticalDragGestureRecognizer(),
            ), // or null
          ),
        onWebViewCreated: (InAppWebViewController controller) {
          webView = controller;
        },
        onLoadStart: (InAppWebViewController controller, Uri? url) {},
        onLoadStop: (InAppWebViewController controller, Uri? url) async {},
        onProgressChanged: (InAppWebViewController controller, int progress) {},
      ),
    );
  }
}
