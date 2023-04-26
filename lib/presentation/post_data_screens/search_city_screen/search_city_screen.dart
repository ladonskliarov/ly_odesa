import 'package:flutter/material.dart';
import 'package:ly_odesa/domain/providers/providers.dart';
import 'package:ly_odesa/presentation/post_data_screens/components/search_card.dart';
import 'package:provider/provider.dart';

class SearchCityScreen extends StatelessWidget {
  const SearchCityScreen({
    Key? key,
    required this.model
  }) : super(key: key);
  final model;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xff1b1a1a),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          child:
             Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 25,)
                    ),
                    const Text('Знайди себе', style: TextStyle(color: Colors.white, fontSize: 28),)
                  ],
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  cursorColor: Colors.white,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.white),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.white),
                    ),
                    hintText: 'Пошук..',
                    hintStyle: TextStyle(color: Colors.white),
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  onChanged: (value) {
                    context.read<SearchProvider>().onlineSearchCity(value);
                  },
                ),
                const SizedBox(height: 20),
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                      itemCount: context.watch<SearchProvider>().cities.length,
                      itemBuilder: (context, index) =>
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            context.read<SearchProvider>().chooseCity(context.read<SearchProvider>().cities.elementAt(index));
                          },
                          child: SearchCard(value: context.watch<SearchProvider>().cities.elementAt(index)))
                    ),
                  ),
                ),
            ],
          )
        ),
      ),
    );
  }
}
