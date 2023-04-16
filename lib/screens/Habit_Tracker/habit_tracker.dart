import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../res/colors.dart';
import '../root/app_drawer.dart';
import '../root/bottom_nav.dart';
import './components/habit_tile.dart';
import './components/month_summary.dart';
import './components/my_fab.dart';
import './components/my_alert_box.dart';
import './data/habit_database.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HabitTrackerScreen extends StatefulWidget {
  const HabitTrackerScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HabitTrackerScreen> createState() => _HabitTrackerScreenState();
}

class _HabitTrackerScreenState extends State<HabitTrackerScreen> {
  HabitDatabase db = HabitDatabase();
  final _myBox = Hive.box("Habit_Database");

  @override
  void initState() {
    // if there is no current habit list, then it is the 1st time ever opening the app
    // then create default data
    if (_myBox.get("CURRENT_HABIT_LIST") == null) {
      db.createDefaultData();
    }

    // there already exists data, this is not the first time
    else {
      db.loadData();
    }

    // update the database
    db.updateDatabase();

    super.initState();
  }

  // checkbox was tapped
  void checkBoxTapped(bool? value, int index) {
    setState(() {
      db.todaysHabitList[index][1] = value;
    });
    db.updateDatabase();
  }

  // create a new habit
  final _newHabitNameController = TextEditingController();
  void createNewHabit() {
    // show alert dialog for user to enter the new habit details
    showDialog(
      context: context,
      builder: (context) {
        return MyAlertBox(
          controller: _newHabitNameController,
          hintText: 'Enter habit name..',
          onSave: saveNewHabit,
          onCancel: cancelDialogBox,
        );
      },
    );
  }

  // save new habit
  void saveNewHabit() {
    // add new habit to todays habit list
    setState(() {
      db.todaysHabitList.add([_newHabitNameController.text, false]);
    });

    // clear textfield
    _newHabitNameController.clear();
    // pop dialog box
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  // cancel new habit
  void cancelDialogBox() {
    // clear textfield
    _newHabitNameController.clear();

    // pop dialog box
    Navigator.of(context).pop();
  }

  // open habit settings to edit
  void openHabitSettings(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return MyAlertBox(
          controller: _newHabitNameController,
          hintText: db.todaysHabitList[index][0],
          onSave: () => saveExistingHabit(index),
          onCancel: cancelDialogBox,
        );
      },
    );
  }

  // save existing habit with a new name
  void saveExistingHabit(int index) {
    setState(() {
      db.todaysHabitList[index][0] = _newHabitNameController.text;
    });
    _newHabitNameController.clear();
    Navigator.pop(context);
    db.updateDatabase();
  }

  // delete habit
  void deleteHabit(int index) {
    setState(() {
      db.todaysHabitList.removeAt(index);
    });
    db.updateDatabase();
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();

  // Tabs _currentTab = Tabs.tracker;
  // void _selectTab(Tabs tab) {
  //   setState(() {
  //     _currentTab = tab;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: BottomNav(
      //   currentTab: _currentTab,
      //   didSelectTab: _selectTab,
      // ),
      key: scaffoldKey,

      extendBodyBehindAppBar: true,
      floatingActionButton: MyFloatingActionButton(onPressed: createNewHabit),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.customblue, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          children: [
            // monthly summary heat map
            MonthlySummary(
              datasets: db.heatMapDataSet,
              startDate: _myBox.get("START_DATE"),
            ),

            // list of habits
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: db.todaysHabitList.length,
              itemBuilder: (context, index) {
                return HabitTile(
                  habitName: db.todaysHabitList[index][0],
                  habitCompleted: db.todaysHabitList[index][1],
                  onChanged: (value) => checkBoxTapped(value, index),
                  settingsTapped: (context) => openHabitSettings(index),
                  deleteTapped: (context) => deleteHabit(index),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
