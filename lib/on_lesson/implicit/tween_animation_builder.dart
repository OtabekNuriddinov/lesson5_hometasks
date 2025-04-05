import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TweenAnimation(),
    );
  }
}

class TweenAnimation extends StatefulWidget {
  const TweenAnimation({super.key});

  @override
  State<TweenAnimation> createState() => _TweenAnimationState();
}

class _TweenAnimationState extends State<TweenAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TweenAnimationBuilder<Color?>(
            tween: ColorTween(begin: Colors.white, end: Colors.yellow),
            duration: const Duration(seconds: 2),
            child: const FlutterLogo(size: 200),
            builder: (_, Color? color, child){
              return ColorFiltered(
                  colorFilter: ColorFilter.mode(color!, BlendMode.modulate),
                  child: child
              );
            },
        ),
      ),
    );
  }
}
