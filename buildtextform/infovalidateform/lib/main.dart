import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Form Validation info',
      home: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();
  final myController3 = TextEditingController();
  late FocusNode myFocusNode;

  void _printLatestValue() {
    print("My name is: ${myController1.text}" +
        "\nStudent id is: ${myController2.text}" +
        "\nMy email is: ${myController3.text}");
  }

  void initState() {
    super.initState();
    myFocusNode = FocusNode();
    myController1.addListener(_printLatestValue);
    myController2.addListener(_printLatestValue);
    myController3.addListener(_printLatestValue);
  }

  @override
  //prevent memory leak
  void dispose() {
    myFocusNode.dispose();
    myController1.dispose();
    myController2.dispose();
    myController3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Validation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      autofocus: true,
                      focusNode: myFocusNode,
                      //to move to next textfield
                      onEditingComplete: () {
                        FocusScope.of(context).nextFocus();
                      },
                      controller: myController1,
                      decoration: const InputDecoration(
                        labelText: 'Enter your name',
                      ),
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            !RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      autofocus: true,
                      onEditingComplete: () {
                        FocusScope.of(context).nextFocus();
                      },
                      controller: myController2,
                      decoration: const InputDecoration(
                        labelText: 'Enter your student id',
                      ),
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            !RegExp(r'^[0-9]{11}$').hasMatch(value)) {
                          return 'Please enter your 11 digit student id';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      autofocus: true,
                      controller: myController3,
                      decoration: const InputDecoration(
                        labelText: 'Enter your email',
                      ),
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                .hasMatch(value)) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                    Padding(
                      //symmetric is used to give padding to both sides only
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: ElevatedButton(
                        onPressed: () {
                          //snackbar is used to show the message
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Data Save!')),
                            );
                            myFocusNode.requestFocus();
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text('Form Data'),
                                    content: Text("My name is: ${myController1.text}" +
                                        "\nStudent id is: ${myController2.text}" +
                                        "\nMy email is: ${myController3.text}"),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('Close'))
                                    ],
                                  );
                                });
                          }
                        },
                        child: const Text('Submit'),
                      ),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
