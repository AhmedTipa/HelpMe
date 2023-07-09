import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helpme/app_components/flutter_toastr.dart';
import 'package:helpme/app_components/navigate_to.dart';
import 'package:helpme/app_components/text_button.dart';
import 'package:helpme/app_components/text_form.dart';
import 'package:helpme/registration/bloc/regestration_states.dart';
import 'package:helpme/registration/bloc/registration_cubit.dart';
import 'package:helpme/registration/screens/login.dart';

// ignore: must_be_immutable
class ConfirmPassword extends StatelessWidget {
  ConfirmPassword({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) => BlocProvider<RegistrationCubit>(
      create: (BuildContext context) => RegistrationCubit(),
      child: BlocConsumer<RegistrationCubit, RegistrationStates>(
        listener: (BuildContext context, RegistrationStates state) async {
          if (state is RegistrationVerifyCodeForgotPasswordSuccessState) {
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
                        'تم تغيير كلمة السر بنجاح',
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
                            decoration: TextDecoration.underline,
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
          } else if (state is RegistrationVerifyCodeForgotPasswordErrorState) {
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
                  physics: const BouncingScrollPhysics(),
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
                          const Center(
                            child: Image(
                              image: AssetImage('assets/images/pana.png'),
                              height: 219,
                              width: 225,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'تأكيد كلمة المرور',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff000000),
                            ),
                          ),
                          const Text(
                            'قم بادخال كلمة المرور'
                            ' المكونة على الاقل من 8 ارقام',
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
                            height: 5,
                          ),
                          textForm(
                            controller: codeController,
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
                          const SizedBox(
                            height: 5,
                          ),
                          textForm(
                            controller: newPasswordController,
                            validation: (dynamic value) {
                              if (value.toString().isEmpty) {
                                return 'من فضلك اكتب كلمة المرور';
                              } else if (value.toString().length < 8) {
                                return 'كلمة المرور يجب انت تكون ثمانية احرف';
                              }
                              return null;
                            },
                            type: TextInputType.visiblePassword,
                            hintText: 'ادخل كلمة المرور الجديدة',
                            prefixIcon: Icons.lock,
                            obscureText: cubit.isVisible,
                            onPressed: cubit.changePasswordVisible,
                            suffixIcon: cubit.icon,
                          ),
                          Center(
                            child: TextButton(
                              onPressed: () async {
                                await cubit
                                    .registrationResendOtpForgotPassword();
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
                            height: 45,
                          ),
                          textButton(
                            state: state
                                is!
                            RegistrationVerifyCodeForgotPasswordLoadingState,
                            text: 'حفظ',
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                {
                                  await cubit
                                      .registrationVerifyCodeForgotPassword(
                                    email: emailController.text,
                                    newPassword: newPasswordController.text,
                                    uniqueString: codeController.text,
                                  );
                                }
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
      ),);
}
