import 'package:hive/hive.dart';


part 'task.g.dart';

@HiveType(typeId: 1)
  class Task{
  @HiveField(0)
    final String name;
   @HiveField(1)
   final String type;
   @HiveField(2)
    final int coast;

Task({required this.name, required this.type, required this.coast});
}