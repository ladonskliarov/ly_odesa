import 'package:flutter/material.dart';

class DetailDescription extends StatelessWidget {
  const DetailDescription({required this.description, Key? key}) : super(key: key);
  final String description;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Text(description,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}