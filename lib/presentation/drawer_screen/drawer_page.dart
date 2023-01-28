import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ly_odesa/domain/providers/user_data_provider/user_data_provider.dart';
import 'package:ly_odesa/presentation/auth_screen/auth_screen.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/link.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {

  @override
  void initState() {
    super.initState();
    context.read<UserDataProvider>().fetchUser();
  }

  @override
  Widget build(BuildContext context) {
        return SafeArea(
        child: Material(
          color: Colors.transparent,
          textStyle: const TextStyle(color: Colors.white, fontSize: 15),
          child: Container(
            width: 200,
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                DrawerHeader(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 4,
                          child: CircleAvatar(
                            radius: 50.0,
                            child: Text(context.watch<UserDataProvider>().user?.fullName[0] ?? '?', style: const TextStyle(fontSize: 40, color: Colors.white),),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                            flex: 2,
                            child: Text(context.watch<UserDataProvider>().user?.fullName ?? 'Неопізнаний користувач', textAlign: TextAlign.center,))
                      ],
                    )
                ),
                Expanded(
                    child: ListView(
                      children: [
                        ListTile(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const AuthScreen()));
                          },
                          leading: const Icon(Icons.account_circle_rounded, color: Colors.black,),
                          title: const Text('Аккаунт'),
                        ),
                        Link(
                          target: LinkTarget.defaultTarget,
                          uri: Uri.parse('https://www.instagram.com/ly.odesa/'),
                          builder: (context, followLink) => ListTile(
                            onTap: followLink,
                            leading: const Icon(Icons.photo_camera_outlined, color: Colors.black,),
                            title: const Text('Інстаграм'),
                          ),
                        ),
                      ],
                    )
                )
              ],
            ),
          ),
        ),
      );
  }
}
