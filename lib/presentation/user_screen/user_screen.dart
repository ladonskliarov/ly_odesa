import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ly_odesa/data/models/my_user.dart';
import 'package:ly_odesa/data/services/firebase_auth_service/firebase_auth_service.dart';
import 'package:ly_odesa/domain/blocs/auth_bloc/auth_bloc.dart';
import 'package:ly_odesa/domain/providers/providers.dart';
import 'package:ly_odesa/domain/providers/user_data_provider/user_data_provider.dart';
import 'package:ly_odesa/presentation/custom_widgets/web_phone_optimizer.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({required this.user, Key? key}) : super(key: key);

  final MyUser user;

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {

  @override
  void initState() {
    super.initState();
    context.read<UserDataProvider>().fetchUser();
    context.read<SearchProvider>().initializeCityAndPost();
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => FirebaseAuthService(),
      child: BlocProvider(
        create: (context) => AuthBloc(authRepository: RepositoryProvider.of<FirebaseAuthService>(context)),
        child: WebPhoneOptimizer(
          child: Material(
            textStyle: TextStyle(color: Colors.white, fontFamily: 'e-Ukraine', fontSize: MediaQuery.of(context).size.height * 0.021),
            color: const Color(0xff1b1a1a),
            child: SafeArea(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: IconButton(
                                onPressed: () {Navigator.pop(context);},
                                icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 30,
                                )
                            )
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white12,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          height: MediaQuery.of(context).size.height / 3,
                          width: double.infinity,
                          child: Column(
                            children: [
                              Expanded(
                                flex: 7,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10.0, top: 10),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 2,
                                            child: PrettyQr(
                                              elementColor: Colors.white,
                                              size: MediaQuery.of(context).size.height * 0.1,
                                              data: widget.user.bonusCard.numberOfBonusCard.toString(),
                                              errorCorrectLevel: QrErrorCorrectLevel.M,
                                              typeNumber: null,
                                              roundEdges: true,
                                          )
                                        ),
                                        Expanded(
                                          flex: 5,
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 15.0),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(widget.user.fullName),
                                                Text(widget.user.city),
                                                Text('Нова пошта №${widget.user.numberOfNovaPoshta}'),
                                                Text(widget.user.phoneNumber),
                                                Text(widget.user.email),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                              ),
                              Expanded(
                                flex: 2,
                                child: DecoratedBox(
                                  decoration: const BoxDecoration(color: Colors.white),
                                  child: SizedBox(
                                    height: 20,
                                    width: double.infinity,
                                    child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                          child: Text(
                                            widget.user.fullName,
                                            style: const TextStyle(color: Colors.black, fontSize: 20),
                                          ),
                                        )),
                                  ),
                                ),
                              ),
                              const Expanded(flex: 1, child: SizedBox()),
                              ElevatedButton(
                                  onPressed: () {
                                    BlocProvider.of<AuthBloc>(context).add(SignoutEvent(context: context));
                                    context.read<UserDataProvider>().signOutUser();
                                    context.read<SearchProvider>().clearPostData();
                                  },
                                  child: const Text('Вийти'))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
