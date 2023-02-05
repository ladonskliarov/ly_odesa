import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ly_odesa/presentation/custom_widgets/web_phone_optimizer.dart';
import 'package:ly_odesa/presentation/drawer_screen/drawer_page.dart';

import '../../domain/providers/providers.dart';

class DrawerScreen extends StatelessWidget {
  final Widget child;
  const DrawerScreen({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WebPhoneOptimizer(
      child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          Color(0xffACACAA),
                          Colors.blueAccent
                        ]
                    )
                ),
              ),
              const DrawerPage(),
              TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0, end: context
                      .watch<DrawerProvider>()
                      .value),
                  duration: const Duration(milliseconds: 500),
                  builder: (_, double val, __) {
                    return (
                        Transform(transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.001)..setEntry(0, 3, 200 * val)
                          ..rotateY((pi / 6) * val),
                            child: child
                        )
                    );
                  }
              )
            ],
      ),
    );
  }
}
