import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/constants/color.dart';
import 'package:todo_app/constants/tasktype.dart';
import 'package:todo_app/model/task.dart';

class AddNewTask extends StatefulWidget {
  const AddNewTask({super.key, required this.onAddTask});
  final void Function(Task newTask) onAddTask;

  @override
  State<AddNewTask> createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();
  Tasktype taskType = Tasktype.notes;

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor(backgroundColor),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: deviceWidth,
                height: deviceHeight / 10,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('lib/assets/images/add_task_header.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    const Center(
                      child: Text(
                        "Yeni Görev Ekle",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft, // Sol ortalama
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back_ios),
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text("Görev Başlığı")),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text("Kategoriler"),
                    GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            duration: Duration(microseconds: 500),
                            content: Text("Kategori 1 seçildi"),
                          ),
                        );
                        setState(() {
                          taskType = Tasktype.notes;
                        });
                      },
                      child: Image.asset("lib/assets/images/Category_1.png"),
                    ),
                    GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            duration: Duration(microseconds: 500),
                            content: Text("Kategori 2 seçildi"),
                          ),
                        );
                        setState(() {
                          taskType = Tasktype.calendar;
                        });
                      },
                      child: Image.asset("lib/assets/images/Category_2.png"),
                    ),
                    GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            duration: Duration(microseconds: 500),
                            content: Text("Kategori 3 seçildi"),
                          ),
                        );
                        setState(() {
                          taskType = Tasktype.contest;
                        });
                      },
                      child: Image.asset("lib/assets/images/Category_3.png"),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        const Text("Başlangıç Tarihi"),
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: TextField(
                              controller: startDateController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        const Text("Başlangıç Saati"),
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: TextField(
                              controller: startTimeController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ))
                      ],
                    ),
                  )
                ],
              ),
              const Padding(
                  padding: EdgeInsets.only(top: 20), child: Text("Açıklama")),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: SizedBox(
                  height: 300,
                  child: TextField(
                    controller: descriptionController,
                    expands: true,
                    maxLines: null,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      isDense: true,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                    onPressed: () {
                      Task newTask = Task(
                          type: taskType,
                          title: titleController.text,
                          description: descriptionController.text,
                          isCompleted: false);
                      widget.onAddTask(newTask);
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize:
                          Size(deviceWidth * 0.8, 50), // genişlik ve yükseklik
                    ),
                    child: const Text("Kaydet")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
