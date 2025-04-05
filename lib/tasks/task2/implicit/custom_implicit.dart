import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CustomImplicit(),
    );
  }
}

class CustomImplicit extends StatefulWidget {
  const CustomImplicit({super.key});

  @override
  State<CustomImplicit> createState() => _CustomImplicitState();
}

class _CustomImplicitState extends State<CustomImplicit>
    with SingleTickerProviderStateMixin {
  double size = 100;
  bool isPulsed = true;

  void _startAnim() {
    setState(() {
      size = isPulsed ? 200 : 100;
      isPulsed = !isPulsed;
    });
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 500), _startAnim);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TweenAnimationBuilder(
          curve: Curves.bounceOut,
          onEnd: _startAnim,
          tween: Tween<double>(begin: 100, end: isPulsed?200:100),
          duration: Duration(milliseconds: 500),
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/heart-Photoroom.png"))
            ),
          ),
          builder: (_, value, child) {
            return SizedBox(
              width: value,
              height: value,
              child: child,
            );
          },
        ),
      ),
    );
  }
}
