import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helpme/app_components/flutter_toastr.dart';
import 'package:helpme/app_components/text_button.dart';
import 'package:helpme/app_constants/cache_helper.dart';
import 'package:helpme/client/bloc/home_client_cubit.dart';
import 'package:helpme/client/bloc/home_client_states.dart';
import 'package:helpme/registration/screens/login.dart';

class ClientSettingScreen extends StatelessWidget {
  const ClientSettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider<ClientCubit>(
        create: (BuildContext context) => ClientCubit(),
        child: BlocConsumer<ClientCubit, ClientStates>(
          listener: (BuildContext context, ClientStates state) {
            if (state is ClientSignOutSuccessState) {
              removeData(key: 'token').then((value) {
                removeData(key: 'role');
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                    (route) => false);
              });
            }
            else if (state is ClientSignOutErrorState) {
              flutterToastr(
                context,
                msg: state.error,
                color: Colors.red,
              );
            }
          },
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
                            onPressed: () {
                              cubit.clientSignOut();
                            },
                            state: state is! ClientSignOutLoadingState,
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
