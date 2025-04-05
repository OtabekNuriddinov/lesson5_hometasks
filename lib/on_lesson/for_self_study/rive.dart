import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RiveScreen(),
    );
  }
}

class RiveScreen extends StatefulWidget {
  const RiveScreen({super.key});

  @override
  State<RiveScreen> createState() => _RiveScreenState();
}

class _RiveScreenState extends State<RiveScreen> {
  late StateMachineController? _stateMachineController;
  late SMIInput<bool>? _isBubbleBlown; // Animatsiyani boshqarish uchun

  @override
  void initState() {
    super.initState();
    _loadRiveFile();
  }

  void _loadRiveFile() async {
    final file = await RiveFile.asset("assets/animation/bubble_gum_boy.riv");
    final artboard = file.mainArtboard;

    _stateMachineController = StateMachineController.fromArtboard(artboard, "State Machine 1");
    if (_stateMachineController != null) {
      artboard.addController(_stateMachineController!);
      _isBubbleBlown = _stateMachineController!.findInput<bool>("Blow"); // State Machine input nomini tekshiring
    }

    setState(() {});
  }

  void _onTap() {
    if (_isBubbleBlown != null) {
      _isBubbleBlown!.value = true; // Tugma bosilganda bubble ishiriladi
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Rive Interaktiv Misol")),
      body: Center(
        child: GestureDetector(
          onTap: _onTap, // Bosilganda animatsiya ishga tushadi
          child: RiveAnimation.asset(
            "assets/animation/bubble_gum_boy.riv",
            fit: BoxFit.cover,
            onInit: (artboard) {
              final controller = StateMachineController.fromArtboard(artboard, "State Machine 1");
              if (controller != null) {
                artboard.addController(controller);
                _isBubbleBlown = controller.findInput<bool>("Blow"); // Bu yerda input nomi muhim!
              }
            },
          ),
        ),
      ),
    );
  }
}
