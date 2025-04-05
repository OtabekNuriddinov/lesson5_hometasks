import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2),
        );

    animationController.forward();
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
        child: AnimatedFlutterLogo(
            animation: animationController,
            child: FlutterLogo(),
        ),
      ),
    );
  }
}

class AnimatedFlutterLogo extends AnimatedWidget {
  final Widget child;

  const AnimatedFlutterLogo(
      {super.key, required Animation<double> animation, required this.child})
      : super(listenable: animation);

  static final _opacityTween = Tween<double>(begin: 0.1, end: 1);
  static final _sizeTween = Tween<double>(begin: 0, end: 300);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Opacity(
        opacity: _opacityTween.evaluate(animation),
      child: SizedBox(
        height: _sizeTween.evaluate(animation),
        width: _sizeTween.evaluate(animation),
        child: child,
      ),
    );
  }
}
