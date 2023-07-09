import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helpme/client/bloc/home_client_cubit.dart';
import 'package:helpme/client/bloc/home_client_states.dart';

class ClientFavoriteScreen extends StatelessWidget {
  const ClientFavoriteScreen({Key? key}) : super(key: key);

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
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: <Widget>[
                          const SizedBox(
                            width: 70,
                          ),
                          const Text(
                            'المفضلة',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff000000),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            height: 640,
                            child: ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) =>
                                  Container(
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          const Text(
                                            'تنظيف المنزل',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xff393F42),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          const Text(
                                            '20 ج.م/ساعه',
                                            style: TextStyle(
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
                                        Icons.favorite,
                                        color: Colors.orange,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      const SizedBox(
                                height: 7,
                                width: double.infinity,
                              ),
                              itemCount: 6,
                            ),
                          ),
                        ],
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
