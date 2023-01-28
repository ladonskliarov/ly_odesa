import 'package:flutter/material.dart';


class ProductSize extends StatelessWidget {
  const ProductSize({required this.size, Key? key}) : super(key: key);
  final String size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
            padding: const EdgeInsets.only(top: 15.0, right: 15.0),
            child: DecoratedBox(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 1.0),
                borderRadius: BorderRadius.circular(30.0)
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: SizedBox(
                height: 40,
                width: 70,
                child: Align(
                    alignment: Alignment.center,
                    child: Text(size, textAlign: TextAlign.center, style: const TextStyle(color:  Color(0xffACACAA), fontSize: 15),),
                ),
              ),
            ),
          )
        ),
      ),
    );
  }
}
