import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_app/core/network_layer/firebase_utils.dart';
import 'package:todo_app_app/core/services/snack_bar_service.dart';
import 'package:todo_app_app/core/widget/custom_text_field.dart';
import 'package:todo_app_app/featutrs/login/pages/login_view.dart';
import 'package:todo_app_app/featutrs/setting_provider.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static const String routeName = "register";

  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<SettingProvider>(context);
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);

    var formkey = GlobalKey<FormState>();
    var nameController = TextEditingController();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var confirmPasswordController = TextEditingController();
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
                title: const Text("Create Account"),
              )
            : AppBar(
                title: const Text("Create Account"),
              ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: mediaQuery.height * 0.15),
                  vm.isDark()
                      ? const Text(
                          "Full Name",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: "Pop",
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )
                      : const Text(
                          "Full Name",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: "Pop",
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                  CustomTextField(
                    controller: nameController,
                    keyboardType: TextInputType.name,
                    hint: "Enter your Full Name",
                    hintColor: Colors.grey.shade700,
                    suffixWidget: const Icon(Icons.person),
                    onValidate: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "you must enter your Full Name";
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 25),
                  vm.isDark()
                      ? const Text(
                          "E-mail",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: "Pop",
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )
                      : const Text(
                          "E-mail",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: "Pop",
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                  CustomTextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    hint: "Enter your e-mail address",
                    hintColor: Colors.grey.shade700,
                    suffixWidget: const Icon(Icons.email_rounded),
                    onValidate: (value) {
                      print(value);
                      if (value == null || value.trim().isEmpty) {
                        return "you must enter your Email";
                      }

                      var regex = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

                      if (!regex.hasMatch(value)) {
                        return "Invalid e-mail address";
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 25),
                  vm.isDark()
                      ? const Text(
                          "Password",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: "Pop",
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )
                      : const Text(
                          "Password",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: "Pop",
                              fontWeight: FontWeight.bold,
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
                        return "you must enter your password !";
                      }

                      var regex = RegExp(
                          r"(?=^.{8,}$)(?=.*[!@#$%^&*]+)(?![.\\n])(?=.*[A-Z])(?=.*[a-z]).*$");

                      if (!regex.hasMatch(value)) {
                        return "The password must include at least \n* one lowercase letter, \n* one uppercase letter, \n* one digit, \n* one special character,\n* at least 6 characters long.";
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 25),
                  vm.isDark()
                      ? const Text(
                          "Confirm Password",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: "Pop",
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )
                      : const Text(
                          "Confirm Password",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: "Pop",
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                  CustomTextField(
                    controller: confirmPasswordController,
                    isPassword: true,
                    maxLines: 1,
                    hint: "Enter your Confirm password",
                    hintColor: Colors.grey.shade700,
                    onValidate: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "you must enter your password !";
                      }

                      if (value != passwordController.text) {
                        return "password not matching";
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 10.0),
                      backgroundColor: theme.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                    ),
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        FirebaseUtils()
                            .createNewAccount(
                          emailController.text,
                          passwordController.text,
                        )
                            .then((value) {
                          if (value == true) {
                            SnackBarService.showSuccessMessage(
                                "Account successfully created");
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              LoginView.routeName,
                              (route) => false,
                            );
                          }
                        });
                      }
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Create Account",
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
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
