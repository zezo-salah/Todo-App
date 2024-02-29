import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_app/featutrs/layout_view.dart';
import 'package:todo_app_app/featutrs/login/pages/login_view.dart';
import 'package:todo_app_app/featutrs/setting_provider.dart';


class SplashView extends StatefulWidget {
  const SplashView({super.key});
  static const String routeName = "Splash";

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, LoginView.routeName);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var mediaqQury = MediaQuery.of(context).size;
    var vm = Provider.of<SettingProvider>(context);

    return Scaffold(
      body: Image.asset(
        vm.isDark()?
         "assets/images/splash_dark_packground.png"
        :"assets/images/splash_packground.png"
        ,
        fit: BoxFit.fill,
        height: mediaqQury.height,
        width: mediaqQury.width,
      ),
    );
  }
}
