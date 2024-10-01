import 'package:flutter/material.dart';

import '../Models/shared_data.dart';
import 'question.dart';

class NameContainer extends StatefulWidget {
  const NameContainer({super.key});

  @override
  State<NameContainer> createState() => _NameContainerState();
}

class _NameContainerState extends State<NameContainer> {
  final _nameController = TextEditingController();

  void _submitName() {
    if (_nameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter your name before starting.'),
          backgroundColor: Colors.redAccent,
        ),
      );
    } else {
      SharedData.instance.name = _nameController.text;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const Question(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
              width: 160,
              color: const Color(0xFFB8E893),
              child: const Text(
                "WELCOME",
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
            color: const Color(0xFFABBFB8),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 30),
                  child: Text(
                    "Please Enter Your Name",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      width: 300,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: TextField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(10),
                        ),
                      ),
                    ),
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
                  onPressed: _submitName,
                  child: const Text('SUBMIT',
                      style: TextStyle(
                        color: Colors.black,
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
