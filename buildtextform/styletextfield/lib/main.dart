import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Flutter validation with style Demo';
    return const MaterialApp(
      title: appTitle,
      home: Scaffold(
        body: MyCustomForm(),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final myController = TextEditingController();
  late FocusNode myFocusNode;
  //late is used to initialize the variable later

  //method to print the value of the text field
  void _printLatestValue() {
    print("Second text field: ${myController.text}");
  }

  @override
  //way1
  //listener to track the input
  void initState() {
    super.initState();
    myController.addListener(_printLatestValue);
    myFocusNode = FocusNode();
  }

  @override
  //prevents memory leaks
  void dispose() {
    myFocusNode.dispose();
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Retrieve text input'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                //to autofocus the text field
                autofocus: true,
                //way2
                //listener to track the input
                onChanged: (text) {
                  print("First text field: $text");
                },
              ),
              TextField(
                focusNode: myFocusNode,
                controller: myController,
              ),
            ],
          ),
        ),
        //to show the value of the text field in the alert dialog
        floatingActionButton: FloatingActionButton(onPressed: () {
          //to focus on the next text field
          myFocusNode.requestFocus();
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(myController.text),
                );
              });
        }));
  }
}
