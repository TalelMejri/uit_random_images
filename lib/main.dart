import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "App",
      theme:  ThemeData(primarySwatch: Colors.indigo),
      home: const ImageApp(title: "App"),
    );
  }
}

class ImageApp extends StatefulWidget {
   const ImageApp({super.key,required this.title});

  final String title;
  @override
  State<ImageApp> createState() => _ImageApp();
}

class _ImageApp extends State<ImageApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(title: Text("hello"),),
    );
  }
}