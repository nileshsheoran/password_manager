import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PasswordGetScreen extends StatefulWidget {
  const PasswordGetScreen({super.key});

  @override
  State<PasswordGetScreen> createState() => _PasswordGetScreenState();
}

class _PasswordGetScreenState extends State<PasswordGetScreen> {
  String name = 'Facebook';
  List<String> web = ['Facebook', 'Gmail', 'Github', 'Instagram', 'Telegram'];
  String password = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Select tha Website and see tha password'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                DropdownButton<String>(
                  value: name,
                  onChanged: (value) async {
                    name = value!;
                    SharedPreferences data =
                        await SharedPreferences.getInstance();
                    String? password1 = data.getString(value!);
                    password = password1 ?? '-';
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
                Text(
                  'The password is : $password',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
