import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_2/Provider/todo_provider.dart';

import '../Model/todo_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  TextEditingController txtname = TextEditingController();
  TextEditingController txtstd = TextEditingController();

  TextEditingController dtxtname = TextEditingController();
  TextEditingController dtxtstd = TextEditingController();

  TodoProvider? todoProvider;

  @override
  Widget build(BuildContext context) {
    todoProvider = Provider.of<TodoProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor:  Color(0xFF000000),
          centerTitle: true,
          title: const Text(
            "To Do",
            style: TextStyle(
                fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              TextField(
                controller: txtname,
                decoration: const InputDecoration(
                  label:
                      Text("Name", style: TextStyle(color: Color(0xFF000000))),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFF000000), width: 1)),
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: txtstd,
                decoration: const InputDecoration(
                  label: Text(
                    "Std",
                    style: TextStyle(color: Color(0xFF000000)),
                  ),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFF000000), width: 1)),
                ),
              ),
              const SizedBox(height: 15),
              Align(
                alignment: Alignment.bottomCenter,
                child: FloatingActionButton(
                  backgroundColor: const Color(0xFF000000),
                  onPressed: () {
                    TodoModel r1 =
                        TodoModel(name: txtname.text, std: txtstd.text);
                    todoProvider!.addData(r1);
                  },
                  child: const Icon(Icons.add),
                ),
              ),
              Expanded(
                child: Consumer<TodoProvider>(
                  builder: (context, value, child) => Expanded(
                    child: ListView.builder(
                      itemCount: todoProvider!.l1.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text("${todoProvider!.l1[index].name}",
                              style: const TextStyle(color: Color(0xFF000000))),
                          subtitle: Text("${todoProvider!.l1[index].std}",
                              style: const TextStyle(color: Color(0xFF000000))),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {
                                  todoProvider!.delete(index);
                                },
                                icon: const Icon(Icons.delete),
                              ),
                              IconButton(
                                onPressed: () {
                                  dtxtname = TextEditingController(
                                      text: todoProvider!.l1[index].name);
                                  dtxtstd = TextEditingController(
                                      text: todoProvider!.l1[index].std);

                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          TextField(
                                            controller: dtxtname,
                                            decoration: const InputDecoration(
                                                border: OutlineInputBorder()),
                                          ),
                                          const SizedBox(height: 5),
                                          TextField(
                                            controller: dtxtstd,
                                            decoration: const InputDecoration(
                                                border: OutlineInputBorder()),
                                          ),
                                          const SizedBox(height: 5),
                                          ElevatedButton(
                                            onPressed: () {
                                              TodoModel r1 = TodoModel(
                                                std: dtxtstd.text,
                                                name: dtxtname.text,
                                              );
                                              todoProvider!
                                                  .updateData(index, r1);
                                              Navigator.pop(context);
                                            },
                                            child: const Text("Update"),
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    const Color(0xFF000000)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                icon: const Icon(Icons.edit),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
