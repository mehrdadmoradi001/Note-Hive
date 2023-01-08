import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String inputText = '';
  var controller = TextEditingController();

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
              child: Text(inputText,style: TextStyle(fontWeight: FontWeight.bold,),),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  inputText = controller.text;
                });
              },
              child: Text('read from textField'),
            ),
          ],
        ),
      ),
    );
  }
}
