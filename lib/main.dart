import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resume_builder_app/providers/resume_provider.dart';
import 'package:resume_builder_app/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ResumeProvider>(
          create: (context) => ResumeProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
              elevation: 0,
              foregroundColor: Colors.black,
              backgroundColor: Colors.white,
              centerTitle: true,
              toolbarTextStyle: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              )),
          textTheme: const TextTheme(
            bodyText1: TextStyle(
              fontSize: 12,
            ),
            headline1: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            headline2: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
