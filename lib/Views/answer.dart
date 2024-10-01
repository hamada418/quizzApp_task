import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answerText;
  final bool isSelected;
  final void Function() onPressed;
  final Color answerColor;

  const Answer({
    required this.answerText,
    required this.onPressed,
    required this.isSelected,
    super.key,
    required this.answerColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: GestureDetector(
          onTap: onPressed,
          child: Container(
            width: double.infinity,
            height: 30,
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
              color: answerColor,
              border: Border.all(color: Colors.black12),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Text(
              answerText,
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black54,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
