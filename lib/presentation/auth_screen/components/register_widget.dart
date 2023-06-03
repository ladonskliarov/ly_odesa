import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ly_odesa/data/services/search_delivery_service/search_delivery_service.dart';
import 'package:ly_odesa/domain/blocs/auth_bloc/auth_bloc.dart';
import 'package:ly_odesa/domain/blocs/search_post_bloc/search_post_bloc.dart';
import 'package:ly_odesa/domain/providers/providers.dart';
import 'package:ly_odesa/domain/validator/validator.dart';
import 'package:ly_odesa/presentation/custom_widgets/text_field_widget.dart';
import 'package:ly_odesa/presentation/home_screen/home_screen.dart';
import 'package:ly_odesa/presentation/post_data_screens/search_city_screen/search_city_screen.dart';
import 'package:ly_odesa/presentation/post_data_screens/search_post_screen/search_post_screen.dart';
import 'package:provider/provider.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({Key? key}) : super(key: key);

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController numberOfNovaPoshtaController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final Validator _validator = ValidatorRealization();

  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final city = Provider.of<SearchProvider>(context, listen: false).choosenCity;
    final postOffice = Provider.of<SearchProvider>(context, listen: false).choosenPostOffice;
    return SafeArea(
      child: RepositoryProvider(
        create: (context) => SearchDeliveryService(),
          child: BlocProvider(
          create: (_) => SearchPostBloc(RepositoryProvider.of<SearchDeliveryService>(context)),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(context,
                              MaterialPageRoute<HomeScreen>(builder: (context) =>
                              const HomeScreen(),), (route) => false,
                            );
                          },
                        child: SizedBox(
                          width: 120,
                          height: 120,
                          child: Image.asset('assets/images/brand/ly_dark.png', fit: BoxFit.fill,)
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: GestureDetector(
                          onTap: () {
                            BlocProvider.of<AuthBloc>(context).add(const ChooseLoginEvent());
                          },
                          child: const Text('Вхід', style: TextStyle(fontSize: 25, color: Colors.grey),)
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 10,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10),
                    child: SizedBox(
                      height: double.infinity,
                      width: double.infinity,
                      child: SingleChildScrollView(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Приєднуйся, зроби це!', style: TextStyle(fontSize: 20),),
                              TextFieldCustom(
                                  validator: (value) {
                                    return _validator.validateFullNameField(value);
                                  },
                                  controller: fullNameController,
                                  icon: const Icon(Icons.account_circle_rounded, color: Colors.white, size: 20),
                                  hintText: "Ім'я Прізвище"
                              ),
                              TextFieldCustom(
                                  validator: (value) {
                                    return _validator.validateEmailFiled(value);
                                  },
                                  controller: emailController,
                                  icon: const Icon(Icons.mail, color: Colors.white, size: 20,),
                                  hintText: 'Пошта'
                              ),
                              TextFieldCustom(
                                  validator: (value) {
                                    return _validator.validatePhoneNumberField(value);
                                  },
                                  controller: phoneNumberController,
                                  icon: const Icon(Icons.phone_iphone, color: Colors.white, size: 20,),
                                  hintText: 'Телефон'
                              ),
                              TextFieldCustom(
                                  validator: (value) {
                                    return _validator.validatePasswordField(value);
                                  },
                                obscureText: true,
                                  controller: passwordController,
                                  icon: const Icon(Icons.lock_outline_rounded, color: Colors.white, size: 20,),
                                  hintText: 'Пароль'
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute<SearchCityScreen>(
                                        builder: (context) =>
                                        const SearchCityScreen(),
                                        ),
                                    );
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: DecoratedBox(
                                        decoration: const BoxDecoration(color: Colors.white),
                                        child: SizedBox(
                                          width: double.infinity,
                                              child: Padding(
                                                padding: const EdgeInsets.all(10.0),
                                                child: Text(
                                                  context.watch<SearchProvider>().choosenCity, style: const TextStyle(color: Color(0xff1b1a1a), fontSize: 18),
                                                  maxLines: 10, overflow: TextOverflow.fade, textAlign: TextAlign.center,
                                                ),
                                              ),
                                        ),
                                      ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute<SearchPostScreen>(
                                            builder: (context) =>
                                        const SearchPostScreen()
                                      )
                                    );
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: DecoratedBox(
                                      decoration: const BoxDecoration(color: Colors.white),
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Flexible(
                                                child: Text(
                                                  context.watch<SearchProvider>().choosenPostOffice, style: const TextStyle(color: Color(0xff1b1a1a), fontSize: 18),
                                                  maxLines: 10, overflow: TextOverflow.fade, textAlign: TextAlign.center,
                                                ),
                                              ),
                                              const SizedBox(width: 5),
                                              const Icon(Icons.open_with_outlined, color: Colors.red,)
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: DecoratedBox(
                                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
                                    child: GestureDetector(
                                      onTap: () {
                                        if (_formKey.currentState!.validate() &&
                                            Provider.of<SearchProvider>(context, listen: false).choosenPostOffice !=
                                            'Відділення Нової пошти') {
                                              BlocProvider.of<AuthBloc>(context).add(
                                                RegisterEvent(
                                                  fullName: fullNameController.text,
                                                  email: emailController.text,
                                                  password: passwordController.text,
                                                  phoneNumber: phoneNumberController.text,
                                                  city: city,
                                                  numberOfNovaPoshta: postOffice
                                              )
                                          );
                                        } else {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            const SnackBar(
                                                backgroundColor: Colors.white,
                                                content: Text('О оу, перегляньте заповнення',
                                                  style: TextStyle(color: Color(0xff1b1a1a)),)),
                                          );
                                        }
                                      },
                                      child: const SizedBox(
                                        height: 40,
                                        width: double.infinity,
                                        child: Align(
                                            alignment: Alignment.center,
                                            child: Text('Стати своїм',
                                              style: TextStyle(color: Color(0xff1b1a1a), fontSize: 20),)),
                                      ),
                                    )
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
        ),
      ),
    ),
    );
  }
}
