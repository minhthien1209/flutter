import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoapps/components/app_color.dart';
import 'package:todoapps/models/user_model.dart';
import 'package:todoapps/pages/changepassword.dart';
import 'package:todoapps/services/shared_prefs.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  SharedPrefs prefs = SharedPrefs();
  UserModel user = UserModel();
  bool gender = false;

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  void _getUser() {
    prefs.getUser().then((value) {
      user = value ?? UserModel();
      nameController.text = user.name ?? '';
      ageController.text = '${user.age ?? 0}';
      gender = user.gender ?? false;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Profile',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          backgroundColor: Theme.of(context).colorScheme.secondary,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/avatar.jpg'),
                  ),
                  const SizedBox(height: 50.0),
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 4.0),
                      hintText: 'Name',
                      labelText: 'Name',
                      labelStyle: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 20.0),
                  TextField(
                    controller: ageController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 4.0),
                      hintText: 'Age',
                      labelText: 'Age',
                      labelStyle: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                    textInputAction: TextInputAction.done,
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Gender',
                        style: TextStyle(color: Colors.red, fontSize: 16.0),
                      ),
                      GestureDetector(
                        onTap: () => setState(() => gender = !gender),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, top: 3.2, bottom: 6.0),
                          child: Icon(
                            gender
                                ? Icons.check_box_outlined
                                : Icons.check_box_outline_blank,
                            size: 18.0,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 46.0),
                  ElevatedButton(
                    onPressed: () {
                      int age = 0;
                      try {
                        age = int.parse(ageController.text.trim());
                      } catch (_) {}

                      final user = UserModel()
                        ..name = nameController.text.trim()
                        ..age = age
                        ..gender = gender;

                      prefs.saveUser(user);
                    },
                    child: const Text(
                      'Save',
                      style: TextStyle(color: AppColor.blue, fontSize: 16.8),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ChangePassword(title: '')));
                    },
                    child: const Text(
                      'Change Password',
                      style: TextStyle(color: AppColor.orange),
                    ),
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
