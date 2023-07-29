import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:use_hive/home/hive_secondPage.dart';

class HiveExamplePage extends StatefulWidget {
  const HiveExamplePage({super.key});

  @override
  State<HiveExamplePage> createState() => _HiveExamplePageState();
}

class _HiveExamplePageState extends State<HiveExamplePage> {
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
   var box=Hive.box("myBox");

    return Scaffold(
      appBar: AppBar(
        title: Text('HiveExample'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50,),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20,),
              IconButton(onPressed: (){
                setState(() {
                });
               box.add(nameController.text);
              }, icon: Icon(Icons.add)),
               const SizedBox(height: 20,),
              ListView.builder(

                shrinkWrap: true,
                        itemCount: box.values.length,
                  itemBuilder: (context, index) => Text(box.values.toList()[index]),

              ),
          ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => HiveSecondPage(),));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}