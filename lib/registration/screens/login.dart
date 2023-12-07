import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helpme/app_components/flutter_toastr.dart';
import 'package:helpme/app_components/navigate_to.dart';
import 'package:helpme/app_components/text_button.dart';
import 'package:helpme/app_components/text_form.dart';
import 'package:helpme/app_constants/cache_helper.dart';
import 'package:helpme/client/main_screens/client_body_screen.dart';
import 'package:helpme/registration/bloc/regestration_states.dart';
import 'package:helpme/registration/bloc/registration_cubit.dart';
import 'package:helpme/registration/screens/are_you.dart';
import 'package:helpme/registration/screens/forget_password.dart';
import 'package:helpme/registration/screens/technical_complete.dart';
import 'package:helpme/technical/screens/technical_body_screen.dart';

// ignore: must_be_immutable
class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? role;

  @override
  Widget build(BuildContext context) => BlocProvider<RegistrationCubit>(
        create: (BuildContext context) => RegistrationCubit(),
        child: BlocConsumer<RegistrationCubit, RegistrationStates>(
          listener: (BuildContext context, RegistrationStates state) async {
            if (state is RegistrationLoginSuccessState) {
              saveData(
                      key: 'token',
                      value: RegistrationCubit.get(context).loginModel!.token)
                  .whenComplete(() async {
                if (getData(key: 'role') == 'Client') {
                  navigateTo(context, const ClientBodyScreen());
                  flutterToastr(
                    context,
                    msg: 'تم تسجيل الدخول بنجاح',
                    color: Colors.green,
                  );
                } else if (getData(key: 'role') == 'Technical') {

                  await showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      content: Container(
                        height: 250,
                        width: 382,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Spacer(),
                            Stack(
                              children: <Widget>[
                                Container(
                                  width: 105,
                                  height: 105,
                                  decoration: BoxDecoration(
                                    color: const Color(0xffFF7A00),
                                    borderRadius: BorderRadius.circular(
                                      100,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 7,
                                  left: 7,
                                  right: 7,
                                  bottom: 7,
                                  child: Container(
                                    width: 98,
                                    height: 98,
                                    decoration: BoxDecoration(
                                      color: const Color(0xffFF7A00),
                                      borderRadius: BorderRadius.circular(
                                        100,
                                      ),
                                    ),
                                  ),
                                ),
                                const Positioned(
                                  top: 30,
                                  left: 30,
                                  right: 30,
                                  bottom: 30,
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                )
                              ],
                            ),
                            const Spacer(),
                            const Text(
                              'مبروك تم انشاء الحساب ',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Color(
                                  0xff202224,
                                ),
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const Spacer(),
                            TextButton(
                              onPressed: () {
                                if(getData(key: 'role')=='Technical'){
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const TechnicalCompleteScreen(),),
                                        (route) => false,
                                  );
                                }
                              },
                              child: const Text(
                                'استكمال بياناتك',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xffFF7A00),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                if(getData(key: 'role')=='Technical'){
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const TechnicalBodyScreen()),
                                        (route) => false,
                                  );
                                }

                              },
                              child: const Text(
                                'صفحتك الرئيسيه',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xffFF7A00),
                                ),
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ),
                  );
                }
              });
            } else if (state is RegistrationLoginErrorState) {
              flutterToastr(
                context,
                msg: state.error,
                color: Colors.red,
              );
            }
          },
          builder: (BuildContext context, RegistrationStates state) {
            final RegistrationCubit cubit = RegistrationCubit.get(context);
            return Directionality(
              textDirection: TextDirection.rtl,
              child: Scaffold(
                body: SafeArea(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: <Widget>[
                            const SizedBox(
                              height: 25,
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
                            RichText(
                              text: const TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'اهلا بيك فى تطبيق ',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'ساعدنى',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xffFF7A00),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 35,
                            ),
                            const Text(
                              'قم الان بتسجيل الدخول',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            textForm(
                              controller: emailController,
                              validation: (dynamic value) {
                                if (value.toString().isEmpty) {
                                  return 'من فضلك اكتب بريدك الالكترونى';
                                }
                                return null;
                              },
                              type: TextInputType.emailAddress,
                              hintText: 'البريد الالكترونى',
                              prefixIcon: Icons.email_rounded,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            textForm(
                              controller: passwordController,
                              validation: (dynamic value) {
                                if (value.toString().isEmpty) {
                                  return 'من فضلك اكتب كلمة المرور';
                                }
                                return null;
                              },
                              type: TextInputType.visiblePassword,
                              hintText: 'كلمة المرور',
                              prefixIcon: Icons.lock,
                              obscureText: cubit.isVisible,
                              onPressed: cubit.changePasswordVisible,
                              suffixIcon: cubit.icon,
                            ),
                            Row(
                              children: <Widget>[
                                TextButton(
                                  onPressed: () async {
                                    await navigateTo(
                                      context,
                                      ForgetPasswordScreen(),
                                    );
                                  },
                                  child: const Text(
                                    'هل نسيت كلمه المرور؟',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xffFF8B00),
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                Row(
                                  children: <Widget>[
                                    Radio<String>(
                                      value: 'Client',
                                      groupValue: role,
                                      activeColor: Colors.orangeAccent,
                                      fillColor: MaterialStateProperty.all(
                                          Colors.orange),
                                      onChanged: (val) {
                                        setState(() {
                                          role = val;
                                          saveData(key: 'role', value: val);
                                          print(role);
                                        });
                                      },
                                    ),
                                    const Text(
                                      'مستخدم',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Radio<String>(
                                      value: 'Technical',
                                      groupValue: role,
                                      activeColor: Colors.orangeAccent,
                                      fillColor: MaterialStateProperty.all(
                                          Colors.orange),
                                      onChanged: (val) {
                                        setState(() {
                                          role = val;
                                          saveData(key: 'role', value: val);
                                          print(val);
                                        });
                                      },
                                    ),
                                    const Text(
                                      'فنى',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            textButton(
                              state: state is! RegistrationLoginLoadingState,
                              text: 'تسجيل الدخول',
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  await cubit.registrationLogin(
                                    email: emailController.text,
                                    password: passwordController.text,
                                    role: role!,
                                  );

                                }
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Text(
                                  'ليس لديك حساب بالفعل ؟',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 13,
                                    color: Color(0xff000000),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () async {
                                    await navigateTo(
                                      context,
                                      const AreYouScreen(),
                                    );
                                  },
                                  child: const Text(
                                    'اضافه حساب',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xffFF7A00),
                                    ),
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
              ),
            );
          },
        ),
      );
}
