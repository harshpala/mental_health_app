import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental_health_app/res/colors.dart';
import 'package:mental_health_app/screens/root/header.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../util/navigation/navigation_service.dart';
import '../../util/navigation/routes.dart';
import '../root/app_drawer.dart';
import '/globals.dart' as globals;

class HomeScreen extends StatefulWidget {
  final bool isCurrent;

  const HomeScreen({Key? key, required this.isCurrent}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

List<String> models = [
  'Satisfied',
  'The Cross: My Gaze',
  'Yahweh',
  'Onyedikagi',
  'Igwe',
  'Eze'
];

class _HomeScreenState extends State<HomeScreen> {
  List<String> emotions = [
    "assets/icons/01.png",
    "assets/icons/02.png",
    "assets/icons/03.png",
    "assets/icons/04.png",
    "assets/icons/05.png",
  ];
  List<String> selectedemotions = [
    "assets/icons/11.png",
    "assets/icons/12.png",
    "assets/icons/13.png",
    "assets/icons/14.png",
    "assets/icons/15.png",
  ];

  List<String> text = [
    "Playlist to uplift your mood !",
    "Here are some Songs to Enjoy !",
    "Playlist for your jolly mood !",
    "Playlist for your jolly mood !",
    "Playlist for your jolly mood !",
  ];

  List<int> number = [1, 2, 3, 4, 5];
  List<String> trendingAlbums = [
    "assets/png/home/home1.png",
    "assets/png/home/home2.png",
    "assets/png/home/home3.png",
    "assets/png/home/home4.png",
    "assets/png/home/home5.png",
    "assets/png/home/home6.png"
  ];

  final url1 = [
    'https://open.spotify.com/embed/playlist/6nxPNnmSE0d5WlplUsa5L3?utm_source=generator',
    'https://open.spotify.com/embed/playlist/37i9dQZF1DX5Ejj0EkURtP?utm_source=generator&theme=1',
    'https://open.spotify.com/embed/playlist/37i9dQZF1DXdPec7aLTmlC?utm_source=generator',
    'https://open.spotify.com/embed/playlist/37i9dQZF1DXdPec7aLTmlC?utm_source=generator',
    'https://open.spotify.com/embed/playlist/37i9dQZF1DXdPec7aLTmlC?utm_source=generator'
  ];
  final url2 = [
    "https://open.spotify.com/embed/playlist/37i9dQZF1DXbYM3nMM0oPk?utm_source=generator",
    "https://open.spotify.com/embed/playlist/37i9dQZF1DXcRXFNfZr7Tp?utm_source=generator",
    "https://open.spotify.com/embed/playlist/37i9dQZF1DX5IDTimEWoTd?utm_source=generator",
    "https://open.spotify.com/embed/playlist/37i9dQZF1DWWa2DNhcausF?utm_source=generator",
    "https://open.spotify.com/embed/playlist/37i9dQZF1DXbYM3nMM0oPk?utm_source=generator",
  ];
  final url3 = [
  'https://open.spotify.com/embed/playlist/37i9dQZF1DX6ThddIjWuGT?utm_source=generator',
  'https://open.spotify.com/embed/playlist/37i9dQZF1DWU13kKnk03AP?utm_source=generator',
  'https://open.spotify.com/embed/playlist/37i9dQZF1DX9qzRP3WOzKH?utm_source=generator',
  'https://open.spotify.com/embed/playlist/37i9dQZF1DWVIzZt2GAU4X?utm_source=generator',
  'https://open.spotify.com/embed/playlist/37i9dQZF1DX6ThddIjWuGT?utm_source=generator',
  ];

  var repeatPosition = [0, 0, 0, 0, 0];

  InAppWebViewController? webView;
  InAppWebViewGroupOptions settings = InAppWebViewGroupOptions(
      android: AndroidInAppWebViewOptions(
          overScrollMode: AndroidOverScrollMode.OVER_SCROLL_ALWAYS));

  // List<String> trendingSongs = [
  //   "assets/png/home/home4.png",
  //   "assets/png/home/home5.png",
  //   "assets/png/home/home6.png"

  // ];

  int selectedCategoryIndex = 0;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Offstage(
        offstage: !widget.isCurrent,
        child: Scaffold(
            key: scaffoldKey,
            drawer: ClipRRect(
                borderRadius:
                    BorderRadius.horizontal(right: Radius.circular(16.r)),
                child: SizedBox(width: 220.w, child: const AppDrawer())),
            extendBodyBehindAppBar: true,
            body: SafeArea(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.customblue, Colors.white],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(children: [
                  Header(
                    scaffoldkey: scaffoldKey,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: Row(
                      children: [
                        Text(
                          "Hello Tirth,\nHow are you feeling Today ?",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 20.sp,
                                color: AppColors.textColor,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      padding: EdgeInsets.only(
                        top: 8.h,
                      ),
                      children: [
                        SizedBox(
                          height: 38.h,
                          width: double.infinity,
                          child: ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: emotions.length,
                            itemBuilder: (c, i) {
                              return Container(
                                height: 38.h,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  image: DecorationImage(
                                    image: selectedCategoryIndex == i
                                        ? AssetImage(selectedemotions[i])
                                        : AssetImage(emotions[i]),
                                  ),
                                ),
                                // decoration: BoxDecoration(
                                //   color: selectedCategoryIndex == i
                                //       ? const Color(0x66C4C4C4)
                                //       : Colors.transparent,
                                // ),

                                padding:
                                    EdgeInsets.only(left: 18.w, right: 51.w),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                width: 8.w,
                              );
                            },
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomCenter,
                          margin: EdgeInsets.only(
                              left: 10.w, right: 10.w, top: 5.w),
                          padding: EdgeInsets.only(top: 10.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.r),
                            color: const Color.fromARGB(51, 0, 171, 193),
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 38.h,
                                width: double.infinity,
                                child: ListView.separated(
                                  physics: const NeverScrollableScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: emotions.length,
                                  itemBuilder: (c, i) {
                                    return Container(
                                      height: 38.h,
                                      decoration: const BoxDecoration(
                                        color: Colors.transparent,
                                      ),
                                      // decoration: BoxDecoration(
                                      //   color: selectedCategoryIndex == i
                                      //       ? const Color(0x66C4C4C4)
                                      //       : Colors.transparent,
                                      // ),
                                      child: Center(
                                        child: Text(number[i].toString(),
                                            style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                                    fontSize: 18.sp,
                                                    color: AppColors.textColor,
                                                    fontWeight: i ==
                                                            selectedCategoryIndex
                                                        ? FontWeight.w700
                                                        : FontWeight.w500))),
                                      ),
                                      padding: EdgeInsets.only(
                                          left: 18.w, right: 42.w),
                                    );
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return SizedBox(
                                      width: 8.w,
                                    );
                                  },
                                ),
                              ),
                              Slider(
                                thumbColor: AppColors.textColor,
                                activeColor:
                                    const Color.fromARGB(250, 0, 171, 193),
                                inactiveColor:
                                    const Color.fromARGB(250, 0, 171, 193),

                                //label: ,
                                min: 0,
                                max: 4,
                                value: selectedCategoryIndex.toDouble(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedCategoryIndex = value.round();
                                    debugPrint(
                                        "CATEGORY : $selectedCategoryIndex");
                                    changeRepeatPosition();
                                    webView?.loadUrl(
                                        urlRequest:
                                            URLRequest(url: setMusicUrl()));
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        selectedCategoryIndex == 0
                            ? Container(
                                margin: EdgeInsets.only(
                                    left: 50.w, right: 50.w, top: 15.h),
                                // padding: EdgeInsets.symmetric(
                                //   vertical: 20.h,
                                // ),
                                child: TextButton(
                                  style: ButtonStyle(
                                      padding: MaterialStateProperty.all(
                                          EdgeInsets.symmetric(vertical: 20.h)),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                        Colors.red[200],
                                      ),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(16.r),
                                              side: BorderSide(
                                                  color: Colors.red,
                                                  width: 1.5.w)))),
                                  //alignment: Alignment.center,

                                  child: const Text(
                                    'SOS Contact',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                  onPressed: () {},
                                ),
                              )
                            : const SizedBox(),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 18.h,
                            bottom: 15.h,
                            left: 20.w,
                          ),
                          child: Text(
                            text[selectedCategoryIndex],
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 15.sp,
                                color: AppColors.textColor,
                              ),
                            ),
                          ),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(maxHeight: 500.0),
                          child: Container(
                            margin: const EdgeInsets.all(10.0),
                            height: 500,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [AppColors.customblue, Colors.white],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                            child: InAppWebView(
                              initialUrlRequest: URLRequest(url: setMusicUrl()),
                              initialOptions: settings,
                              gestureRecognizers: Set()
                                ..add(
                                  Factory<VerticalDragGestureRecognizer>(
                                    () => VerticalDragGestureRecognizer(),
                                  ), // or null
                                ),
                              onWebViewCreated:
                                  (InAppWebViewController controller) {
                                webView = controller;
                              },
                              onLoadStart: (InAppWebViewController controller,
                                  Uri? url) {},
                              onLoadStop: (InAppWebViewController controller,
                                  Uri? url) async {},
                              onProgressChanged:
                                  (InAppWebViewController controller,
                                      int progress) {},
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   height: 127.r,
                        //   width: double.infinity,
                        //   child: ListView.separated(
                        //     physics: const BouncingScrollPhysics(
                        //         parent: AlwaysScrollableScrollPhysics()),
                        //     scrollDirection: Axis.horizontal,
                        //     itemCount: trendingAlbums.length,
                        //     padding: EdgeInsets.only(
                        //       left: 20.w,
                        //     ),
                        //     itemBuilder: (c, i) {
                        //       return GestureDetector(
                        //         onTap: () {
                        //           globals.i = i + 1;
                        //           globals.title = models[i];
                        //           GetIt.I
                        //               .get<NavigationService>()
                        //               .to(routeName: Routes.playlist);
                        //         },
                        //         child: Container(
                        //           width: 127.r,
                        //           height: 127.r,
                        //           decoration: BoxDecoration(
                        //             borderRadius: BorderRadius.circular(16.r),
                        //             image: DecorationImage(
                        //               image: AssetImage(trendingAlbums[i]),
                        //               fit: BoxFit.cover,
                        //             ),
                        //           ),
                        //         ),
                        //       );
                        //     },
                        //     separatorBuilder:
                        //         (BuildContext context, int index) {
                        //       return SizedBox(
                        //         width: 17.w,
                        //       );
                        //     },
                        //   ),
                        // ),
                        selectedCategoryIndex != 2
                            ? message
                            : Padding(
                                padding: EdgeInsets.only(
                                    top: 18.h,
                                    bottom: 15.h,
                                    left: 20.w,
                                    right: 20.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Write a Page about your day...',
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          fontSize: 15.sp,
                                          color: AppColors.textColor,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(),
                                    Container(
                                      height: 125.h,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 25, vertical: 15),
                                      decoration: BoxDecoration(
                                        color: AppColors.secondary,
                                        borderRadius:
                                            BorderRadius.circular(16.r),
                                      ),
                                      child: TextField(
                                        maxLines: null,
                                        decoration:
                                            const InputDecoration.collapsed(
                                          hintText: 'Type here...',
                                          hintStyle: TextStyle(
                                              color: AppColors.textColor),
                                        ),
                                        style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                            color: AppColors.textColor,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                      ],
                    ),
                  ),
                ]),
              ),
            )));
  }

  void changeRepeatPosition() {
    if (repeatPosition[selectedCategoryIndex] != 2) {
      repeatPosition[selectedCategoryIndex] += 1;
    } else {
      repeatPosition[selectedCategoryIndex] = 0;
    }
  }

  Uri setMusicUrl() {
    final music = [url1, url2, url3];
    final url = music[repeatPosition[selectedCategoryIndex]];
    return Uri.dataFromString(''' <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Music app</title>
</head>
<body style="background:none #0000000;">
    <iframe style="border-radius:12px" src=${url[selectedCategoryIndex]} width="100%" height="1000" frameBorder="0" allowfullscreen="" allowtransparency="true" allow="autoplay; clipboard-write; encrypted-media; fullscreen; picture-in-picture" loading="lazy"></iframe>
</body>
</html>''', mimeType: 'text/html', encoding: Encoding.getByName('utf-8'));
  }
}

var message = Padding(
  padding: EdgeInsets.only(top: 18.h, bottom: 15.h, left: 20.w, right: 20.w),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Thought of the day',
        style: GoogleFonts.poppins(
          textStyle: TextStyle(
            fontSize: 15.sp,
            color: AppColors.textColor,
          ),
        ),
      ),
      const SizedBox(),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color.fromRGBO(49, 147, 179, 1),
              Color.fromRGBO(85, 196, 218, 1)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Text(
          '" You dont have to control your thoughts. You just have to stop letting them control you. "',
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      )
    ],
  ),
);
