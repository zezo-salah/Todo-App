import 'package:flutter/material.dart';
import 'package:todo_app_app/featutrs/setting/pages/Settings.dart';
import 'package:todo_app_app/featutrs/tasks/pages/Tasks.dart';

class SettingProvider extends ChangeNotifier {

  List<Widget> screen= [
    TasksView(),
    SettingView(),
  ];
  int currentIndex=0;

  ThemeMode currentTheme = ThemeMode.light;

  ChangeTheme (ThemeMode newTheme){
    if(currentTheme==newTheme)return;

    currentTheme=newTheme;
    notifyListeners();
  }


 ChangeIndex(int index){
   currentIndex=index;
   notifyListeners();
 }

  bool isDark() {
    return currentTheme == ThemeMode.dark;
  }
  DateTime selectedDate = DateTime.now();

  selectDateTime(BuildContext context) async {
    var currentSelectedDate = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      initialDate: selectedDate,
      currentDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 365),
      ),
    );

    if (currentSelectedDate == null) return;

    selectedDate = currentSelectedDate;

    notifyListeners();
  }
}
