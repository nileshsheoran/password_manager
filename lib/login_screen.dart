import 'package:flutter/material.dart';
import 'package:login_sign_screen/password_save_screen.dart';
import 'package:login_sign_screen/signUp_screen.dart';
import 'package:login_sign_screen/welcome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login Screen'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    hintText: 'Enter name',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    hintText: 'Enter Password',
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    login();
                  },
                  child: const Text('Login'),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const SignUp();
                      }));
                    },
                    child: const Text('SignUp')),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> login() async {
    String name = (nameController.text);
    String password = (passwordController.text);
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? name1 = pref.getString('name');
    String? password1 = pref.getString('password');
    if (name == name1 && password == password1) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return PasswordSaveScreen();
      }));
    } else {
      Fluttertoast.showToast(
        msg: "Invalid Name or Password",
      );
    }
  }
}
