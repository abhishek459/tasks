import 'package:flutter/material.dart';
import 'package:tasks/configurations/isar_service.dart';
import 'package:tasks/models/task.dart';
import 'package:tasks/widgets/glassmorphic_container.dart';
import 'package:tasks/widgets/my_padding.dart';
import 'package:tasks/widgets/my_textfield.dart';

class TaskInputForm extends StatefulWidget {
  const TaskInputForm({super.key});

  @override
  State<TaskInputForm> createState() => _TaskInputFormState();
}

class _TaskInputFormState extends State<TaskInputForm> {
  final TextEditingController titleController = TextEditingController();
  final FocusNode titleFocusNode = FocusNode();

  final TextEditingController descriptionController = TextEditingController();
  final FocusNode descriptionFocusNode = FocusNode();
  late IsarService _isarService;

  @override
  void initState() {
    _isarService = IsarService();
    super.initState();
  }

  closeModal() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      radiusTopRight: true,
      radiusTopLeft: true,
      start: 0.75,
      end: 0.75,
      child: Padding(
        padding: EdgeInsets.only(
          top: 16,
          left: 16,
          right: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom + 16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Add a task', style: TextStyle(fontSize: 24)),
            const MyPadding(heightInPercentage: 2),
            MyTextField(
              labelText: 'Title',
              controller: titleController,
              focusNode: titleFocusNode,
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.words,
            ),
            const MyPadding(heightInPercentage: 2),
            MyTextField(
              labelText: 'Description',
              controller: descriptionController,
              focusNode: descriptionFocusNode,
              maxLines: 3,
              textInputAction: TextInputAction.done,
              textCapitalization: TextCapitalization.sentences,
            ),
            const MyPadding(heightInPercentage: 2),
            // DateRangePickerDialog(firstDate: DateTime.now(),lastDate: DateTime(2023,12,31),),
            // DatePickerDialog(initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime(DateTime.now().year, 31 , 12)),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () async {
                  await _isarService.saveTask(Task(
                    title: titleController.text,
                    description: descriptionController.text,
                    createdDate: DateTime.now(),
                  ));
                  closeModal();
                },
                child: const Text('Create'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
