import 'package:flutter/material.dart';

void main(){
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

class _CustomImplicitState extends State<CustomImplicit> {

  bool isDropped = true;

  void _isStarted(){
    setState(() {
      isDropped = !isDropped;
    });
  }


  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), _isStarted);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: TweenAnimationBuilder(
          curve: Curves.bounceOut,
          onEnd: _isStarted,
            tween: Tween(begin: 50.0, end: isDropped?400.0 : 50.0),
            duration: Duration(milliseconds: 700),
            builder: (_, value, child){
              return Padding(
                  padding: EdgeInsets.only(top: value),
                child: child,
              );
            },
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
      )
    );
  }
}
