import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:todoapps/components/app_button.dart';
import 'package:todoapps/components/app_color.dart';
import 'package:todoapps/components/app_textfield.dart';
import 'package:todoapps/data/database.dart';
import 'package:todoapps/pages/login.dart';

class register extends StatefulWidget {
  const register({super.key, required this.title});
  final String title;
  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  TextEditingController uesnameController = TextEditingController();
  TextEditingController passwordsNewController = TextEditingController();
  TextEditingController passwordsNewConfirmController = TextEditingController();
  late Box<User> userBox;
  @override
  void initState() {
    super.initState();
    _openBox();
  }

  Future<void> _openBox() async {
    userBox = await Hive.openBox<User>('userBox');
  }

  void _register() async {
    String username = uesnameController.text.trim();
    String password = passwordsNewController.text.trim();
    String confirmPassword = passwordsNewConfirmController.text.trim();

    if (username.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields')),
      );
      return;
    }

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Passwords do not match')),
      );
      return;
    }

    User? existingUser = userBox.get(username);
    if (existingUser != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Username already exists')),
      );
      return;
    }

    User newUser = User(username: username, password: password);
    await userBox.put(username, newUser);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Registration successful')),
    );

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const loginPages(title: 'Login')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      "Register",
                      style: TextStyle(
                          color: AppColor.blue,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Username",
                        style: TextStyle(color: AppColor.blue, fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: AppTextField(
                        controller: uesnameController,
                        prefixicon: const Icon(Icons.accessibility,
                            color: AppColor.grey),
                        hintText: "Enter Username",
                        textInputAction: TextInputAction.next,
                        isPasswords: false,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Password",
                        style: TextStyle(color: AppColor.blue, fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: AppTextField(
                        controller: passwordsNewController,
                        isPasswords: true,
                        prefixicon:
                            const Icon(Icons.ac_unit, color: AppColor.grey),
                        hintText: "Enter Password",
                        textInputAction: TextInputAction.done,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Confirm Password",
                        style: TextStyle(color: AppColor.blue, fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: AppTextField(
                        controller: passwordsNewConfirmController,
                        isPasswords: true,
                        prefixicon:
                            const Icon(Icons.ac_unit, color: AppColor.grey),
                        hintText: "Enter Confirm Password",
                        textInputAction: TextInputAction.done,
                      ),
                    ),
                    const SizedBox(height: 100),
                    FractionallySizedBox(
                      widthFactor: 0.4,
                      child: AppTextButton(
                        onpress: _register,
                        text: "Next",
                        textColor: AppColor.white,
                        color: Colors.blue,
                        borderColor: AppColor.blue,
                        height: 50,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
