import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_app/featutrs/setting_provider.dart';
import 'package:todo_app_app/task_bottom_sheet.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});
  static const String routeName = "LayoutViwe";
  static const Color primaryColor = Color(0xFFDFEECDB);

  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<SettingProvider>(context);
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: BottomAppBar(
        shape:const CircularNotchedRectangle(),
        notchMargin: 15,
        child: BottomNavigationBar(
          currentIndex: vm.currentIndex,
          onTap: vm.ChangeIndex,

          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: "Tasks",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label: "Settings",
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isDismissible: true,
            backgroundColor: Colors.transparent,
            builder: (context) => TaskBottomSheet(),
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: vm.screen[vm.currentIndex],
    );
  }
}
