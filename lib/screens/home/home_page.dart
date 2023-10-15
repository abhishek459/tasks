import 'package:flutter/material.dart';
import 'package:tasks/screens/home/task_input_form.dart';
import 'package:tasks/screens/home/tasks_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  /// Opens task input form which holds all the input fields
  _openTaskInputForm(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return const TaskInputForm();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: TaskList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openTaskInputForm(context),
        child: const Icon(Icons.add, size: 28),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
