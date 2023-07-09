import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helpme/client/bloc/home_client_cubit.dart';
import 'package:helpme/client/bloc/home_client_states.dart';

class ClientBodyScreen extends StatelessWidget {
  const ClientBodyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider<ClientCubit>(
        create: (BuildContext context) => ClientCubit()..clientGetData(),
        child: BlocConsumer<ClientCubit, ClientStates>(
          listener: (BuildContext context, ClientStates state) {},
          builder: (BuildContext context, ClientStates state) {
            final ClientCubit cubit = ClientCubit.get(context);
            return Directionality(
              textDirection: TextDirection.rtl,
              child: Scaffold(
                body: cubit.screens[cubit.currentIndex],
                bottomNavigationBar: BottomNavigationBar(
                  backgroundColor: Colors.red,
                  selectedItemColor: Colors.orange,
                  unselectedItemColor: Colors.orangeAccent.shade100,
                  elevation: 0,
                  onTap: cubit.changeBtmNavBar,
                  currentIndex: cubit.currentIndex,
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'الصفحة الرئيسية',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.favorite_border),
                      label: 'المفضلة',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      label: 'حسابي',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.settings),
                      label: 'الاعدادات',
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
}
