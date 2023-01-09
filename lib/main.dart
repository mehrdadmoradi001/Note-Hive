import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_flutter/animals.dart';
import 'package:note_flutter/car.dart';
import 'package:note_flutter/screens/home_screen.dart';
import 'package:note_flutter/student.dart';

void main() async{
  await Hive.initFlutter();
  var box = await Hive.openBox('names');
  Hive.registerAdapter(CarAdapter());
  await Hive.openBox<Car>('carBox');
  Hive.registerAdapter(StudentAdapter());
  await Hive.openBox<Student>('studentBox');
  Hive.registerAdapter(AnimalsAdapter());
  await Hive.openBox<Animals>('animalsBox');

  runApp(Application());
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
