import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_flutter/animals.dart';
import '../car.dart';
import '../student.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String inputText = '';
  var controller = TextEditingController();

  var box = Hive.box('names');

  var carBox = Hive.box<Car>('carBox');

  var studentBox = Hive.box<Student>('studentBox');

  var animalsBox = Hive.box<Animals>('animalsBox');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller,
            ),
            Padding(
              padding: EdgeInsets.all(25),
              child: Text(
                box.get(2) ?? 'empty',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                box.put(2,controller.text);
                setState(() {
                });
              },
              child: Text('read from textField'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                textStyle: TextStyle(fontSize: 24),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                //box.put(1, 'mehrdad');
                carBox.put(1, Car(name: 'tesla', topSpeed: 300, price: 12.1212121));
                studentBox.put(2, Student(name: 'Lorex', family: 'esay', grade: 18.8, age: 21));
                animalsBox.put(3, Animals(numSpecies: 11120, numAnySpecies: 89.52487, nameSpecies: 'chili'));
              },
              child: Text('create'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                textStyle: TextStyle(fontSize: 24),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // var text = box.get(1);
                // print(text);
                if(carBox.get(1) == null){
                  return;
                }
                print(carBox.get(1)!.name);
                print(carBox.get(1)!.topSpeed);
                print(carBox.get(1)!.price);

                print(studentBox.get(2)!.name);
                print(studentBox.get(2)!.family);
                print(studentBox.get(2)!.age);
                print(studentBox.get(2)!.grade);

                print(animalsBox.get(3)!.nameSpecies);
                print(animalsBox.get(3)!.numAnySpecies);
                print(animalsBox.get(3)!.numSpecies);
              },
              child: Text('read'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                textStyle: TextStyle(fontSize: 24),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // box.put(1 , 'ZiZi');
                carBox.put(1, Car(name: 'teslaYY', topSpeed: 210, price: 10.5869));
                studentBox.put(2, Student(name: 'Sara', family: 'sosan', grade: 19.785, age: 18));
                animalsBox.put(3, Animals(numSpecies: 50002, numAnySpecies: 8.524, nameSpecies: 'slolo'));
              },
              child: Text('update'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                textStyle: TextStyle(fontSize: 24),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // box.delete(1);
                carBox.delete(1);
                studentBox.delete(2);
                animalsBox.delete(3);
              },
              child: Text('delete'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                textStyle: TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
