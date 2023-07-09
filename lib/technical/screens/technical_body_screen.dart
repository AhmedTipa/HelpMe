import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helpme/technical/bloc/home-technical-cubit.dart';
import 'package:helpme/technical/bloc/home_technical_states.dart';

class TechnicalBodyScreen extends StatelessWidget {
  const TechnicalBodyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider<TechnicalCubit>(
        create: (BuildContext context) => TechnicalCubit()..technicalGetData(),
        child: BlocConsumer<TechnicalCubit, TechnicalStates>(
          listener: (BuildContext context, TechnicalStates state) {},
          builder: (BuildContext context, TechnicalStates state) {
             TechnicalCubit cubit = TechnicalCubit.get(context);

            return Directionality(
              textDirection: TextDirection.rtl,
              child: Scaffold(
                body: cubit.screens[cubit.activeIndex],
                bottomNavigationBar: Directionality(
                  textDirection: TextDirection.ltr,
                  child: CircleNavBar(
                    activeIcons: const <Widget>[
                      Icon(
                        Icons.settings,
                        color: Colors.white,
                        size: 35,
                      ),
                      Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 35,
                      ),
                      Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 35,
                      ),
                      Icon(
                        Icons.home_filled,
                        color: Colors.white,
                        size: 35,
                      ),
                    ],
                    inactiveIcons: const <Widget>[
                      Text(
                        'الاعدادات',
                        style: TextStyle(color: Colors.orange, fontSize: 13),
                      ),
                      Text(
                        'حسابي',
                        style: TextStyle(color: Colors.orange, fontSize: 13),
                      ),
                      Text(
                        'إضافة خدمة',
                        style: TextStyle(color: Colors.orange, fontSize: 12),
                      ),
                      Text(
                        'الصفحة الرئيسية',
                        style: TextStyle(color: Colors.orange, fontSize: 12),
                      ),
                    ],
                    padding: const EdgeInsets.all(10),
                    color: const Color(0xffFAFAFA),
                    circleColor: const Color(0xffFF7A00),
                    cornerRadius: BorderRadius.circular(20),
                    height: 50,
                    circleWidth: 50,
                    activeIndex: cubit.activeIndex,
                    onTap: (int index) {
                      cubit.changeBtmNavBar(index);
                    },
                  ),
                ),
              ),
            );
          },
        ),
      );
}
