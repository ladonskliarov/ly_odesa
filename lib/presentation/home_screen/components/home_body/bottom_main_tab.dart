import 'package:flutter/material.dart';

class BottomMainTabPage extends StatelessWidget {
  const BottomMainTabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Text('Додаток\nрозроблен:', style:  TextStyle(color: Color(0xffACACAA), fontSize: 12),),
            ),
            SizedBox(
                height: 40,
                width: 40,
                child: Image.asset('assets/images/brand/qr_ladon.png', fit: BoxFit.fill,)
            )
          ],
        ),
      ),
    );
  }
}