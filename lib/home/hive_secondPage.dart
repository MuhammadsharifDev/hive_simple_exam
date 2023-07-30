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
          }, icon: const Icon(Icons.delete,color: Colors.red,))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
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
              SizedBox(
                height: 400,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: taskType.values.length,
                    itemBuilder: (context, index) {
                      List<Task> item = taskType.values.toList().cast();
                      return ListTile(
                        title: Text(item[index].name),
                        subtitle: Text(item[index].type),
                        trailing: Text(item[index].coast.toString()),

                      );
                    }
                    ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Task newTask=Task(name: namedController.text,
              type: typeController.text,
              coast: int.parse(coastController.text));
          taskType.add(newTask);

         namedController.clear();
         typeController.clear();
         coastController.clear();


          setState(() {

          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
