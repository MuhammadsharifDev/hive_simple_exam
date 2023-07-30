import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:use_hive/data/task.dart';
import 'package:use_hive/home/home_page.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentary=await getApplicationDocumentsDirectory();
  Hive.init(appDocumentary.path);
  await Hive.openBox("myBox");
  Hive.registerAdapter(TaskAdapter());
  await Hive.openBox("taskType");
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
             home: HiveExamplePage(),
    );
  }
}

