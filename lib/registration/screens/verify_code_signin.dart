import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_toastr/flutter_toastr.dart';
import 'package:helpme/app_components/flutter_toastr.dart';
import 'package:helpme/app_components/navigate_to.dart';
import 'package:helpme/app_components/text_button.dart';
import 'package:helpme/app_components/text_form.dart';
import 'package:helpme/registration/bloc/regestration_states.dart';
import 'package:helpme/registration/bloc/registration_cubit.dart';
import 'package:helpme/registration/screens/login.dart';

// ignore: must_be_immutable
class EnterVerifyCodeSignInScreen extends StatelessWidget {
  EnterVerifyCodeSignInScreen({Key? key}) : super(key: key);
  TextEditingController verifyCodeController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) => BlocProvider<RegistrationCubit>(
        create: (BuildContext context) => RegistrationCubit(),
        child: BlocConsumer<RegistrationCubit, RegistrationStates>(
          listener: (BuildContext context, RegistrationStates state) async {
            if (state is RegistrationVerifyCodeSignUpSuccessState) {
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
                            navigateTo(
                              context,
                              LoginScreen(),
                            );
                          },
                          child: const Text(
                            'تسجيل الدخول',
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
            } else if (state is RegistrationVerifyCodeSignUpErrorState) {
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
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                image: AssetImage('assets/images/amico.png'),
                                height: 200,
                                width: 269,
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            const Text(
                              'أدخل الكود',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff000000),
                              ),
                            ),
                            const Text(
                              'ادخل الكود المرسل على '
                              'البريد الالكتروني لتاكيد انشاء حسابك',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                height: 1,
                                color: Color(0xff9CA3AF),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            textForm(
                              controller: verifyCodeController,
                              type: TextInputType.text,
                              validation: (dynamic value) {
                                if (value.toString().isEmpty) {
                                  return 'من فضلك ادخل الكود';
                                } else {
                                  return null;
                                }
                              },
                              hintText: ' ادخل كود التحقق',
                              prefixIcon: Icons.code_sharp,
                            ),
                            Center(
                              child: TextButton(
                                onPressed: () async {
                                  await cubit
                                      .registrationResendOtpSignUp()
                                      .whenComplete(() {
                                    if (state is
                                    RegistrationResendOtpSignUpSuccessState) {
                                      FlutterToastr.show(
                                        'تم اعادة ارسال الكود',
                                        context,
                                        position: FlutterToastr.bottom,
                                        backgroundColor: Colors.green,
                                        duration: FlutterToastr.lengthLong,
                                      );
                                    } else {
                                      if (state is
                                      RegistrationResendOtpSignUpErrorState) {
                                        FlutterToastr.show(
                                          state.error,
                                          context,
                                          position: FlutterToastr.bottom,
                                          backgroundColor: Colors.red,
                                          duration: FlutterToastr.lengthLong,
                                        );
                                      }
                                    }
                                  });
                                },
                                style: ButtonStyle(
                                  overlayColor: MaterialStateProperty.all(
                                    Colors.black12,
                                  ),
                                ),
                                child: const Text(
                                  'إعادة إرسال رمز التحقيق؟',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: Color(0xffFF7A00),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 130,
                            ),
                            textButton(
                              state: state
                                  is! RegistrationVerifyCodeSignUpLoadingState,
                              text: 'تاكيد',
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  await cubit.registrationVerifyCodeSignUp(
                                    uniqueString: verifyCodeController.text,
                                  );
                                }
                              },
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
