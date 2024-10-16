import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:todoapps/data/database.dart';
import 'package:todoapps/pages/splash.dart';
import 'package:todoapps/themes/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // init th hive
  await Hive.initFlutter();

// open the box
  var box = await Hive.openBox('myBox');
  // hive login

  Hive.registerAdapter(UserAdapter());
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(context),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashPage(
        title: '',
      ),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
