import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_app/core/config/Application_Theme_Manager.dart';
import 'package:todo_app_app/featutrs/layout_view.dart';
import 'package:todo_app_app/featutrs/login/pages/login_view.dart';
import 'package:todo_app_app/featutrs/register/pages/RegisterView.dart';
import 'package:todo_app_app/featutrs/setting_provider.dart';
import 'package:todo_app_app/featutrs/splash/pages/splash_view.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
      create: (context) => SettingProvider(), child: const MyApp()));
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
      builder: EasyLoading.init(builder: BotToastInit()),
      navigatorObservers: [BotToastNavigatorObserver()],
      initialRoute: SplashView.routeName,
      routes: {
        SplashView.routeName: (context) => const SplashView(),
        LayoutView.routeName: (context) => const LayoutView(),
        LoginView.routeName: (context) => const LoginView(),
        RegisterView.routeName: (context) => const RegisterView(),
      },
    );
  }
}
