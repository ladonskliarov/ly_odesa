
import 'package:flutter/material.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('assets/images/brand/background_header.jpeg', fit: BoxFit.cover, width: double.infinity,),
        Center(
          child: SizedBox(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TweenAnimationBuilder(
                    curve: Curves.decelerate,
                    tween: Tween<double>(begin: 0, end: 1),
                    duration: const Duration(seconds: 2),
                    builder: (BuildContext context, double _val, Widget? child) {
                      return Opacity(
                        opacity: _val,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: child,
                        ),
                      );
                    },
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.85,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration(color: Colors.black.withOpacity(0.3), borderRadius: BorderRadius.circular(20.0)),
                          ),
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Text('Знайди свій світ посуду,\nу себе вдома!',
                                style: TextStyle(fontSize: 22, color: Colors.white)
                                ),
                              ],
                            ),
                          ),
                        ]
                      ),
                    )
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),]
    );
  }
}