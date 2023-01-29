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
        //change body to buildColumn() to see the column layout
        body: Center(child: buildRow()),
      ),
    );
  }
}

Widget buildRow() =>
    Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Image.asset('images/pic1.jpg'),
      Image.asset('images/pic2.jpg'),
      Image.asset('images/pic3.jpg'),
    ]);

Widget buildColumn() => Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset('images/pic1.jpg'),
        Image.asset('images/pic2.jpg'),
        Image.asset('images/pic3.jpg'),
      ],
    );
