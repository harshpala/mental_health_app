import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../res/assets.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(85, 196, 218, 1),
            Color.fromRGBO(49, 147, 179, 1),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: ListView(children: <Widget>[
        DrawerHeader(
            child: Image.asset(Assets.WHITE_LOGO),
            decoration: BoxDecoration(
              border: Border(
                bottom: Divider.createBorderSide(context,
                    color: Colors.white, width: 1.0),
              ),
            )),
        Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 60.0, bottom: 20),
                    child: Text(
                      'Home',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      'Profile',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      'Meditation',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      'Music',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      'Sos',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 165),
                    child: TextButton(
                      onPressed: () {
                        FirebaseAuth.instance.signOut();
                      },
                      child: Text(
                        'Log Out',
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Help & FAQ\'s',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              )
            ])
      ]),
    ));
  }
}
