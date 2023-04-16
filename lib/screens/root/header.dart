import 'package:flutter/material.dart';

import '../../res/assets.dart';
import '/globals.dart' as globals;

class Header extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldkey;
  const Header({
    Key? key,
    required this.scaffoldkey,
  }) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        globals.isDay ? Image.asset(Assets.MORNING) : Image.asset(Assets.NIGHT),
        Positioned(
          right: 10,
          top: 45,
          child: Row(
            children: [
              ClipOval(
                child: Container(
                  height: 40,
                  width: 40,
                  color: globals.isDay ? Colors.white : null,
                  child: IconButton(
                    icon: Icon(Icons.brightness_7_rounded,
                        color: globals.isDay
                            ? Colors.orange.shade300
                            : Colors.black),
                    onPressed: () {
                      setState(() {
                        globals.isDay = true;
                      });
                    },
                  ),
                ),
              ),
              ClipOval(
                child: Container(
                  height: 40,
                  width: 40,
                  color: globals.isDay ? null : Colors.white,
                  child: IconButton(
                      icon: Icon(Icons.brightness_3,
                          color: globals.isDay ? Colors.white : Colors.black),
                      onPressed: () {
                        setState(() {
                          globals.isDay = false;
                        });
                      }),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 10,
          top: 105,
          child: IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () => widget.scaffoldkey.currentState!.openDrawer(),
          ),
        ),
        Positioned(
          right: 10,
          top: 105,
          child: IconButton(
              icon:
                  const Icon(Icons.notifications_outlined, color: Colors.white),
              onPressed: () {}),
        ),
      ],
    );
  }
}
