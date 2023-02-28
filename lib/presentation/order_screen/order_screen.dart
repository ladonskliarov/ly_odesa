import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ly_odesa/data/services/firestore_orders_service/firestore_orders_service.dart';
import 'package:ly_odesa/domain/blocs/order_bloc/order_bloc.dart';
import 'package:ly_odesa/domain/validator/validator.dart';
import 'package:ly_odesa/presentation/custom_widgets/web_phone_optimizer.dart';
import 'package:ly_odesa/presentation/order_screen/components/logined_order_widget.dart';
import 'package:ly_odesa/presentation/order_screen/components/signout_order_widget.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final Validator _validator = ValidatorRealization();

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => OrderSenderService(),
      child: BlocProvider(
      create: (context) => OrderBloc(RepositoryProvider.of<OrderSenderService>(context))..add(CheckOnUserEvent()),
        child: WebPhoneOptimizer(
          child: Scaffold(
            backgroundColor: const Color(0xff1b1a1a),
              appBar: AppBar(
                backgroundColor: const Color(0xff1b1a1a),
                leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    }, icon: const Icon(Icons.arrow_back_ios, color: Colors.white,)),
              ),
              body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(
                left: 40.0, right: 40.0, top: 10),
                child: SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: SingleChildScrollView(
                    child: BlocBuilder<OrderBloc, OrderState>(
                    builder: (context, state) {
                      if(state is UnloginedState){
                        return SignoutOrderWidget(validator: _validator,);
                      } else if (state is LoginedState){
                        return LoginedOrderWidget(
                          fullName: state.user.fullName,
                          phoneNumber: state.user.phoneNumber,
                          city: state.user.city,
                          email: state.user.email,
                          numberOfNovaPoshta: state.user.numberOfNovaPoshta.toString(),
                          validator: _validator,
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                          );
                        }
                    }
                  ),
                  ),
                ),
              ),
            ),
          ),
        ),
    ),
  );}
}