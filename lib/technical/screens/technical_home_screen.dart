import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helpme/app_constants/color_constant.dart';
import 'package:helpme/technical/bloc/home-technical-cubit.dart';
import 'package:helpme/technical/bloc/home_technical_states.dart';

class TechnicalHomeScreen extends StatelessWidget {
  TechnicalHomeScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>TechnicalCubit()..technicalGetData(),
      child: BlocConsumer<TechnicalCubit,TechnicalStates>(
        listener: (context,state){},
        builder: (context,state){
           TechnicalCubit cubit=TechnicalCubit.get(context);
          return ConditionalBuilder(
            condition: state is ! TechnicalGetDataLoadingState,
            fallback: (context) => const Center(child: CircularProgressIndicator(),),
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
                              CircleAvatar(
                                backgroundColor: Color(backgroundColor),
                                child: Icon(
                                  Icons.front_hand_outlined,
                                  color: Colors.orange.shade400,
                                  size: 25,
                                ),
                              ),
                              Text(
                                'مرحبا ${cubit.technicalModel!.name!} ' ,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(
                                width: 40,
                              ),
                              const Text(
                                'خدماتى',
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
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: const <Widget>[
                                              Text(
                                                'تنظيف المنزل',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xff393F42),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                'تنظيف كل شي في المنزل ',
                                                style: TextStyle(
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
                                      ],
                                    ),
                                  ),
                              separatorBuilder: (BuildContext context, int index) =>
                              const SizedBox(
                                height: 7,
                                width: double.infinity,
                              ),
                              itemCount: 4,
                            ),
                          ),
                        ],
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
}
