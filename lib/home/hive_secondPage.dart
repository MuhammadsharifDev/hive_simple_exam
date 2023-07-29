import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:use_hive/data/task.dart';

class HiveSecondPage extends StatefulWidget {
  const HiveSecondPage({super.key});

  @override
  State<HiveSecondPage> createState() => _HiveSecondPageState();
}

class _HiveSecondPageState extends State<HiveSecondPage> {
  TextEditingController namedController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController coastController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var taskType = Hive.box("taskType");
    return Scaffold(
      appBar: AppBar(
        title: Text('Hive_second_page'),
        actions:[
          IconButton(onPressed: (){
            setState(() {
            });
          }, icon: Icon(Icons.delete,color: Colors.red,))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            TextField(
              controller: namedController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: typeController,
              decoration: const InputDecoration(
                labelText: 'Type',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: coastController,
              decoration: const InputDecoration(
                labelText: 'coast',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: taskType.values.length,
                itemBuilder: (context, index) {
                  List<Task> item = taskType.values.toList().cast();
                  return ListTile(
                    title: Text(item[index].name),
                    subtitle: Text(item[index].type),

                  );
                }
                ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {

          });
         // namedController.clear();
         // typeController.clear();
         // coastController.clear();

          taskType.add(Task(name:namedController.text, type: typeController.text, coast: int.parse(coastController.text)));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}