import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Hinge(),
    );
  }
}

class Hinge extends StatefulWidget {
  const Hinge({super.key});

  @override
  State<Hinge> createState() => _HingeState();
}

class _HingeState extends State<Hinge> with SingleTickerProviderStateMixin {
  late Animation<double> _rotationAnimation;
  late Animation<double> _slideAnimation;
  late Animation<double> _opacityAnimation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 3000),
    );

    _rotationAnimation = Tween(end: 0.15, begin: 0.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.0, 0.5, curve: Curves.bounceInOut),
    ),
    );
    _slideAnimation = Tween(begin: 100.0, end: 600.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    ));

    _opacityAnimation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    ),
    );

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _slideAnimation,
        builder: (ctx, ch) => Container(
          width: 220,
          height: 100,
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.only(left: 75, top: _slideAnimation.value),
          child: RotationTransition(
            turns: _rotationAnimation,
            child: Center(
              child: Text(
                'Animation',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(0, 0, 128, _opacityAnimation.value),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
