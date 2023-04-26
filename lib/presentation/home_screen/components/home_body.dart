import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ly_odesa/data/services/firestore_products_service/firestore_products_service.dart';
import 'package:ly_odesa/domain/blocs/home_bloc/home_bloc.dart';
import 'package:ly_odesa/presentation/home_screen/components/home_body/main_tab_page.dart';
import 'package:ly_odesa/presentation/home_screen/components/home_body/other_tabs_page.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => FirestoreService(),
        child: BlocProvider(
          create: (context) => HomeBloc(RepositoryProvider.of<FirestoreService>(context))..add(LoadProducts()),
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if(state is ProductsLoadedState){
              return Column(
                children: [
                Expanded(
                  flex: 1,
                  child: TabBar(
                    isScrollable: true,
                    controller: _tabController,
                    tabs: const [
                      Tab(text: 'Головна'),
                      Tab(text: 'Тарілки'),
                      Tab(text: 'Склянки'),
                      Tab(text: 'Келихи'),
                      Tab(text: 'Прилади'),
                      Tab(text: 'Інше')
                    ]
                  ),
                ),
              Expanded(
                flex: 12,
                  child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _tabController,
                  children: [
                    MainTabPage(
                      plates: state.plates,
                      drinkingGlasses: state.drinkingGlasses,
                      glasses: state.glasses,
                      cutlery: state.cutlery,
                      other: state.other,
                    ),
                    OtherTabsPage(productList: state.plates,),
                    OtherTabsPage(productList: state.drinkingGlasses,),
                    OtherTabsPage(productList: state.glasses,),
                    OtherTabsPage(productList: state.cutlery,),
                    OtherTabsPage(productList: state.other),
                    ],
                  ),
                )
              ]);
              } else if (state is ProductsErrorState) {
                return Center(
                  child: Text('Упс.. Сталася помилка\n${state.error}'),
                );
              } else if (state is ProductsLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return const SizedBox();
            }
        ),
      ),
    );
  }
}