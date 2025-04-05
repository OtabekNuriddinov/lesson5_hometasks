import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Transition(),
    );
  }
}

class Transition extends StatefulWidget {
  const Transition({super.key});

  @override
  State<Transition> createState() => _TransitionState();
}

class _TransitionState extends State<Transition>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> curvedAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    curvedAnimation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOutBack,
    );
    animationController.repeat();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment(-1.0, 0.25),
        child: RotationTransition(
          alignment: Alignment.topRight,
          turns: curvedAnimation,
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 4,
            width: MediaQuery.of(context).size.width / 2,
            child: Image.asset("assets/images/rocket.png"),
          ),
        ),
      ),
    );
  }
}
