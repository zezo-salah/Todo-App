import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_app/featutrs/setting_provider.dart';
import 'package:todo_app_app/featutrs/tasks/widget/task_item.dart';

class TasksView extends StatefulWidget {
  const TasksView({super.key});
  static const String routeName = "tasks";

  @override
  State<TasksView> createState() => _TasksViewState();
}

class _TasksViewState extends State<TasksView> {
  DateTime focusDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    var vm = Provider.of<SettingProvider>(context);
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: Stack(
            clipBehavior: Clip.none,
            alignment: const Alignment(0, 2.0),
            children: [
              Container(
                width: mediaQuery.width,
                height: mediaQuery.height * 0.24,
                color: theme.primaryColor,
                padding:
                    const EdgeInsets.symmetric(horizontal: 40.0, vertical: 70),
                child: vm.isDark()
                    ? const Text(
                        "To Do List",
                        style: TextStyle(
                            fontFamily: "Pop",
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      )
                    : const Text(
                        "To Do List",
                        style: TextStyle(
                            fontFamily: "Pop",
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
              ),
              EasyInfiniteDateTimeLine(
                showTimelineHeader: false,
                timeLineProps: const EasyTimeLineProps(separatorPadding: 18),
                // controller: _controller,
                firstDate: DateTime.now(),
                focusDate: focusDate,
                lastDate: DateTime(2030),
                dayProps: EasyDayProps(
                  height: 100,
                  todayStyle: DayStyle(
                      monthStrStyle: TextStyle(
                        color: vm.isDark() ? Colors.white : Colors.black,
                        fontSize: 12,
                        fontFamily: "Pop",
                        fontWeight: FontWeight.w400,
                      ),
                      dayStrStyle: TextStyle(
                        color: vm.isDark() ? Colors.white : Colors.black,
                        fontSize: 12,
                        fontFamily: "Pop",
                        fontWeight: FontWeight.w400,
                      ),
                      dayNumStyle: TextStyle(
                        color: vm.isDark() ? Colors.white : Colors.black,
                        fontSize: 15,
                        fontFamily: "Pop",
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: BoxDecoration(
                        color: vm.isDark()
                            ? const Color(0xFF141922)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      )),
                  activeDayStyle: DayStyle(
                      dayStrStyle: TextStyle(
                        color: theme.primaryColor,
                        fontSize: 12,
                        fontFamily: "Pop",
                        fontWeight: FontWeight.w400,
                      ),
                      monthStrStyle: TextStyle(
                        color: theme.primaryColor,
                        fontSize: 12,
                        fontFamily: "Pop",
                        fontWeight: FontWeight.w400,
                      ),
                      dayNumStyle: TextStyle(
                          color: theme.primaryColor,
                          fontSize: 15,
                          fontFamily: "Pop",
                          fontWeight: FontWeight.bold),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: vm.isDark()
                            ? const Color(0xCD141922)
                            : Color(0xDAFFFFFF),
                      )),
                  inactiveDayStyle: DayStyle(
                      dayStrStyle: TextStyle(
                        color: vm.isDark() ? Colors.white : Colors.black,
                        fontSize: 12,
                        fontFamily: "Pop",
                        fontWeight: FontWeight.w400,
                      ),
                      monthStrStyle: TextStyle(
                        color: vm.isDark() ? Colors.white : Colors.black,
                        fontSize: 12,
                        fontFamily: "Pop",
                        fontWeight: FontWeight.w400,
                      ),
                      dayNumStyle: TextStyle(
                          color: vm.isDark() ? Colors.white : Colors.black,
                          fontSize: 16,
                          fontFamily: "Pop",
                          fontWeight: FontWeight.bold),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: vm.isDark()
                              ? const Color(0xFF141922)
                              : Colors.white)),
                ),
                onDateChange: (selectedDate) {
                  setState(() {
                    focusDate = selectedDate;
                  });
                },
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            children: const [
              TaskItem(),
              TaskItem(),
              TaskItem(),
              TaskItem(),
              TaskItem(),
              TaskItem(),
            ],
          ),
        )
      ],
    ));
  }
}
