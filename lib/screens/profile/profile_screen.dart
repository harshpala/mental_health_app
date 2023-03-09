import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../res/assets.dart';
import '../../res/colors.dart';
import '../root/header.dart';
import '../root/app_drawer.dart';
import '/globals.dart' as globals;

class ProfileScreen extends StatefulWidget {
  final bool isCurrent;
  const ProfileScreen({Key? key, required this.isCurrent}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
            ],
          ),
        )),
      ),
    );
  }
}
