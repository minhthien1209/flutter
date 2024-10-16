import 'package:flutter/material.dart';
import 'package:todoapps/pages/detail_page.dart';
import 'package:todoapps/pages/login.dart';
import 'package:todoapps/pages/theme_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          // logo
          const DrawerHeader(
            child: Center(
              child: Icon(Icons.note),
            ),
          ),

          // home title
          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 25),
            child: ListTile(
              title: Text(
                'H O M E',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              leading: const Icon(
                Icons.home,
              ),
              onTap: () => Navigator.pop(context),
            ),
          ),

          // settings title
          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 0),
            child: ListTile(
              title: Text(
                'D A R K M O D E',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              leading: const Icon(Icons.dark_mode_outlined),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ThemePage(),
                  ),
                );
              },
            ),
          ),

          // calendar
          // Padding(
          //   padding: const EdgeInsets.only(left: 25.0, top: 0),
          //   child: ListTile(
          //     title: const Text('C A L E N D A R'),
          //     leading: const Icon(Icons.calendar_month),
          //     onTap: () {
          //       Navigator.pop(context);
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => const MyHeatMap(),
          //         ),
          //       );
          //     },
          //   ),
          // ),

          // detail
          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 0),
            child: ListTile(
              title: Text(
                'A B O U T',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              leading: const Icon(Icons.chrome_reader_mode_rounded),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AboutPages(),
                  ),
                );
              },
            ),
          ),

          // log out
          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 0),
            child: ListTile(
              title: Text(
                'L O G O U T',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              leading: const Icon(Icons.arrow_circle_left_outlined),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const loginPages(
                      title: '',
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
