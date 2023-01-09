import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../car.dart';

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
