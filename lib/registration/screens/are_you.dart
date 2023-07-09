import 'package:flutter/material.dart';
import 'package:helpme/app_components/navigate_to.dart';
import 'package:helpme/app_components/text_button.dart';
import 'package:helpme/app_constants/cache_helper.dart';
import 'package:helpme/app_constants/constance.dart';
import 'package:helpme/registration/screens/technical.dart';
import 'package:helpme/registration/screens/user.dart';

class AreYouScreen extends StatelessWidget {
  const AreYouScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_forward_rounded),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Center(
                    child: Image(
                      image: AssetImage('assets/images/Logo.png'),
                      height: 110,
                      width: 110,
                    ),
                  ),
                  const Text(
                    'ساعدنى',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                      color: Color(0xffFF8B00),
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  const Text(
                    'هل انت؟',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff000000),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  textButton(
                    state: true,
                    text: 'فني (باحث عن عمل)',
                    onPressed: () async {
                      saveData(key: 'role', value: 'Technical')
                          .then((value) async {
                            print(value.toString());
                        await navigateTo(
                          context,
                          TechnicalScreen(),
                        );
                      });

                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  textButton(
                    state: true,
                    text: 'مستخدم',
                    onPressed: () async {
                      saveData(key: 'role', value: 'Client')
                          .then((value) async {
                        await navigateTo(
                          context,
                          UserScreen(),
                        );
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
