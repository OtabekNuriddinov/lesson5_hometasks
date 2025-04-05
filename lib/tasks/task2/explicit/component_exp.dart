import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ComponentExp(),
    );
  }
}

class ComponentExp extends StatefulWidget {
  const ComponentExp({super.key});

  @override
  State<ComponentExp> createState() => _ComponentExpState();
}

class _ComponentExpState extends State<ComponentExp> with SingleTickerProviderStateMixin{

  late AnimationController animationController;
  late CurvedAnimation curvedAnimation;
  late Animation<double>animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this,
      duration: Duration(milliseconds: 500)
    );

    curvedAnimation = CurvedAnimation(parent: animationController, curve: Curves.bounceOut);

    animation = Tween<double>(begin: 1.0, end: 1.5).animate(curvedAnimation);

    animationController.repeat(reverse: true);
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
        child: HeartPulsed(
            animation: animation,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/heart-Photoroom.png"),
                  )
              ),
            ),
        ),
      ),
    );
  }
}

class HeartPulsed extends AnimatedWidget{
  final Widget child;

  HeartPulsed({super.key, required this.child, required Animation<double>animation }):super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Transform.scale(
      scale: animation.value,
      child: child,
    );
  }
}

