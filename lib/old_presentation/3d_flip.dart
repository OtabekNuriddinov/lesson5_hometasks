import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Flip3D(),
    );
  }
}

class Flip3D extends StatefulWidget {
  const Flip3D({super.key});

  @override
  State<Flip3D> createState() => _Flip3DState();
}

class _Flip3DState extends State<Flip3D> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _myAnimation;
  late AnimationStatus _animationStatus = AnimationStatus.dismissed;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _myAnimation = Tween(begin: 0.0, end: 1.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          print("Animatsiya tugadi!");
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });

  }

  void playRepeat(){
    setState(() {
      _controller.repeat();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Stack(
                children: [
              Container(
                color: Colors.blueAccent,
                width: 250,
                height: 250,
              ),
              Positioned(
                left: 25,
                top: 10,
                child: Transform(
                  alignment: FractionalOffset.center,
                  transform: Matrix4.identity()
                    // ..setEntry(3, 2, 0.002)
                    ..rotateX(6.28 * (_myAnimation.value)),
                  child: Container(
                    color: Colors.blueAccent,
                    width: 200,
                    height: 200,
                    child: Icon(
                      Icons.accessibility_new,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                ),
              ),
            ]),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
                width: 100,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent
                  ),
                    onPressed: (){
                    setState(() {
                      _controller.repeat();
                    });
                    },
                    child: Text("Repeat", style: TextStyle(color: Colors.white),),
                ),
              ),
              SizedBox(width: 10),
              SizedBox(
                height: 50,
                width: 100,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent
                  ),
                  onPressed: (){
                    setState(() {
                      _controller.forward();
                      _controller.reverse();
                    });
                  },
                  child: Text("Forward", style: TextStyle(color: Colors.white),),
                ),
              ),
              SizedBox(width: 10),
              SizedBox(
                height: 50,
                width: 100,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent
                  ),
                  onPressed: (){
                    setState(() {
                      _controller.stop();
                    });
                  },
                  child: Text("Stop", style: TextStyle(color: Colors.white),),
                ),
              ),
            ],
          )
        ],
      ),

    );
  }
}
