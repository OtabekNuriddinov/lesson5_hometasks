import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BallBounce(),
    );
  }
}

class BallBounce extends StatefulWidget {
  const BallBounce({super.key});

  @override
  State<BallBounce> createState() => _BallBounceState();
}

class _BallBounceState extends State<BallBounce> {
  double _topPadding = 50;
  bool _goingDown = true;

  void _startAnimation() {
    setState(() {
      _topPadding = _goingDown ? 400 : 50;
      _goingDown = !_goingDown;
    });
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), _startAnimation);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedContainer(
          onEnd: _startAnimation,
          duration: Duration(milliseconds: 700),
          curve: Curves.bounceOut,
          padding: EdgeInsets.only(top: _topPadding),
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/ball.jpg"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
