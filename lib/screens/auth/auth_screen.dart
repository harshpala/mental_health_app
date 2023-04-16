import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental_health_app/models/user_model.dart';
import '../../res/assets.dart';
import '../../res/colors.dart';
import '../../util/navigation/navigation_service.dart';
import '/globals.dart' as globals;

class AuthScreen extends StatefulWidget {
  const AuthScreen({
    Key? key,
  }) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final phonenocontroller = TextEditingController();
  final namecontroller = TextEditingController();

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
                  onPressed: (() {
                    GetIt.I.get<NavigationService>().back();
                  }),
                  icon: SvgPicture.asset(
                    Assets.BACK,
                    color: AppColors.textColor,
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
                    "New User",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 20.sp,
                          color: AppColors.textColor,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Text(
                    "Please select valid Username and Password",
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
                    controller: phonenocontroller,
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
                      hintText: 'Phone Number',
                      hintStyle: const TextStyle(color: AppColors.textColor),
                    ),
                    keyboardType: TextInputType.phone,
                    style: GoogleFonts.poppins(
                      height: 0.5,
                      textStyle: const TextStyle(
                        color: AppColors.textColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
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
                      hintStyle: const TextStyle(color: AppColors.textColor),
                    ),
                    keyboardType: TextInputType.emailAddress,
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
                    controller: namecontroller,
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
                      hintText: 'Display Name',
                      hintStyle: const TextStyle(color: AppColors.textColor),
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
                      hintStyle: const TextStyle(color: AppColors.textColor),
                    ),
                    keyboardType: TextInputType.visiblePassword,
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
                      hintText: 'Confirm Password',
                      hintStyle: const TextStyle(color: AppColors.textColor),
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        height: 0.5,
                        color: AppColors.textColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 150.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 150.w,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.r)),
                            //  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
                            backgroundColor: AppColors.textColor,
                          ),
                          onPressed: (() {
                            setState(() {
                              signIn();

                              globals.isloggedIn = !globals.isloggedIn;
                            });
                          }),
                          child: Text(
                            'Submit',
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                height: 0.5,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }

  Future signIn() async {
    final user = UserModel(
        name: namecontroller.text.trim(),
        phoneno: phonenocontroller.text.trim(),
        email: emailcontroller.text.trim(),
        journal: '');

    try {
      await FirebaseFirestore.instance
          .collection('Users')
          .add(user.toJson())
          .then((value) async => await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                  email: user.email, password: passwordcontroller.text.trim()))
          .whenComplete(() => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content: Text('Your Account has been created !'))));
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
