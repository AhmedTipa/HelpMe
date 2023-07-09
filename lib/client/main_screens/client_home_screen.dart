import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helpme/app_components/navigate_to.dart';
import 'package:helpme/app_components/text_form.dart';
import 'package:helpme/app_constants/color_constant.dart';
import 'package:helpme/client/bloc/home_client_cubit.dart';
import 'package:helpme/client/bloc/home_client_states.dart';

import 'package:helpme/client/screens/sections/plumbing_screen.dart';
import 'package:helpme/client/main_screens/client_services_screen.dart';

// ignore: must_be_immutable
class ClientHomeScreen extends StatelessWidget {
  ClientHomeScreen({Key? key}) : super(key: key);
  TextEditingController searchController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) => BlocProvider<ClientCubit>(
        create: (BuildContext context) => ClientCubit()
          ..clientGetData()
          ..clientGetServicesData(),
        child: BlocConsumer<ClientCubit, ClientStates>(
          listener: (BuildContext context, ClientStates state) {},
          builder: (BuildContext context, ClientStates state) {
            final ClientCubit cubit = ClientCubit.get(context);
            return ConditionalBuilder(
              condition: state is! ClientGetDataLoadingState &&
              state is ClientGetServicesDataSuccessState,
              builder: (context) => Directionality(
                textDirection: TextDirection.rtl,
                child: Scaffold(
                  body: SafeArea(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundColor: Color(backgroundColor),
                                    child: Icon(
                                      Icons.front_hand_outlined,
                                      color: Colors.orange.shade400,
                                      size: 25,
                                    ),
                                  ),
                                  Text(
                                    ' مرحبا ${cubit.clientModel!.name}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.notifications_none_outlined,
                                      color: Colors.orange.shade500,
                                      size: 30,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  SizedBox(
                                    width: 270,
                                    child: textForm(
                                      controller: searchController,
                                      validation: (dynamic value) {
                                        if (value.toString().isEmpty) {
                                          return 'من فضلك اكتب ما تريد البحث عنه';
                                        }
                                        return null;
                                      },
                                      type: TextInputType.text,
                                      hintText: 'بحث',
                                      prefixIcon: Icons.search,
                                    ),
                                  ),
                                  Container(
                                    height: 48,
                                    width: 48,
                                    decoration: BoxDecoration(
                                      color: const Color(0xffFF7A00),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Icon(
                                      Icons.filter_alt,
                                      size: 35,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              const Align(
                                alignment: Alignment.topRight,
                                child: Text(
                                  'الاقسام',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  const Image(
                                    image: AssetImage('assets/images/c 1.png'),
                                    height: 70,
                                    width: 65,
                                  ),
                                  const Image(
                                    image: AssetImage('assets/images/c 2.png'),
                                    height: 70,
                                    width: 65,
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      await navigateTo(
                                        context,
                                        PlumbingScreen(),
                                      );
                                    },
                                    child: const Image(
                                      image:
                                          AssetImage('assets/images/c 3.png'),
                                      height: 70,
                                      width: 65,
                                    ),
                                  ),
                                  const Image(
                                    image: AssetImage('assets/images/c 4.png'),
                                    height: 70,
                                    width: 65,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const <Widget>[
                                  Image(
                                    image:
                                        AssetImage('assets/images/c 1 (1).png'),
                                    height: 70,
                                    width: 65,
                                  ),
                                  Image(
                                    image:
                                        AssetImage('assets/images/c 2 (1).png'),
                                    height: 70,
                                    width: 65,
                                  ),
                                  Image(
                                    image:
                                        AssetImage('assets/images/c 3 (1).png'),
                                    height: 70,
                                    width: 65,
                                  ),
                                  Image(
                                    image:
                                        AssetImage('assets/images/c 4 (1).png'),
                                    height: 70,
                                    width: 65,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  const Text(
                                    'ابرز الخدمات',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      await navigateTo(
                                        context,
                                        const ClientServicesScreen(),
                                      );
                                    },
                                    child: const Text(
                                      'رؤية الكل',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 261,
                                child: listView(cubit),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              fallback: (context) =>
                  const Center(child: CircularProgressIndicator()),
            );
          },
        ),
      );
}

Widget listView(ClientCubit cubit) => ListView.separated(
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) => Container(
        width: double.infinity,
        height: 90,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(9),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Image(
              image: AssetImage(
                'assets/images/Rectangle 34624115.png',
              ),
              height: 90,
              width: 111,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '${cubit.clientServicesModel!.services![index].title}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff393F42),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${cubit.clientServicesModel!.services![index].price} ج.م/ساعه',
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff393F42),
                    ),
                  ),
                  Row(
                    children: const <Widget>[
                      Icon(
                        Icons.star,
                        color: Color(0xffFF8B00),
                        size: 11,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        '4.5',
                        style: TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff393F42),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_border,
                color: Color(0xff939393),
              ),
            ),
          ],
        ),
      ),
      separatorBuilder: (BuildContext context, int index) => const SizedBox(
        height: 10,
        width: double.infinity,
      ),
      itemCount: 3,
    );
