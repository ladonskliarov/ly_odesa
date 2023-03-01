import 'package:flutter/material.dart';

class SearchCard extends StatelessWidget {
  const SearchCard({required this.value, Key? key}) : super(key: key);
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blueAccent.shade100,
          borderRadius: BorderRadius.circular(10)
      ),
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(8.0),
      child: Text(value, style: const TextStyle(fontSize: 18, color: Colors.white),
      ),
    );
  }
}