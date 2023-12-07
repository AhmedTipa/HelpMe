import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helpme/client/bloc/home_client_cubit.dart';
import 'package:helpme/client/bloc/home_client_states.dart';

class ClientServicesScreen extends StatelessWidget {
  const ClientServicesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider<ClientCubit>(
        create: (BuildContext context) =>
            ClientCubit()..clientGetServicesData(),
        child: BlocConsumer<ClientCubit, ClientStates>(
          listener: (BuildContext context, ClientStates state) {},
          builder: (BuildContext context, ClientStates state) {
            final ClientCubit cubit = ClientCubit.get(context);
            return ConditionalBuilder(
              condition: state is! ClientGetServicesDataLoadingState,
              builder: (context) => Directionality(
                textDirection: TextDirection.rtl,
                child: Scaffold(
                  body: SafeArea(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(
                                    Icons.arrow_back_ios,
                                  ),
                                ),
                                const SizedBox(
                                  width: 70,
                                ),
                                const Text(
                                  'ابرز الخدمات',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            SizedBox(
                              height: 640,
                              child: listView(cubit),
                            ),
                          ],
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
                'assets/images/boarding_photo1.png',
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
                    '${cubit.clientServicesModel!.services![index].description}',
                    style: const TextStyle(
                      fontSize: 7,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff393F42),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
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
          ],
        ),
      ),
      separatorBuilder: (BuildContext context, int index) => const SizedBox(
        height: 10,
        width: double.infinity,
      ),
      itemCount: cubit.clientServicesModel!.services!.length,
    );
