import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental_health_app/res/assets.dart';
import '../../res/colors.dart';
import '../root/header.dart';
import '../root/app_drawer.dart';
import '/globals.dart' as globals;

class MeditationScreen extends StatefulWidget {
  final bool isCurrent;

  const MeditationScreen({Key? key, required this.isCurrent}) : super(key: key);

  @override
  _MeditationScreenState createState() => _MeditationScreenState();
}

class _MeditationScreenState extends State<MeditationScreen> {
  List<String> trendingAlbums = [
    "assets/png/home/home6.png",
    "assets/png/home/home5.png",
    "assets/png/home/home4.png",
    "assets/png/home/home3.png",
    "assets/png/home/home2.png",
    "assets/png/home/home1.png"
  ];

  // List<String> trendingSongs = [
  //   "assets/png/home/home4.png",
  //   "assets/png/home/home5.png",
  //   "assets/png/home/home6.png"

  // ];

  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Offstage(
      offstage: !widget.isCurrent,
      child: Scaffold(
        key: scaffoldKey,
        drawer: ClipRRect(
            borderRadius: BorderRadius.horizontal(right: Radius.circular(16.r)),
            child: SizedBox(width: 220.w, child: const AppDrawer())),
        extendBodyBehindAppBar: true,
        //appBar: AppBar(
        //  title: Image.asset(Assets.MORNING, fit: BoxFit.fill),
        // Text(
        //   "DISCOVER",
        //   style: GoogleFonts.montserrat(
        //     textStyle: TextStyle(
        //       fontSize: 26.sp,
        //       color: Colors.white,
        //       fontStyle: FontStyle.normal,
        //       fontWeight: FontWeight.w600,
        //     ),
        //   ),
        // ),
        // automaticallyImplyLeading: false,
        // centerTitle: false,
        //backgroundColor: Colors.black,
        //elevation: 0,
        // ),
        body: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.customblue, Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              children: [
                Header(
                  scaffoldkey: scaffoldKey,
                ),
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
                        height: 127.r,
                        width: double.infinity,
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          scrollDirection: Axis.horizontal,
                          itemCount: trendingAlbums.length,
                          padding: EdgeInsets.only(
                            left: 20.w,
                          ),
                          itemBuilder: (c, i) {
                            return Container(
                              width: 127.r,
                              height: 127.r,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.r),
                                image: DecorationImage(
                                  image: AssetImage(trendingAlbums[i]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
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
                            Container(
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
                                '20th Feb 2022\nHey Adam,\nToday you have done the best meditation till now and i am really pround of you.',
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                    color: Colors.white,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
