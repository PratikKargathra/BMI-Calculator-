import 'package:animator1/pages/Homepage.dart';
import 'package:animator1/pages/Result%20page.dart';
import 'package:animator1/pages/SplashScreen.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "splash",
      routes: {
        "/":(context) => const Homepage(),
        "splash":(context) => const SplashScreen(),
        "result":(context) => const Result(),
      },
    );
  }
}

