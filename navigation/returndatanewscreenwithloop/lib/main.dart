import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Passing Data',
      home: TodoScreen(
        todos: List.generate(
          20,
          (i) => Todo(
            'Todo ${i + 1}',
            'A factorial of Todo ${i + 1} is ${factorial(i + 1)}',
          ),
        ),
      ),
    ),
  );
}

//Define a todo class
class Todo {
  final String title;
  final String description;

  const Todo(this.title, this.description);
}

//function factorial
int factorial(int i) {
  if (i == 0 || i == 1) {
    return 1;
  } else {
    return i * factorial(i - 1);
  }
}

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key, required this.todos});
  final List<Todo> todos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
      ),
      //passing in the ListView.builder
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todos[index].title),
            // When a user taps the ListTile, navigate to the DetailScreen.
            // Notice that you're not only creating a DetailScreen, you're
            // also passing the current todo through to it.
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(todo: todos[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  // In the constructor, require a Todo.
  const DetailScreen({super.key, required this.todo});

  // Declare a field that holds the Todo.
  final Todo todo;

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(child: Text(todo.description)),
      ),
    );
  }
}
