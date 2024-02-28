import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_app/featutrs/setting_provider.dart';

class SettingView extends StatelessWidget {
  SettingView({super.key});
  static const String routeName = "setting";

  List<String> languagesList = [
    "English",
    "عربي",
  ];
  List<String> themeList = [
    "Light",
    "Dark",
  ];

  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<SettingProvider>(context);
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: mediaQuery.width,
            height:mediaQuery.height *  0.24,
            color: theme.primaryColor,
            padding: const EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 70
            ),
            child: vm.isDark() ?  const Text(
              "Settings",
              style: TextStyle(fontFamily: "Pop",fontSize: 22,fontWeight: FontWeight.w700,color: Colors.black),
            ):
            const Text(
              "Settings",
              style: TextStyle(fontFamily: "Pop",fontSize: 22,fontWeight: FontWeight.w700,color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                vm.isDark()
                    ? const Text(
                        "Language",
                        style: TextStyle(
                            fontFamily: "Pop", fontSize: 20, color: Colors.white),
                      )
                    : const Text(
                        "Language",
                        style: TextStyle(
                            fontFamily: "Pop", fontSize: 20, color: Colors.black),
                      ),
                const SizedBox(
                  height: 10,
                ),
                CustomDropdown(
                  onChanged: (value) {
                    //   if(value== "English"){
                    //
                    //   }
                  },
                  items: languagesList,
                  initialItem: "English",
                  decoration: CustomDropdownDecoration(
                    closedBorderRadius: BorderRadius.circular(5),
                    closedBorder: Border.all(color: theme.primaryColor),
                    listItemStyle: TextStyle(color:vm.isDark()? Colors.white: Colors.black),

                    headerStyle: TextStyle(
                      color: vm.isDark()
                          ? const Color(0xFF5D9CEC)
                          : const Color(0xFF5D9CEC),
                    ),
                    closedFillColor:
                        vm.isDark() ? const Color(0xFF141922) : Colors.white,
                    closedSuffixIcon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: vm.isDark() ?const Color(0xFF5D9CEC):const Color(0xFF5D9CEC),
                    ),
                    expandedFillColor:
                        vm.isDark() ? const Color(0xFF141922) : Colors.white,
                    expandedSuffixIcon: Icon(
                      Icons.keyboard_arrow_up_rounded,
                      color: vm.isDark() ? const Color(0xFF5D9CEC) : const Color(0xFF5D9CEC),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                vm.isDark()
                    ? const Text(
                        "Theme",
                        style: TextStyle(
                            fontFamily: "Pop", fontSize: 20, color: Colors.white),
                      )
                    : const Text(
                        "Theme",
                        style: TextStyle(
                            fontFamily: "Pop", fontSize: 20, color: Colors.black),
                      ),
                const SizedBox(
                  height: 10,
                ),
                CustomDropdown(
                  onChanged: (value) {
                    if (value == "Dark") {
                      vm.ChangeTheme(ThemeMode.dark);
                    } else if (value == "Light") {
                      vm.ChangeTheme(ThemeMode.light);
                    }
                  },
                  items: themeList,
                  initialItem: vm.isDark() ? "Dark" : "Light",
                  decoration: CustomDropdownDecoration(

                    closedBorderRadius: BorderRadius.circular(5),
                    closedBorder: Border.all(color: theme.primaryColor),
                    noResultFoundStyle: TextStyle(
                      color: Colors.white
                    ),
                    listItemStyle: TextStyle(color:vm.isDark()? Colors.white: Colors.black),
                    headerStyle: TextStyle(
                      color: vm.isDark()
                          ? const Color(0xFF5D9CEC)
                          : const Color(0xFF5D9CEC),
                    ),
                    closedFillColor:
                        vm.isDark() ? const Color(0xFF141922) : Colors.white,
                    closedSuffixIcon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: vm.isDark() ?  Color(0xFF5D9CEC):const Color(0xFF5D9CEC),
                    ),
                    expandedFillColor:
                        vm.isDark() ? const Color(0xFF141922) : Colors.white,
                    expandedSuffixIcon: Icon(
                      Icons.keyboard_arrow_up_rounded,
                      color: vm.isDark() ? const Color(0xFF141922) : const Color(0xFF5D9CEC),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

  }
}
