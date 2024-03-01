import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_app/core/network_layer/firebase_utils.dart';
import 'package:todo_app_app/core/services/snack_bar_service.dart';
import 'package:todo_app_app/core/widget/custom_text_field.dart';
import 'package:todo_app_app/featutrs/layout_view.dart';
import 'package:todo_app_app/featutrs/register/pages/RegisterView.dart';
import 'package:todo_app_app/featutrs/setting_provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const String routeName = "login";
  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<SettingProvider>(context);
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);

    var formKey = GlobalKey<FormState>();

    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return Container(
      decoration: BoxDecoration(
        color: vm.isDark() ? const Color(0xFF141922) : const Color(0xFFDFECDB),
        image: const DecorationImage(
            image: AssetImage("assets/images/pattern.png"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: vm.isDark()
            ? AppBar(
                title: const Text("Login"),
              )
            : AppBar(
                title: const Text("Login"),
              ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: mediaQuery.height * 0.18),
                  vm.isDark()
                      ? const Text(
                          "Welcome back!",
                          style: TextStyle(
                              fontSize: 24,
                              fontFamily: "Pop",
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )
                      : const Text(
                          "Welcome back!",
                          style: TextStyle(
                              fontSize: 24,
                              fontFamily: "Pop",
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                  const SizedBox(height: 40),
                  vm.isDark()
                      ? const Text(
                          "E-mail",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 17,
                              fontFamily: "Pop",
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        )
                      : const Text(
                          "E-mail",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 17,
                              fontFamily: "Pop",
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                  CustomTextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    hint: "Enter your e-mail address",
                    hintColor: Colors.grey.shade700,
                    suffixWidget: const Icon(Icons.email_rounded),
                    onValidate: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "you must enter your e-mail address";
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 30),
                  vm.isDark()
                      ? const Text(
                          "Password",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 17,
                              fontFamily: "Pop",
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        )
                      : const Text(
                          "Password",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 17,
                              fontFamily: "Pop",
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                  CustomTextField(
                    controller: passwordController,
                    isPassword: true,
                    maxLines: 1,
                    hint: "Enter your password",
                    hintColor: Colors.grey.shade700,
                    onValidate: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "you must enter password";
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 50),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 8.0),
                      backgroundColor: theme.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        FirebaseUtils()
                            .signIN(
                                emailController.text, passwordController.text)
                            .then((value) {
                          if (value) {
                            SnackBarService.showSuccessMessage(
                                "Your logged in successfully");
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              LayoutView.routeName,
                              (route) => false,
                            );
                          }
                        });
                      }
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Login",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                fontFamily: "Pop",
                                color: Colors.white)),
                        Icon(
                          Icons.arrow_forward,
                          size: 30,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      vm.isDark()
                          ? const Text(
                              "OR",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  fontFamily: "Pop",
                                  color: Colors.white),
                            )
                          : const Text(
                              "OR",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  fontFamily: "Pop",
                                  color: Colors.black),
                            ),
                      const SizedBox(width: 10),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            RegisterView.routeName,
                          );
                        },
                        child: vm.isDark()
                            ? const Text(
                                "Create new account !",
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    decorationColor: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    fontFamily: "Pop",
                                    color: Colors.white),
                              )
                            : const Text(
                                "Create new account !",
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    fontFamily: "Pop",
                                    color: Colors.black),
                              ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
