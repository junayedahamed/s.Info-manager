import 'package:flutter/material.dart';
import 'package:sinfo/src/home/profile/profile.dart';
import 'package:sinfo/src/theme/theme.dart';
import 'package:sinfo/src/toggler/togglr.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: MyTheme.instance,
        builder: (context, snapshot) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: MyTheme.instance.theme,
            showSemanticsDebugger: false,
            darkTheme: ThemeData.dark(),
            title: 'Student Info sys',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: Profile(),
          );
        });
  }
}
