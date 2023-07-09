import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helpme/app_components/flutter_toastr.dart';
import 'package:helpme/app_components/navigate_to.dart';
import 'package:helpme/app_components/text_button.dart';
import 'package:helpme/app_components/text_form.dart';
import 'package:helpme/registration/bloc/regestration_states.dart';
import 'package:helpme/registration/bloc/registration_cubit.dart';
import 'package:helpme/registration/screens/confirm_password.dart';


// ignore: must_be_immutable
class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) => BlocProvider<RegistrationCubit>(
        create: (BuildContext context) => RegistrationCubit(),
        child: BlocConsumer<RegistrationCubit, RegistrationStates>(
          listener: (BuildContext context, RegistrationStates state) async {
            if (state is RegistrationForgotPasswordSuccessState) {
              flutterToastr(
                context,
                msg: 'تم الارسال بنجاح',
                color: Colors.green,
              );
              await navigateTo(context, ConfirmPassword());
            } else if (state is RegistrationForgotPasswordErrorState) {
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
                                image:
                                    AssetImage('assets/images/Characters.png'),
                                height: 200,
                                width: 189,
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            const Text(
                              'إسترجاع كلمة المرور',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff000000),
                              ),
                            ),
                            const Text(
                              'ادخل البريد الالكترونى'
                                  ' حتى يمكن استعادة كلمة المرور',
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
                              hintText: 'البريد الالكترونى / رقم الجوال ',
                              prefixIcon: Icons.email_rounded,
                            ),
                            const SizedBox(
                              height: 150,
                            ),
                            textButton(
                              state: state
                                  is !RegistrationForgotPasswordLoadingState,
                              text: 'إرسال',
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  await cubit.registrationForgotPassword(
                                    email: emailController.text,
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
