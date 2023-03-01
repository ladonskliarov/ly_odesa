import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ly_odesa/domain/providers/cart_provider/cart_provider.dart';
import 'package:ly_odesa/domain/providers/drawer_provider/drawer_provider.dart';
import 'package:ly_odesa/domain/providers/search_provider/search_provider.dart';
import 'package:ly_odesa/domain/providers/user_data_provider/user_data_provider.dart';
import 'package:ly_odesa/presentation/custom_widgets/web_phone_optimizer.dart';
import 'package:ly_odesa/presentation/home_screen/home_screen.dart';
import 'package:ly_odesa/privacy_settings.dart';
import 'package:material_color_generator/material_color_generator.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  try {
  WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
        options: const FirebaseOptions(
        apiKey: apiKey,
        appId: appId,
        messagingSenderId: messagingSenderId,
        projectId: projectId,
        storageBucket: storageBucket
    ));
  } catch (e) {}
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MultiProvider(
        providers: [
            ChangeNotifierProvider(
              create: (_) => CartProvider()),
            ChangeNotifierProvider(
              create: (_) => DrawerProvider(),
            ),
            ChangeNotifierProvider(
                create: (_) => UserDataProvider()),
            ChangeNotifierProvider(
              create: (_) => SearchProvider()),
          ],
          child: MaterialApp(
              title: 'LY.Odesa',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                fontFamily: 'e-Ukraine',
                primarySwatch: generateMaterialColor(color: const Color(0xff1b1a1a),
                ),
              ),
              home: const HomeScreen(),
          )
    );
  }
}
