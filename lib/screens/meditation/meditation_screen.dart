import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental_health_app/models/user_model.dart';
import 'package:mental_health_app/res/assets.dart';
import 'package:mental_health_app/screens/meditation/journal_page.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../res/colors.dart';
import '../root/bottom_nav.dart';
import '../root/header.dart';
import '../root/app_drawer.dart';
import '/globals.dart' as globals;

class MeditationScreen extends StatefulWidget {
  const MeditationScreen({
    Key? key,
  }) : super(key: key);

  @override
  _MeditationScreenState createState() => _MeditationScreenState();
}

class _MeditationScreenState extends State<MeditationScreen> {
  late List<YoutubePlayerController> _ytcontroller = [];
  void initState() {
    final videoID0 = YoutubePlayer.convertUrlToId(videoURL[0]);
    final videoID1 = YoutubePlayer.convertUrlToId(videoURL[1]);
    final videoID2 = YoutubePlayer.convertUrlToId(videoURL[2]);
    final videoID3 = YoutubePlayer.convertUrlToId(videoURL[3]);

    _ytcontroller = [
      YoutubePlayerController(
          initialVideoId: videoID0!,
          flags: const YoutubePlayerFlags(
            autoPlay: false,
          )),
      YoutubePlayerController(
          initialVideoId: videoID1!,
          flags: const YoutubePlayerFlags(
            autoPlay: false,
          )),
      YoutubePlayerController(
          initialVideoId: videoID2!,
          flags: const YoutubePlayerFlags(
            autoPlay: false,
          )),
      YoutubePlayerController(
          initialVideoId: videoID3!,
          flags: const YoutubePlayerFlags(
            autoPlay: false,
          ))
    ];
  }

  final videoURL = [
    "https://www.youtube.com/watch?v=O-6f5wQXSu8&t=1s&ab_channel=Goodful",
    "https://www.youtube.com/watch?v=j7d5Plai03g&ab_channel=Goodful",
    "https://www.youtube.com/watch?v=xRxT9cOKiM8&ab_channel=Goodful",
    "https://www.youtube.com/watch?v=2FGR-OspxsU&ab_channel=Goodful",
  ];

  // List<String> trendingSongs = [
  //   "assets/png/home/home4.png",
  //   "assets/png/home/home5.png",
  //   "assets/png/home/home6.png"

  // ];

  final scaffoldKey = GlobalKey<ScaffoldState>();

  // Tabs _currentTab = Tabs.meditation;
  // void _selectTab(Tabs tab) {
  //   setState(() {
  //     _currentTab = tab;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getUserDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              UserModel userData = snapshot.data as UserModel;
              globals.name = userData.name;
              globals.doc_id = userData.id;
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                  ),
                  Expanded(
                    child: ListView(
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      padding: EdgeInsets.only(
                        top: 8.h,
                      ),
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            left: 10.w,
                            right: 10.w,
                          ),
                          padding: EdgeInsets.only(top: 10.w),
                          child: Stack(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(16.r),
                                  child: Image.asset(Assets.MEDITATE)),
                              Positioned.fill(
                                  child: Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: EdgeInsets.only(right: 20.w),
                                  child: Text(
                                    "Meditation",
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontSize: 25.sp,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ))
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 18.h,
                            bottom: 15.h,
                            left: 20.w,
                          ),
                          child: Text(
                            "Categories",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 20.sp,
                                  color: AppColors.textColor,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 170.r,
                          width: double.infinity,
                          child: ListView.separated(
                            physics: const BouncingScrollPhysics(
                                parent: AlwaysScrollableScrollPhysics()),
                            scrollDirection: Axis.horizontal,
                            itemCount: videoURL.length,
                            padding: EdgeInsets.only(
                              left: 20.w,
                            ),
                            itemBuilder: (c, i) {
                              return Container(
                                width: 300.r,
                                height: 170.r,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.r),
                                ),
                                child: YoutubePlayer(
                                  controller: _ytcontroller[i],
                                  showVideoProgressIndicator: true,
                                  bottomActions: [
                                    CurrentPosition(),
                                    ProgressBar(
                                      isExpanded: true,
                                      colors: const ProgressBarColors(
                                          playedColor: AppColors.textColor,
                                          handleColor: Colors.white),
                                    ),
                                  ],
                                ),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                width: 17.w,
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 18.h, bottom: 15.h, left: 20.w, right: 20.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Write your journal today',
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontSize: 15.sp,
                                    color: AppColors.textColor,
                                  ),
                                ),
                              ),
                              const SizedBox(),
                              OpenContainer(
                                openElevation: 1.5,
                                closedShape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16.r)),
                                ),
                                openShape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16.r)),
                                ),
                                transitionType: ContainerTransitionType.fade,
                                transitionDuration:
                                    const Duration(milliseconds: 1250),
                                closedBuilder: (BuildContext context,
                                        void Function() action) =>
                                    Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25, vertical: 15),
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
                                    globals.journal,
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                openBuilder: (BuildContext context,
                                        void Function({Object returnValue})
                                            action) =>
                                    JournalPage(
                                  journal: globals.journal,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else {
              return const Center(
                child: Text('Something went wrong'),
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
