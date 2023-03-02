import 'package:flutter/material.dart';

class WebPhoneOptimizer extends StatelessWidget {
  final Widget child;
  const WebPhoneOptimizer({super.key, required this.child});

  @override
  Widget build(BuildContext context){
    return LayoutBuilder(
      builder: (context, constraints) {
        if(constraints.maxWidth < 500){
          return child;
        } else {
          return Stack(
              children:[
                DecoratedBox(
                  decoration: const BoxDecoration(color: Colors.black),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                  ),
                ),
                Center(
                  child: SizedBox(
                      width: 500,
                      height: 900,
                      child: child
                  ),
                ),]
          );
        }
      },
    );
  }
}