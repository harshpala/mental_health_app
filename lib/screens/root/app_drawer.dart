import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental_health_app/globals.dart';
import 'package:mental_health_app/screens/root/root_widget.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '/globals.dart' as globals;
import '../../res/assets.dart';
import '../Article/article_screen.dart';

class AppDrawer extends StatelessWidget {
  final selectedIndex;
  final Function(int) onItemTapped;
  const AppDrawer({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);
  _launchCaller() async {
    if (await canLaunchUrlString(call_SOS)) {
      await launchUrlString(call_SOS);
    } else {
      throw 'Could not launch $call_SOS';
    }
  }

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
                    child: GestureDetector(
                      onTap: () {
                        onItemTapped(2);
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Home',
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: GestureDetector(
                      onTap: () {
                        onItemTapped(0);
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Profile',
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: GestureDetector(
                      onTap: () {
                        onItemTapped(1);
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Meditation',
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      onItemTapped(3);
                      Navigator.pop(context);
                    },
                    child: Padding(
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
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: GestureDetector(
                      onTap: () {
                        globals.isArticleopen ? Navigator.pop(context) : null;
                        onItemTapped(4);
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Tracker',
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        globals.isArticleopen
                            ? null
                            : Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ArticleScreen(
                                      selectedIndex: selectedIndex,
                                      onItemTapped: onItemTapped,
                                    )));
                      },
                      child: Text(
                        'Articles',
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: GestureDetector(
                      onTap: () {
                        _launchCaller();
                      },
                      child: Text(
                        'Sos',
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 120),
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
