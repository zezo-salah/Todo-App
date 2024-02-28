import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_app/featutrs/setting_provider.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key});
  static const String routeName = "taskitem";
  @override
  Widget build(BuildContext context) {
    var mediaQuary = MediaQuery.of(context).size;
    var vm = Provider.of<SettingProvider>(context);
    var theme = Theme.of(context);
    return Container(
      width: 352,
      height: 110,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0), color: vm.isDark()? const Color(0xFF141922):Colors.white),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(
            width: 10,
          ),
          Container(
            height: 62,
            width: 4,
            color: theme.primaryColor,
            // decoration: BoxDecoration(color: theme.primaryColor),
          ),
          const SizedBox(
            width: 25,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "To Go Work",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: theme.primaryColor,
                    fontSize: 18,
                    fontFamily: "Pop"),
              ),
              const SizedBox(
                height: 8,
              ),
               Row(
                children: [
                  Icon(
                    Icons.alarm,
                    size: 20,
                    color: vm.isDark()? Colors.white:const Color(0xFF141922),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "10:00 AM",
                    style: TextStyle(
                      color: vm.isDark()?  Colors.white:const Color(0xFF141922),
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                        fontFamily: "Pop"),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          Container(
            height: 34,
            width: 69,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: theme.primaryColor,
            ),
            child: InkWell(
                onTap: () {},
                child: const Icon(

                  Icons.check_rounded,
                  color: Colors.white,
                  size: 30,

                )),
          )
        ],
      ),
    );
  }
}
