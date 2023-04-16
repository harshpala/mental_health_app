import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental_health_app/models/user_model.dart';
import '../../res/assets.dart';
import '../../res/colors.dart';
import '../root/bottom_nav.dart';
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

  Tabs _currentTab = Tabs.profile;
  void _selectTab(Tabs tab) {
    setState(() {
      _currentTab = tab;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Offstage(
      offstage: !widget.isCurrent,
      child: Scaffold(
        key: scaffoldKey,
        drawer: ClipRRect(
            borderRadius: BorderRadius.horizontal(right: Radius.circular(16.r)),
            child: SizedBox(
                width: 220.w,
                child: AppDrawer(
                  currentTab: _currentTab,
                  onTabChanged: _selectTab,
                ))),
        body: SafeArea(
            child: SingleChildScrollView(
          child: FutureBuilder(
            future: getUserDetails(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  UserModel userData = snapshot.data as UserModel;
                  globals.name = userData.name;
                  return Container(
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
                        Row(
                          children: [
                            SizedBox(
                              width: 40.h,
                            ),
                            Row(children: [
                              Container(
                                  padding: const EdgeInsets.all(2),
                                  margin: const EdgeInsets.only(right: 15),
                                  height: 125.h,
                                  width: 110.w,
                                  child: const ClipOval(
                                    child: Image(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(
                                          'https://pixlr.com/studio/template/6264364c-b8cc-4f4f-92d8-28c69a2b756w/thumbnail.webp'),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 4, color: AppColors.textColor),
                                    borderRadius: BorderRadius.circular(100),
                                  )),
                            ]),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  userData.name,
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        fontSize: 25.sp,
                                        color: AppColors.textColor,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Text(
                                  " Student",
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontSize: 15.sp,
                                    ),
                                    color: AppColors.textColor,
                                    //fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Card(
                          margin: const EdgeInsets.all(25),
                          shape: RoundedRectangleBorder(
                            side:
                                const BorderSide(color: Colors.white, width: 1),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: ListView(
                            shrinkWrap: true,
                            children: [
                              ListTile(
                                leading: Text(
                                  " Personal Information",
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontSize: 18.sp,
                                    ),
                                    color: Colors.grey.shade700,
                                    //fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              ListTile(
                                leading: ClipOval(
                                  child: Container(
                                    height: 40.h,
                                    width: 35.w,
                                    color: AppColors.textColor,
                                    child: const Icon(
                                      Icons.phone,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                title: Text(
                                  'Mobile',
                                  style: TextStyle(color: Colors.grey.shade700),
                                ),
                                trailing: Text(
                                  userData.phoneno,
                                  style: TextStyle(color: Colors.grey.shade700),
                                ),
                              ),
                              ListTile(
                                leading: ClipOval(
                                  child: Container(
                                    height: 40.h,
                                    width: 35.w,
                                    color: AppColors.textColor,
                                    child: const Icon(
                                      Icons.mail,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                title: Text(
                                  'Mail',
                                  style: TextStyle(color: Colors.grey.shade700),
                                ),
                                trailing: Text(
                                  userData.email,
                                  style: TextStyle(color: Colors.grey.shade700),
                                ),
                              ),
                              ListTile(
                                leading: ClipOval(
                                  child: Container(
                                    height: 40.h,
                                    width: 35.w,
                                    color: AppColors.textColor,
                                    child: const Icon(
                                      Icons.location_on,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                title: Text(
                                  'Location',
                                  style: TextStyle(color: Colors.grey.shade700),
                                ),
                                trailing: Text(
                                  'Chennai',
                                  style: TextStyle(color: Colors.grey.shade700),
                                ),
                              ),
                              ListTile(
                                leading: ClipOval(
                                  child: Container(
                                    height: 40.h,
                                    width: 35.w,
                                    color: AppColors.textColor,
                                    child: const Icon(
                                      Icons.person,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                title: Text(
                                  'Aadhar',
                                  style: TextStyle(color: Colors.grey.shade700),
                                ),
                                trailing: Text(
                                  '4555 7895 1345 7913',
                                  style: TextStyle(color: Colors.grey.shade700),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Card(
                          margin: const EdgeInsets.only(
                              left: 25, right: 25, bottom: 25),
                          shape: RoundedRectangleBorder(
                            side:
                                const BorderSide(color: Colors.white, width: 1),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: ListView(
                            shrinkWrap: true,
                            children: [
                              ListTile(
                                leading: Text(
                                  " Educational Information",
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontSize: 18.sp,
                                    ),
                                    color: Colors.grey.shade700,
                                    //fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              ListTile(
                                leading: ClipOval(
                                  child: Container(
                                    height: 40.h,
                                    width: 35.w,
                                    color: AppColors.textColor,
                                    child: const Icon(
                                      Icons.phone,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                title: Text(
                                  'College',
                                  style: TextStyle(color: Colors.grey.shade700),
                                ),
                                trailing: Text(
                                  'abc@gmail.com',
                                  style: TextStyle(color: Colors.grey.shade700),
                                ),
                              ),
                              ListTile(
                                leading: ClipOval(
                                  child: Container(
                                    height: 40.h,
                                    width: 35.w,
                                    color: AppColors.textColor,
                                    child: const Icon(
                                      Icons.location_on,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                title: Text(
                                  'Location',
                                  style: TextStyle(color: Colors.grey.shade700),
                                ),
                                trailing: Text(
                                  'Chennai',
                                  style: TextStyle(color: Colors.grey.shade700),
                                ),
                              ),
                              ListTile(
                                leading: ClipOval(
                                  child: Container(
                                    height: 40.h,
                                    width: 35.w,
                                    color: AppColors.textColor,
                                    child: const Icon(
                                      Icons.person,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                title: Text(
                                  'Aadhar',
                                  style: TextStyle(color: Colors.grey.shade700),
                                ),
                                trailing: Text(
                                  '4555 7895 1345 7913',
                                  style: TextStyle(color: Colors.grey.shade700),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
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
            },
          ),
        )),
      ),
    );
  }
}
