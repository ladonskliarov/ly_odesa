import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ly_odesa/data/services/firestore_products_service/firestore_products_service.dart';
import 'package:ly_odesa/presentation/drawer_screen/drawer_screen.dart';
import 'package:ly_odesa/presentation/home_screen/components/appbar.dart';
import 'package:ly_odesa/presentation/home_screen/components/header.dart';
import 'package:ly_odesa/presentation/home_screen/components/home_body.dart';
import 'dart:math';

import '../../domain/blocs/blocs.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerScreen(
        child: RepositoryProvider(
          create: (context) => FirestoreService(),
          child: BlocProvider(
            create: (context) => HomeBloc(RepositoryProvider.of<FirestoreService>(context)),
            child: Scaffold(
              backgroundColor: const Color(0xff1b1a1a),
              appBar: AppBar(
                  backgroundColor: const Color(0xff1b1a1a),
                  title: const AppBarWidget()
              ),
              body: Center(
                  child: NestedScrollView(
                      floatHeaderSlivers: true,
                      headerSliverBuilder: (context, innerBoxIsScrolled) => [
                        const SliverAppBar(
                          stretch: true,
                          flexibleSpace: HomeHeader(),
                          toolbarHeight: 200,
                          floating: true,
                        )
                      ],
                      body: const DefaultTextStyle(
                          style: TextStyle(color: Colors.white, fontFamily: 'e-Ukraine'),
                          child: HomeBody()
                      )
                  )
              ),
            ),
          ),
        )
    );
  }
}