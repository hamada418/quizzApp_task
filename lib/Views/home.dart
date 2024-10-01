import 'package:flutter/material.dart';
import 'name_container.dart';

class Home extends StatelessWidget {
  const Home(this.switchScreen, {super.key});
  final void Function() switchScreen;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF86948F),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Text(
                  "Quiz",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Image.asset(
                "Assets/Image/Ellipse 1.png",
                height: 200,
                width: 200,
              ),
              const SizedBox(height: 50),
              const NameContainer(),
            ],
          ),
        ),
      ),
    );
  }
}
