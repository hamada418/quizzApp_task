import 'package:flutter/material.dart';
import '../Models/shared_data.dart';
import 'home.dart';

class LastPage extends StatefulWidget {
  const LastPage({super.key});

  @override
  State<LastPage> createState() => _LastPageState();
}

class _LastPageState extends State<LastPage> {
  void _finishQuiz() {
    SharedData.instance.score = 0;
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => Home(() {})),
          (Route<dynamic> route) => false,
    );
  }


  @override
  Widget build(BuildContext context) {
    final name = SharedData.instance.name;
    final score = SharedData.instance.score;
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: const Color(0xFF86948F),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  width: 250,
                  color: const Color(0xFFB8E893),
                  child: const Text(
                    "CONGRATULATIONS!!!!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Container(
                width: 300,
                color: const Color(0xFFABBFB8),
                child: Column(
                  children: [
                      Padding(
                      padding:const EdgeInsets.only(top: 10, bottom: 30),
                      child: Text(
                        "hello $name YOUR SCORE IS ",
                        style:const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Text(
                      "$score/3",
                      style:const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFB8E893),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      onPressed: _finishQuiz,
                      child: const Text(
                        'FINISH',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
