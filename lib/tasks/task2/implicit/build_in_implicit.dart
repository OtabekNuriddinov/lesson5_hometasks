import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BuildInImplicit(),
    );
  }
}

class BuildInImplicit extends StatefulWidget {
  const BuildInImplicit({super.key});

  @override
  State<BuildInImplicit> createState() => _BuildInImplicitState();
}

class _BuildInImplicitState extends State<BuildInImplicit> {

  double size = 100;
  bool isPulsed = true;

  void _startAnim(){
    setState(() {
      size = isPulsed?200:100;
      isPulsed = !isPulsed;
    });
  }


  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), _startAnim);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedContainer(
          curve: Curves.bounceOut,
          width: size,
          height: size,
          onEnd: _startAnim,
            duration: const Duration(milliseconds: 500),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                  image: AssetImage("assets/images/heart-Photoroom.png"),
              )
            ),
      )
    )
    );
  }
}

