import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AddListener(),
    );
  }
}

class AddListener extends StatefulWidget {
  const AddListener({super.key});

  @override
  State<AddListener> createState() => _AddListenerState();
}

class _AddListenerState extends State<AddListener> with SingleTickerProviderStateMixin{

  late AnimationController animationController;
  int i = 0;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this,
      duration: const Duration(seconds: 2)
    );

    animationController.addListener(update);
    animationController.forward();
  }

  void update(){
    setState(() {
      i = (animationController.value * 29979458).round();
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          '$i m/s', style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

