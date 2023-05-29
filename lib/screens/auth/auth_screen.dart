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

  late FocusNode emailnode;
  late FocusNode namenode;
  late FocusNode passnode;
  late FocusNode conpassnode;

  @override
  void initState() {
    super.initState();

    emailnode = FocusNode();
    namenode = FocusNode();
    passnode = FocusNode();
    conpassnode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    emailnode.dispose();
    namenode.dispose();
    passnode.dispose();
    conpassnode.dispose();

    super.dispose();
  }

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool emailexists = false;
  bool phonenoexists = false;
  bool emailExists(String email) {
    FirebaseFirestore.instance
        .collection('Users')
        .where('email', isEqualTo: email)
        .get()
        .then((value) {
      if (value.size == 0) {
        emailexists = false;
      } else if (value.size != 0) {
        emailexists = true;
      }
      print(emailexists);
      return emailexists;
    });

    return emailexists;
  }

  bool phoneExists(String phoneno) {
    FirebaseFirestore.instance
        .collection('Users')
        .where('number', isEqualTo: phoneno)
        .get()
        .then((value) {
      if (value.size == 0) {
        phonenoexists = false;
      } else if (value.size != 0) {
        phonenoexists = true;
      }
      print(phonenoexists);
      return phonenoexists;
    });

    return phonenoexists;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
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
            SizedBox(
              height: 50.h,
            ),
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
                  width: 0.w,
                ),
                Text(
                  "Take Care",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: 30.sp,
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              child: Form(
                key: _formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "New User",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 28.sp,
                            color: AppColors.textColor,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Text(
                      "Please use valid Username and Password",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 15.sp,
                            color: AppColors.textColor,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    TextFormField(
                      onFieldSubmitted: ((value) => emailnode.requestFocus()),
                      onChanged: (value) => phoneExists(value),
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.length < 10) {
                          return 'Please enter a valid phone number';
                        } else if (phonenoexists) {
                          return 'phone number already exists';
                        }
                        return null;
                      },
                      controller: phonenocontroller,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        isDense: true,
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
                        //height: 0.5,
                        textStyle: const TextStyle(
                          color: AppColors.textColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    TextFormField(
                      controller: emailcontroller,
                      maxLines: null,
                      onChanged: (value) => emailExists(value),
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            !value.contains('@')) {
                          return 'Please enter valid Email';
                        } else if (emailexists) {
                          return 'Email already exists';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        isDense: true,
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
                      focusNode: emailnode,
                      onFieldSubmitted: (value) => namenode.requestFocus(),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          // height: 0.5,
                          color: AppColors.textColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    TextFormField(
                      focusNode: namenode,
                      onFieldSubmitted: (value) => passnode.requestFocus(),
                      textInputAction: TextInputAction.next,
                      controller: namecontroller,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Valid Name';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        isDense: true,
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
                          // height: 0.5,
                          color: AppColors.textColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    TextFormField(
                      controller: passwordcontroller,
                      decoration: InputDecoration(
                        isDense: true,
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
                      validator: (value) {
                        RegExp regex = RegExp(
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                        if (value == null || value.isEmpty) {
                          return 'Please Enter a Password';
                        } else {
                          if (!regex.hasMatch(value)) {
                            return 'Password must contain:\nMinimum 1 Upper case\nMinimum 1 Numeric Number\nMinimum 1 lowercase \nMinimum 1 Special Character\nCharacters ( ! @ # \$ & * ~ )';
                          } else {
                            return null;
                          }
                        }
                      },
                      focusNode: passnode,
                      onFieldSubmitted: (value) => conpassnode.requestFocus(),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          //height: 0.5,
                          color: AppColors.textColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        isDense: true,
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter a Password';
                        } else {
                          if (value != passwordcontroller.text) {
                            return 'Your Passwords do not match';
                          }
                        }
                        return null;
                      },
                      focusNode: conpassnode,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          //height: 0.5,
                          color: AppColors.textColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 80.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 45.h,
                          width: 150.w,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.r)),
                              //  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
                              backgroundColor: AppColors.textColor,
                            ),
                            onPressed: (() async {
                              if (_formkey.currentState!.validate()) {
                                _formkey.currentState!.save();
                                await signIn();
                                globals.isloggedIn = !globals.isloggedIn;
                              }
                            }),
                            child: Text(
                              'Submit',
                              style: GoogleFonts.poppins(
                                fontSize: 20.sp,
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
