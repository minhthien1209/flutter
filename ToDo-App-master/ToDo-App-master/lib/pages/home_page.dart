import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todoapps/components/app_color.dart';
import 'package:todoapps/components/my_drawer.dart';
import 'package:todoapps/components/td_search_box.dart';
import 'package:todoapps/data/database.dart';
import 'package:todoapps/pages/proflie_page.dart';
import 'package:todoapps/utils/dialog_box.dart';
import '../utils/todo_title.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required String title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myBox = Hive.box('myBox');
  ToDoDatabase db = ToDoDatabase();
  TextEditingController searchController = TextEditingController();
  late List<dynamic> listTodo;
  late List<dynamic> searchList;

  @override
  void initState() {
    if (_myBox.get("TODOLIST") == null) {
      db.createInintData();
      listTodo = db.toDoList;
    } else {
      db.loadData();
      listTodo = db.toDoList;
    }
    searchList = listTodo;
    super.initState();
  }

  final _controller = TextEditingController();

  //search box
  void search(String value) {
    String valueSearch = value.toLowerCase().trim();
    searchList =
        listTodo.where((element) => element[0].contains(valueSearch)).toList();
    setState(() {});
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateData();
  }

// save new task
  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  //createNewTask
  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSaved: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

// deleteTask

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(
          'TO DO',
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        elevation: 0,
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
            child: Container(
              height: 40,
              width: 40,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset('assets/images/avatar.jpg'),
              ),
            ),
          ),
        ],
      ),
      drawer: const MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TdSearchBox(
                controller: searchController,
                onChanged: search,
              ),
            ),
            const SizedBox(height: 16.0),
            _divider(),
            Expanded(
              child: ListView.builder(
                itemCount: searchList.length,
                itemBuilder: (context, index) {
                  return ToDotile(
                    taskName: searchList[index][0],
                    taskCompleted: searchList[index][1],
                    onChanged: (value) => checkBoxChanged(value, index),
                    deleteFunction: (context) => deleteTask(index),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _divider() {
    return const Divider(
      height: 1.2,
      thickness: 1.2,
      indent: 20.0,
      endIndent: 20.0,
      color: AppColor.grey,
    );
  }
}
