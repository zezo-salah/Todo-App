
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_app/config/constants/Application_Theme_Manager.dart';
import 'package:todo_app_app/featutrs/layout_view.dart';
import 'package:todo_app_app/featutrs/setting_provider.dart';
import 'package:todo_app_app/featutrs/splash/pages/splash_view.dart';

void main() {
  runApp(ChangeNotifierProvider(

      create: (context) => SettingProvider(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<SettingProvider>(context);
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      theme: ApplicationThemeManager.lightTheme,
      themeMode: vm.currentTheme,
      darkTheme: ApplicationThemeManager.darkTheme,
      title: 'Flutter Demo',

     initialRoute: LayoutView.routeName,
      routes: {
        SplashView.routeName : (context)=> const SplashView(),
        LayoutView.routeName :(context) => const LayoutView()
      },

    );
  }
}

