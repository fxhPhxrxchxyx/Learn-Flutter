import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('Form info'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: const MyCustomForm(),
      ),
    ));
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  bool texterror = false;
  bool passwordErr = false;
  bool emailErr = false;
  final myText = TextEditingController();
  final myNumber = TextEditingController();
  final myEmail = TextEditingController();
  @override
  void dispose() {
    myText.dispose();
    myNumber.dispose();
    myEmail.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          autofocus: true,
          onEditingComplete: () {
            FocusScope.of(context).nextFocus();
          },
          controller: myText,
          decoration: InputDecoration(
            labelText: 'Name',
            errorText: texterror ? 'Name is required' : null,
          ),
          onChanged: (value) {
            if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
              return setState(() {
                texterror = true;
              });
            }
            return setState(() {
              texterror = false;
            });
          },
        ),
        TextField(
          autofocus: true,
          onEditingComplete: () {
            FocusScope.of(context).nextFocus();
          },
          controller: myNumber,
          decoration: InputDecoration(
            labelText: 'student id',
            errorText: passwordErr ? 'password is required' : null,
          ),
          onChanged: (value) {
            if (!RegExp(r'^[0-9]{11}$').hasMatch(value)) {
              return setState(() {
                passwordErr = true;
              });
            }
            return setState(() {
              passwordErr = false;
            });
          },
        ),
        TextField(
          autofocus: true,
          controller: myEmail,
          decoration: InputDecoration(
            labelText: 'Email',
            errorText: emailErr ? 'Email is required' : null,
          ),
          onChanged: (value) {
            if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
              return setState(() {
                emailErr = true;
              });
            }
            return setState(() {
              emailErr = false;
            });
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: ElevatedButton(
            onPressed: (texterror ||
                    passwordErr ||
                    emailErr ||
                    myText.text.isEmpty ||
                    myNumber.text.isEmpty ||
                    myEmail.text.isEmpty)
                ? null
                : () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          // Retrieve the text the that user has entered by using the TextEditingController.
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(bottom: 10),
                                child: Text(
                                  'Student info',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              Text('Name: ${myText.text}'),
                              Text('Password: ${myNumber.text}'),
                              Text('Email: ${myEmail.text}'),
                            ],
                          ),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Close'))
                          ],
                        );
                      },
                    );
                  },
            child: const Text('Submit'),
          ),
        ),
      ],
    );
  }
}
