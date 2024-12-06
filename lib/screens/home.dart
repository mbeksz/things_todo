import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/constants/color.dart';
import 'package:todo_app/constants/tasktype.dart';
import 'package:todo_app/model/task.dart';
import 'package:todo_app/screens/add_new_task.dart';
import 'package:todo_app/todoitem.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> todos = [
    Task(
        type: Tasktype.notes,
        title: "Ders çalış",
        description: "En az 2 saat ders çalış",
        isCompleted: false),
    Task(
        type: Tasktype.calendar,
        title: "Fitness",
        description: "Günlük 50 dakika fitness",
        isCompleted: false),
    Task(
        type: Tasktype.contest,
        title: "Koşu",
        description: "Haftalık 5 km koşu",
        isCompleted: false),
  ];
  List<Task> completed = [
    Task(
        type: Tasktype.notes,
        title: "Yazılım",
        description: "Flutter öğren",
        isCompleted: true),
    Task(
        type: Tasktype.contest,
        title: "Yüzme",
        description: "Haftalık 1",
        isCompleted: true),
    Task(
        type: Tasktype.calendar,
        title: "İngilizce",
        description: "Günlük 50 kelime",
        isCompleted: true),
  ];

  void addTask(Task newTask) {
    setState(() {
      todos.add(newTask);
    });
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
        home: SafeArea(
      child: Scaffold(
        backgroundColor: HexColor(backgroundColor),
        body: Column(
          children: [
            Container(
              width: deviceWidth,
              height: deviceHeight / 4,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('lib/assets/images/header.png'),
                    fit: BoxFit.cover),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      '${DateTime.now().day} / ${DateTime.now().month} / ${DateTime.now().year}',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Text(
                      'Yapılacaklar Listesi',
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: SingleChildScrollView(
                    child: ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    return TodoItem(
                      task: todos[index],
                    );
                  },
                )),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Tamamlananlar",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: SingleChildScrollView(
                  child: ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: completed.length,
                    itemBuilder: (context, index) {
                      return TodoItem(
                        task: completed[index],
                      );
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AddNewTask(
                            onAddTask: (newTask) => addTask(newTask),
                          )));
                },
                style: ElevatedButton.styleFrom(
                  minimumSize:
                      Size(deviceWidth * 0.8, 50), // genişlik ve yükseklik
                ),
                child: const Text("Yeni görev ekle"),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
