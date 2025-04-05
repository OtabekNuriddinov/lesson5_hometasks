import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Batafsil rasm"),
      ),
      body: Center(
        child: Hero(
          tag: "picture",
          child: Image.asset(
              "assets/images/unsplash.jpg",
            width: 300,
            height: 300,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
