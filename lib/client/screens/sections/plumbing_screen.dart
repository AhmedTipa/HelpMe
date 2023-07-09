import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helpme/app_components/section_class.dart';
import 'package:helpme/client/bloc/home_client_cubit.dart';
import 'package:helpme/client/bloc/home_client_states.dart';

// ignore: must_be_immutable
class PlumbingScreen extends StatelessWidget {
  PlumbingScreen({Key? key}) : super(key: key);
  TextEditingController filterController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) => BlocProvider<ClientCubit>(
        create: (BuildContext context) => ClientCubit(),
        child: BlocConsumer<ClientCubit, ClientStates>(
          listener: (BuildContext context, ClientStates state) {},
          builder: (BuildContext context, ClientStates state) {
            final ClientCubit cubit = ClientCubit.get(context);
            return Directionality(
              textDirection: TextDirection.rtl,
              child: Scaffold(
                body: SafeArea(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Form(
                        key: formKey,
                        child: sectionClass(
                          context: context,
                          sectionLabel: 'قسم السباكه',
                          filterController: filterController,
                          image: 'assets/images/aa.jpg',
                          namePerson: 'محمد سعيد',
                          nameCity: 'القاهرة',
                          rate: '4.9',
                          filterOnPress: (){},
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      );
}
