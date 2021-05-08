import 'package:flutter/material.dart';
import 'package:patterns_last_lesson/base/pages/home_page.dart';

class BaseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Base',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: HomePage(),
      routes: {
        HomePage.id: (context) => HomePage(),
      },
    );
  }
}
