import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Fulter layout demo',
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Flutter layout demo"),
          ),
          body: const Center(
              child: Text(
            "Hello World",
            textDirection: TextDirection.ltr,
            style: TextStyle(fontSize: 32, color: Colors.black),
          )),
        ));
  }
}
