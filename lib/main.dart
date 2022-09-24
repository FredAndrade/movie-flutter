import 'package:flutter/material.dart';
import 'package:movie_app/home/home.dart';

void main()=>
    runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark,
          primaryColor: Colors.green),
    );
  }
}
