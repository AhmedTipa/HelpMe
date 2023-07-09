import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helpme/app_components/flutter_toastr.dart';
import 'package:helpme/app_components/navigate_to.dart';
import 'package:helpme/app_components/text_button.dart';
import 'package:helpme/app_components/text_form.dart';
import 'package:helpme/app_constants/cache_helper.dart';
import 'package:helpme/app_constants/constance.dart';
import 'package:helpme/registration/bloc/regestration_states.dart';
import 'package:helpme/registration/bloc/registration_cubit.dart';
import 'package:helpme/registration/screens/verify_code_signin.dart';

// ignore: must_be_immutable
class TechnicalScreen extends StatelessWidget {
  TechnicalScreen({Key? key}) : super(key: key);
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController governmentController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) => BlocProvider<RegistrationCubit>(
        create: (BuildContext context) => RegistrationCubit(),
        child: BlocConsumer<RegistrationCubit, RegistrationStates>(
          listener: (BuildContext context, RegistrationStates state) async {
            if (state is RegistrationSignUpSuccessState) {
              flutterToastr(
                context,
                msg: 'تم انشاء الحساب بنجاح',
                color: Colors.green,
              );
              await navigateTo(context, EnterVerifyCodeSignInScreen());
            } else if (state is RegistrationSignUpErrorState) {
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                const Text(
                                  'اضافة حساب',
                                  style: TextStyle(
                                    color: Color(0xff202224),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(
                                  width: 80,
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon:
                                        const Icon(Icons.arrow_forward_rounded),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            //1
                            textForm(
                              controller: nameController,
                              validation: (dynamic value) {
                                if (value.toString().isEmpty) {
                                  return 'من فضلك اكتب اسمك';
                                }
                                return null;
                              },
                              type: TextInputType.text,
                              hintText: 'الاسم بالكامل',
                              prefixIcon: Icons.person,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            //2
                            textForm(
                              controller: ageController,
                              validation: (dynamic value) {
                                if ( value.toString().isEmpty) {
                                  return 'من فضلك اكتب عمرك';
                                }
                                return null;
                              },
                              type: TextInputType.number,
                              hintText: 'العمر(الحد الادنى 15 عام)',
                              prefixIcon: Icons.edit,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            //3
                            textForm(
                              controller: countryController,
                              validation: (dynamic value) {
                                if (value.toString().isEmpty) {
                                  return 'من فضلك اكتب دولتك';
                                }
                                return null;
                              },
                              type: TextInputType.text,
                              hintText: 'الدولة',
                              prefixIcon: Icons.flag,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            //4
                            textForm(
                              controller: governmentController,
                              validation: (dynamic value) {
                                if (value.toString().isEmpty) {
                                  return 'من فضلك اكتب محافظتك';
                                }
                                return null;
                              },
                              type: TextInputType.text,
                              hintText: 'محافظة',
                              prefixIcon: Icons.cell_tower,
                            ),
                            const SizedBox(height: 5),
                            //5
                            textForm(
                              controller: cityController,
                              validation: (dynamic value) {
                                if (value.toString().isEmpty) {
                                  return 'من فضلك اكتب مدينتك';
                                }
                                return null;
                              },
                              type: TextInputType.text,
                              hintText: 'مدينة',
                              prefixIcon: Icons.location_city,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            textForm(
                              controller: phoneController,
                              validation: (dynamic value) {
                                if (value.toString().isEmpty) {
                                  return 'من فضلك اكتب رقم الموبايل';
                                }
                                return null;
                              },
                              type: TextInputType.number,
                              hintText: 'رقم الهاتف',
                              prefixIcon: Icons.phone_android_sharp,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            //6
                            textForm(
                              controller: emailController,
                              validation: (dynamic value) {
                                if (value.toString().isEmpty) {
                                  return 'من فضلك اكتب بريدك الالكترونى';
                                }
                                return null;
                              },
                              type: TextInputType.emailAddress,
                              hintText: 'البريد الالكتروني',
                              prefixIcon: Icons.email_rounded,
                            ),
                            const SizedBox(
                              height: 5,
                            ),

                            //7
                            textForm(
                              controller: passwordController,
                              validation: (dynamic value) {
                                if (value.toString().isEmpty) {
                                  return 'من فضلك اكتب كلمة المرور';
                                } else if (value.toString().length < 8) {
                                  return 'كلمة المرور يجب انت تكون ثمانية احرف';
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
                            const SizedBox(height: 25),
                            textButton(
                              state: state is !RegistrationSignUpLoadingState,
                              text: 'تسجيل ',
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  {
                                    await cubit.registrationSignUp(
                                      name: nameController.text,
                                      age: ageController.text,
                                      country: countryController.text,
                                      government: governmentController.text,
                                      city: cityController.text,
                                      phone: phoneController.text,
                                      email: emailController.text,
                                      password: passwordController.text,
                                      role: getData(key: 'role'),
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
        ),
      );
}
