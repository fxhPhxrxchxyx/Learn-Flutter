import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Form Validation Demo';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
          appBar: AppBar(
            title: const Text(appTitle),
          ),
          body: const Center(
            child: MyCustomForm(),
          )),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  //set key for form
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: Text('Name')),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter some search text',
              ),
            ),
          ),
          //to validate form if it is empty
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Enter your name',
              ),
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    !RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                  return 'Please enter only text';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Enter your student id',
              ),
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')
                        .hasMatch(value)) {
                  return 'Please enter your student id';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
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
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')));
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
