import 'package:flutter/material.dart';
import 'package:tasks/isar_service.dart';
import 'package:tasks/models/task.dart';
import 'package:tasks/widgets/background_container.dart';
import 'package:tasks/widgets/glassmorphic_container.dart';
import 'package:tasks/widgets/my_padding.dart';

class TaskList extends StatelessWidget {
  TaskList({super.key});
  final IsarService service = IsarService();

  @override
  Widget build(BuildContext context) {
    return BackgroundImageContainer(
      child: StreamBuilder<List<Task>>(
        stream: service.listenToTasks(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show a loading indicator if the stream is still waiting for data.
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Show an error message if an error occurs.
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            // If data is available, display the list of tasks.
            final tasks =
                snapshot.data ?? []; // Get the list of tasks from the snapshot.
            if (tasks.isNotEmpty) {
              return ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  final task = tasks[index];
                  // Build your UI for each task item here.
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: GlassmorphicContainer(
                      start: 0.75,
                      end: 0.75,
                      radiusAll: true,
                      child: TaskTile(task: task),
                    ),
                  );
                },
              );
            } else {
              return const Center();
            }
          }
        },
      ),
    );
  }
}

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: deviceSize.height * 0.01),
      child: Row(
        children: [
          const MyPadding(widthInPercentage: 1),
          TaskCompletedCheckbox(task: task),
          const MyPadding(widthInPercentage: 1),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedDefaultTextStyle(
                  style: task.completed
                      ? const TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                          decoration: TextDecoration.lineThrough,
                        )
                      : const TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          decoration: TextDecoration.none,
                        ),
                  duration: const Duration(milliseconds: 10),
                  curve: Curves.easeInOutExpo,
                  child: Text(
                    task.title,
                  ),
                ),
                const MyPadding(heightInPercentage: 0.5,),
                AnimatedDefaultTextStyle(
                  style: task.completed
                      ? const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w200,
                        )
                      : const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                  duration: const Duration(milliseconds: 10),
                  curve: Curves.easeInOutExpo,
                  child: Text(
                    task.description,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              IsarService().deleteTask(task.id);
            },
            icon: const Icon(
              Icons.delete_rounded,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}

class TaskCompletedCheckbox extends StatefulWidget {
  const TaskCompletedCheckbox({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  State<TaskCompletedCheckbox> createState() => _TaskCompletedCheckboxState();
}

class _TaskCompletedCheckboxState extends State<TaskCompletedCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: widget.task.completed,
      onChanged: (bool? value) {
        setState(() {
          widget.task.completed = !widget.task.completed;
          IsarService().completeTask(widget.task.id, widget.task.completed);
        });
      },
    );
  }
}
