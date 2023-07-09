import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helpme/client/bloc/home_client_cubit.dart';
import 'package:helpme/client/bloc/home_client_states.dart';
import 'package:readmore/readmore.dart';

class DetailTechnicalScreen extends StatelessWidget {
  const DetailTechnicalScreen({Key? key}) : super(key: key);

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
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                                'بروفايل العامل',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          const Image(
                            image: AssetImage(
                              'assets/images/Rectangle 34624115.png',
                            ),
                            fit: BoxFit.cover,
                            height: 183,
                            width: double.infinity,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              const Text(
                                'محمد عبداللطيف',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff393F42),
                                ),
                              ),
                              Column(
                                children: <Widget>[
                                  Row(
                                    children: const <Widget>[
                                      Icon(
                                        Icons.location_on,
                                        size: 20,
                                        color: Colors.orange,
                                      ),
                                      Text(
                                        'القاهرة /مدينة نصر',
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.orange,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Text(
                                    'خبرة 4 سنوات',
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.orange,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Text(
                            'منظف محترف',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff939393),
                            ),
                          ),
                          Row(
                            children: const <Widget>[
                              Icon(
                                Icons.star,
                                color: Colors.orange,
                                size: 16,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.orange,
                                size: 16,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.orange,
                                size: 16,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.orange,
                                size: 16,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.orange,
                                size: 16,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '(258) 5.0',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff939393),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: const Color(0xffFFEBD9),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Icon(
                                  Icons.phone,
                                  size: 20,
                                  color: Colors.orangeAccent,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const <Widget>[
                                  Text(
                                    '01212345678',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff1A2530),
                                    ),
                                  ),
                                  Text(
                                    'الهاتف',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff707B81),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Text(
                            'نبذة عنى',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff393F42),
                            ),
                          ),
                          const ReadMoreText(
                            'مرحبا انا محمد يمكننى تنفيذ اى يعمل تود فى التنظيف'
                            ' سواء كان داخل المنزل '
                            'او المكتب او الشركة من خلال تنظيف ارضيات و تنظيف'
                            ' غرف و تنظيف السقف',
                            trimLines: 2,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff939393),
                            ),
                            colorClickableText: Colors.pink,
                            trimMode: TrimMode.Line,
                            trimCollapsedText: 'قراءة المزيد',
                            trimExpandedText: ' عرض اقل',
                            moreStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.orangeAccent,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'خدماتى',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff393F42),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          GridView.count(
                            shrinkWrap: true,
                            crossAxisCount: 2,
                            physics: const NeverScrollableScrollPhysics(),
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio: 2.8,
                            children: List<Widget>.generate(
                              4,
                              (int index) => Container(
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: const <Widget>[
                                    Image(
                                      image: AssetImage(
                                        'assets/images/Rectangle 34624115.png',
                                      ),
                                      fit: BoxFit.cover,
                                      height: 58,
                                      width: 70,
                                    ),
                                    Text(
                                      'تنظيف\nالارضيات  ',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff393F42),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              SizedBox(
                                height: 53,
                                width: 265,
                                child: TextButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                      const Color(0xffFF7A00),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: const Text(
                                    'طلب الخدمة',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xffFFFFFF),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: const Color(0xffFFEBD9),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Icon(
                                  Icons.chat,
                                  size: 30,
                                  color: Colors.orangeAccent,
                                ),
                              ),
                            ],
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
