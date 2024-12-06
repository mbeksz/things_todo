import 'package:flutter/material.dart';
import 'package:todo_app/constants/tasktype.dart';
import 'package:todo_app/model/task.dart';

class TodoItem extends StatefulWidget {
  const TodoItem({super.key, required this.task});
  final Task task;
  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: widget.task.isCompleted ? 0.5 : 1,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              widget.task.type == Tasktype.notes
                  ? Image.asset("lib/assets/images/Category_1.png")
                  : widget.task.type == Tasktype.calendar
                      ? Image.asset("lib/assets/images/Category_2.png")
                      : Image.asset("lib/assets/images/Category_3.png"),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      widget.task.title,
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                        decoration: widget.task.isCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                    Text(
                      widget.task.description,
                      style: TextStyle(
                        decoration: widget.task.isCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                  ],
                ),
              ),
              Checkbox(
                  value: widget.task.isCompleted,
                  onChanged: (val) => {
                        setState(() {
                          widget.task.isCompleted = !widget.task.isCompleted;
                          isCheck = val!;
                        })
                      })
            ],
          ),
        ),
      ),
    );
  }
}
