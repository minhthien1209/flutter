import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:todoapps/components/app_button.dart';
import 'package:todoapps/components/app_textfield.dart';
import 'package:todoapps/data/database.dart';
import 'package:todoapps/pages/home_page.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key, required this.title});
  final String title;
  @override
  State<ChangePassword> createState() => _loginPagesState();
}

class _loginPagesState extends State<ChangePassword> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();
   late Box<User> userBox;

  @override
  void initState() {
    super.initState();
    _openBox();
  }

  Future<void> _openBox() async {
    userBox = await Hive.openBox<User>('userBox');
  }

  void _changePassword() async {
    String username = usernameController.text.trim();
    String currentPassword = currentPasswordController.text.trim();
    String newPassword = newPasswordController.text.trim();
    String confirmNewPassword = confirmNewPasswordController.text.trim();

    User? user = userBox.get(username);

    if (user != null && user.password == currentPassword) {
      if (newPassword == confirmNewPassword) {
        userBox.put(username, User(username: username, password: newPassword));
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Change password success')),
        );
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage(title: 'Home')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('New passwords do not match')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid username or current password')),
      );
    }
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
                      "Change Password",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Username",
                        style: TextStyle(color: Colors.blue, fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: AppTextField(
                        controller: usernameController,
                        prefixicon: const Icon(Icons.accessibility, color: Colors.grey),
                        hintText: "Enter Username",
                        textInputAction: TextInputAction.next,
                        isPasswords: false,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Current Password",
                        style: TextStyle(color: Colors.blue, fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: AppTextField(
                        controller: currentPasswordController,
                        isPasswords: true,
                        prefixicon: const Icon(Icons.lock, color: Colors.grey),
                        hintText: "Enter Current Password",
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "New Password",
                        style: TextStyle(color: Colors.blue, fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: AppTextField(
                        controller: newPasswordController,
                        isPasswords: true,
                        prefixicon: const Icon(Icons.lock, color: Colors.grey),
                        hintText: "Enter New Password",
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Confirm New Password",
                        style: TextStyle(color: Colors.blue, fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: AppTextField(
                        controller: confirmNewPasswordController,
                        isPasswords: true,
                        prefixicon: const Icon(Icons.lock, color: Colors.grey),
                        hintText: "Confirm New Password",
                        textInputAction: TextInputAction.done,
                      ),
                    ),
                    const SizedBox(height: 100),
                    FractionallySizedBox(
                      widthFactor: 0.4,
                      child: AppTextButton(
                        onpress: _changePassword,
                        text: "Change Password",
                        textColor: Colors.white,
                        color: Colors.blue,
                        borderColor: Colors.blue,
                        height: 50,
                      ),
                    ),
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
