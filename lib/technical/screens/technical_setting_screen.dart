import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helpme/app_components/flutter_toastr.dart';
import 'package:helpme/app_components/text_button.dart';
import 'package:helpme/app_constants/cache_helper.dart';
import 'package:helpme/registration/screens/login.dart';
import 'package:helpme/technical/bloc/home-technical-cubit.dart';
import 'package:helpme/technical/bloc/home_technical_states.dart';

class TechnicalSettingScreen extends StatelessWidget {
  TechnicalSettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TechnicalCubit(),
      child: BlocConsumer<TechnicalCubit, TechnicalStates>(
        listener: (context, state) {
          if (state is TechnicalSignOutSuccessState) {
            removeData(key: 'token').then((value) {
              removeData(key: 'role').then((value) {
                flutterToastr(
                  context,
                  msg: 'تم تسجيل الخروج بنجاح',
                  color: Colors.green,
                );
              });
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                  (route) => false);
            });
          } else if (state is TechnicalSignOutErrorState) {
            flutterToastr(
              context,
              msg: state.error,
              color: Colors.red,
            );
          }
        },
        builder: (context, state) {
          final TechnicalCubit cubit = TechnicalCubit.get(context);
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
                          width: 350,
                        ),
                        const Text(
                          'الاعدادات',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff000000),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        container(icon: Icons.language, text: 'اللغة'),
                        container(
                          icon: Icons.lock,
                          text: 'تغيير كلمة المرور',
                        ),
                        container(
                          icon: Icons.privacy_tip_outlined,
                          text: 'سياسة الخصوصية',
                        ),
                        container(
                          icon: Icons.help_outline,
                          text: 'مركز المساعدة',
                        ),
                        container(icon: Icons.phone, text: 'اتصل بنا'),
                        container(
                          icon: Icons.file_copy_outlined,
                          text: 'الشروط & الاحكام',
                        ),
                        container(icon: Icons.info_outline, text: 'عنا'),
                        textButton(
                          text: 'تسجيل الخروج',
                          onPressed: ()async {
                          cubit.technicalSignOut();
                          },
                          state: state is! TechnicalSignOutLoadingState,
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
}

Widget container({
  required IconData icon,
  required String text,
}) =>
    Column(
      children: <Widget>[
        Container(
          height: 53,
          width: 327,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: <Widget>[
              const SizedBox(
                width: 10,
              ),
              Container(
                height: 39,
                width: 40,
                decoration: BoxDecoration(
                  color: const Color(0xffFFEBD9),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  size: 25,
                  color: Colors.orangeAccent,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff000000),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
