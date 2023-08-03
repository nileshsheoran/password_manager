import 'package:flutter/material.dart';
import 'package:login_sign_screen/passwoed_get_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PasswordSaveScreen extends StatefulWidget {
  const PasswordSaveScreen({super.key});

  @override
  State<PasswordSaveScreen> createState() => _PasswordSaveScreenState();
}

class _PasswordSaveScreenState extends State<PasswordSaveScreen> {
  String name = 'Facebook';
  List<String> web = [
    'Facebook',
    'Gmail',
    'Github',
    'Instagram',
    'Telegram',
  ];
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Select the Website'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                DropdownButton<String>(
                  value: name,
                  onChanged: (String? item) {
                    passwordController.clear();
                    name = item!;
                    setState(() {});
                  },
                  items: web.map(
                    (e) {
                      return DropdownMenuItem(
                        child: Text(e),
                        value: e,
                      );
                    },
                  ).toList(),
                ),
                const SizedBox(
                  height: 18,
                ),
                TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                    hintText: 'Enter Password',
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                ElevatedButton(
                  onPressed: () async {
                    String password = passwordController.text;
                    SharedPreferences pref =
                        await SharedPreferences.getInstance();
                    pref.setString(name, password);
                    passwordController.clear();
                    Fluttertoast.showToast(
                      msg: "Saved is successfully",
                    );
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Save'),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Text('goto'),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const PasswordGetScreen();
            }));
          },
        ),
      ),
    );
  }
}
