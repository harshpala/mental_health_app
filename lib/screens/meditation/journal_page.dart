import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mental_health_app/models/user_model.dart';
import '../root/bottom_nav.dart';
import '../root/header.dart';
import '../root/app_drawer.dart';
import '/globals.dart' as globals;

class JournalPage extends StatefulWidget {
  final String journal;
  const JournalPage({
    Key? key,
    required this.journal,
  }) : super(key: key);

  @override
  State<JournalPage> createState() => _JournalPageState();
}

class _JournalPageState extends State<JournalPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  Tabs _currentTab = Tabs.meditation;
  void _selectTab(Tabs tab) {
    setState(() {
      _currentTab = tab;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNav(
        currentTab: _currentTab,
        didSelectTab: _selectTab,
      ),
      key: scaffoldKey,
      drawer: ClipRRect(
          borderRadius: BorderRadius.horizontal(right: Radius.circular(16.r)),
          child: SizedBox(
              width: 220.w,
              child: AppDrawer(
                currentTab: _currentTab,
                onTabChanged: _selectTab,
              ))),
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(49, 147, 179, 1),
                Color.fromRGBO(85, 196, 218, 1)
              ],
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
                padding: EdgeInsets.all(15.w),
                child: TextFormField(
                  maxLines: null,
                  initialValue: widget.journal,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: const InputDecoration.collapsed(
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                      hintText: 'Start Writing Your Journal...'),
                  onChanged: (value) {
                    setState(() {
                      globals.journal = value;
                    });
                    updateJournal(value);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
