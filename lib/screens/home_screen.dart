import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String inputText = '';
  var controller = TextEditingController();

  var box = Hive.box('names');


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
                box.put(1, 'mehrdad');
              },
              child: Text('create'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                textStyle: TextStyle(fontSize: 24),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                var text = box.get(1);
                print(text);
              },
              child: Text('read'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                textStyle: TextStyle(fontSize: 24),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                box.put(1 , 'ZiZi');
              },
              child: Text('update'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                textStyle: TextStyle(fontSize: 24),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                box.delete(1);
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
