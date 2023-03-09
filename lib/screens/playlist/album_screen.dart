import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mental_health_app/models/album_model.dart';
import 'package:mental_health_app/res/assets.dart';
import 'package:mental_health_app/util/navigation/navigation_service.dart';
import 'package:mental_health_app/util/navigation/routes.dart';
import '../../models/song_model.dart';
import '../../res/colors.dart';
import '/globals.dart' as globals;

class AlbumScreen extends StatefulWidget {
  final bool isCurrent;
  const AlbumScreen({Key? key, required this.isCurrent}) : super(key: key);

  @override
  _AlbumScreenState createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  var album = AlbumModel(
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
  );

  List<SongModel> songs = [
    SongModel(
      id: 1,
      albumId: 1,
      image: "assets/png/home/home1.png",
      title: 'Chinedum',
      artist: 'Mercy Chinwo',
      year: '2021',
      download: 1,
      plays: 2,
      genre: "",
      like: 2,
    ),
    SongModel(
      id: 2,
      albumId: 1,
      image: "assets/png/home/home1.png",
      title: 'No More Pain',
      artist: 'Mercy Chinwo',
      year: '2021',
      download: 1,
      plays: 2,
      genre: "",
      like: 2,
    ),
    SongModel(
      id: 3,
      albumId: 1,
      image: "assets/png/home/home1.png",
      title: 'Oh Jesus',
      artist: 'Mercy Chinwo',
      year: '2021',
      download: 1,
      plays: 2,
      genre: "",
      like: 2,
    ),
    SongModel(
      id: 4,
      albumId: 1,
      image: "assets/png/home/home1.png",
      title: 'Baby Song',
      artist: 'Mercy Chinwo',
      year: '2021',
      download: 1,
      plays: 2,
      genre: "",
      like: 2,
    ),
    SongModel(
      id: 5,
      albumId: 1,
      image: "assets/png/home/home1.png",
      title: 'Udeme',
      artist: 'Mercy Chinwo',
      year: '2021',
      download: 1,
      plays: 2,
      genre: "",
      like: 2,
    ),
    SongModel(
      id: 6,
      albumId: 1,
      image: "assets/png/home/home1.png",
      title: 'Tasted Of Your ...',
      artist: 'Mercy Chinwo',
      year: '2021',
      download: 1,
      plays: 2,
      genre: "",
      like: 2,
    ),
    SongModel(
      id: 7,
      albumId: 1,
      image: "assets/png/home/home1.png",
      title: 'Obinasom',
      artist: 'Mercy Chinwo',
      year: '2021',
      download: 1,
      plays: 2,
      genre: "",
      like: 2,
    )
  ];

  NumberFormat formatter = NumberFormat("00");

  @override
  Widget build(BuildContext context) {
    int i = globals.i;
    String name = globals.title;
    return Offstage(
      offstage: !widget.isCurrent,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              GetIt.I.get<NavigationService>().back();
            },
            child: SvgPicture.asset(
              Assets.BACK,
              height: 24,
              width: 24,
              color: AppColors.textColor,
              // fit: BoxFit.fill,
            ),
          ),
          automaticallyImplyLeading: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
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
              Image.asset(Assets.MORNING),
              SizedBox(height: 8.h),
              Container(
                height: 127.r,
                padding: EdgeInsets.only(left: 20.w, right: 20.w),
                child: Row(
                  children: [
                    Flexible(
                      child: Container(
                        width: 127.r,
                        height: 127.r,
                        margin: EdgeInsets.only(right: 14.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          image: DecorationImage(
                            image: AssetImage("assets/png/home/home$i.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Album - ${album.songs} songs - ${album.year}",
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.textColor,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Text(
                          name,
                          overflow: TextOverflow.fade,
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              fontSize: 24.sp,
                              color: AppColors.textColor,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Text(
                          album.artist,
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.textColor,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 2.h, right: 4.w),
                              child: SvgPicture.asset(
                                Assets.HEART_OUTLINED,
                                height: 24.w,
                                width: 24.w,
                                fit: BoxFit.fill,
                                color: AppColors.textColor,
                              ),
                            ),
                            SizedBox(width: 19.w),
                            Padding(
                              padding: EdgeInsets.only(bottom: 2.h, right: 4.w),
                              child: SvgPicture.asset(
                                Assets.DOWNLOAD,
                                height: 24.w,
                                width: 24.w,
                                fit: BoxFit.fill,
                                color: AppColors.textColor,
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.only(top: 17.h),
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  itemBuilder: (c, i) {
                    return InkWell(
                      onTap: () {
                        GetIt.I
                            .get<NavigationService>()
                            .to(routeName: Routes.playingNow);
                      },
                      child: Container(
                        padding: EdgeInsets.only(left: 29.w, right: 34.w),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 22.w),
                              child: i == 2
                                  ? SizedBox(
                                      width: 32.2,
                                      height: 29.h,
                                      child: const Icon(
                                        Icons.equalizer,
                                        color: AppColors.textColor,
                                      ),
                                    )
                                  : Text(
                                      formatter.format(i + 1),
                                      maxLines: 1,
                                      style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                          fontSize: 24.sp,
                                          color: AppColors.textColor,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                            ),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  songs[i].title,
                                  maxLines: 1,
                                  style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                      fontSize: 18.sp,
                                      color: AppColors.textColor,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  songs[i].artist,
                                  maxLines: 1,
                                  style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                      fontSize: 14.sp,
                                      color: AppColors.textColor,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                )
                              ],
                            )),
                            Padding(
                              padding: EdgeInsets.only(bottom: 2.h, right: 4.w),
                              child: SvgPicture.asset(
                                Assets.HEART_OUTLINED,
                                height: 24.w,
                                width: 24.w,
                                fit: BoxFit.fill,
                                color: AppColors.textColor,
                              ),
                            ),
                            SizedBox(width: 28.w),
                            Padding(
                              padding: EdgeInsets.only(bottom: 2.h, right: 4.w),
                              child: SvgPicture.asset(
                                Assets.DOWNLOAD,
                                height: 24.w,
                                width: 24.w,
                                fit: BoxFit.fill,
                                color: AppColors.textColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (c, i) {
                    return SizedBox(
                      height: 15.h,
                    );
                  },
                  itemCount: songs.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
