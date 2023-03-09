import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental_health_app/screens/auth/auth_screen.dart';
import 'package:mental_health_app/util/navigation/routes.dart';
import '../../res/assets.dart';
import '../../res/colors.dart';
import '../../util/navigation/navigation_service.dart';
import '/globals.dart' as globals;

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      iconSize: 100,
                      onPressed: (() {}),
                      icon: SvgPicture.asset(
                        Assets.BACK,
                        color: Colors.transparent,
                        // fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      width: 35.w,
                    ),
                    Text(
                      "Take Care",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 20.sp,
                            color: AppColors.textColor,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.w),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello !",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 20.sp,
                                color: AppColors.textColor,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Text(
                          "Please signin with valid credentials",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 12.sp,
                                color: AppColors.textColor,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                        TextField(
                          controller: emailcontroller,
                          maxLines: null,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1.5, color: AppColors.textColor),
                              borderRadius: BorderRadius.circular(15.00.r),
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1.5, color: AppColors.textColor),
                              borderRadius: BorderRadius.circular(15.00.r),
                            ),
                            hintText: 'Email',
                            hintStyle:
                                const TextStyle(color: AppColors.textColor),
                          ),
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              height: 0.5,
                              color: AppColors.textColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        TextField(
                          controller: passwordcontroller,
                          maxLines: null,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1.5, color: AppColors.textColor),
                              borderRadius: BorderRadius.circular(15.00.r),
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1.5, color: AppColors.textColor),
                              borderRadius: BorderRadius.circular(15.00.r),
                            ),
                            hintText: 'Password',
                            hintStyle:
                                const TextStyle(color: AppColors.textColor),
                          ),
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              height: 0.5,
                              color: AppColors.textColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2.5.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.r)),
                                //  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
                                backgroundColor: AppColors.textColor,
                              ),
                              onPressed: signIn,
                              child: Text(
                                'LogIn',
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                    height: 0.5,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const AuthScreen()));
                              },
                              child: const Text(
                                'or signup Instead',
                                style: TextStyle(color: AppColors.textColor),
                              ),

                              // decoration: InputDecoration(
                              //   enabledBorder: OutlineInputBorder(
                              //     borderSide: const BorderSide(
                              //         width: 1.5, color: AppColors.textColor),
                              //     borderRadius: BorderRadius.circular(15.00.r),
                              //   ),
                              //   border: OutlineInputBorder(
                              //     borderSide: const BorderSide(
                              //         width: 1.5, color: AppColors.textColor),
                              //     borderRadius: BorderRadius.circular(15.00.r),
                              //   ),
                              //   hintText: 'Phone Number',
                              //   hintStyle: const TextStyle(color: AppColors.textColor),
                              // ),
                              // style: GoogleFonts.poppins(
                              //   height: 0.5,
                              //   textStyle: const TextStyle(
                              //     color: AppColors.textColor,
                              //   ),
                              // ),
                            ),
                          ],
                        ),
                      ]),
                ),
              ],
            )),
      ),
    );
  }

  Future signIn() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
              child: CircularProgressIndicator(
                color: AppColors.textColor,
              ),
            ));
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailcontroller.text.trim(),
          password: passwordcontroller.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    GetIt.I
        .get<NavigationService>()
        .navigatorKey
        .currentState!
        .popUntil((route) => route.isFirst);
  }
}
