import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helpme/app_components/flutter_toastr.dart';
import 'package:helpme/app_components/navigate_to.dart';
import 'package:helpme/app_components/radio_technical_complete.dart';
import 'package:helpme/app_components/text_button.dart';
import 'package:helpme/app_components/text_form.dart';
import 'package:helpme/app_constants/constance.dart';
import 'package:helpme/technical/screens/technical_body_screen.dart';
import 'package:helpme/registration/bloc/regestration_states.dart';
import 'package:helpme/registration/bloc/registration_cubit.dart';

// ignore: must_be_immutable
class TechnicalCompleteScreen extends StatefulWidget {
  const TechnicalCompleteScreen({Key? key}) : super(key: key);

  @override
  State<TechnicalCompleteScreen> createState() =>
      _TechnicalCompleteScreenState();
}

class _TechnicalCompleteScreenState extends State<TechnicalCompleteScreen> {
  TextEditingController jobController = TextEditingController();

  TextEditingController experienceController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? gender;
  String? work;
  String? genderWork;

  @override
  Widget build(BuildContext context) => BlocProvider<RegistrationCubit>(
        create: (BuildContext context) => RegistrationCubit(),
        child: BlocConsumer<RegistrationCubit, RegistrationStates>(
          listener: (BuildContext context, RegistrationStates state) async {
            if (state is RegistrationTechnicalCompleteSignupSuccessState) {
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
                          'مبروك تم استكمال بياناتك',
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
                              TechnicalBodyScreen(),
                            );
                          },
                          child: const Text(
                            'حسنا',
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
            } else if (state is RegistrationTechnicalCompleteSignupErrorState) {
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
                            const Center(
                              child: Image(
                                image: AssetImage('assets/images/amico.png'),
                                height: 200,
                                width: 210,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            textForm(
                              controller: jobController,
                              validation: (dynamic value) {
                                if (value.toString().isEmpty) {
                                  return 'من فضلك اكتب وظيفتك';
                                }
                                return null;
                              },
                              type: TextInputType.text,
                              prefixIcon: Icons.person,
                              hintText: 'الوظيفة',
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            textForm(
                              controller: experienceController,
                              validation: (dynamic value) {
                                if (value.toString().isEmpty) {
                                  return 'من فضلك اكتب خبرتك';
                                }
                                return null;
                              },
                              type: TextInputType.text,
                              prefixIcon: Icons.file_present_sharp,
                              hintText: 'الخبرة',
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            textForm(
                              controller: descriptionController,
                              validation: (dynamic value) {
                                if (value.toString().isEmpty) {
                                  return 'من فضلك اكتب نبذة عنك';
                                }
                                return null;
                              },
                              type: TextInputType.text,
                              prefixIcon: Icons.edit,
                              hintText: 'نبذة عني',
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            radioAndText(
                              text: 'النوع',
                              text1: 'ذكر',
                              value1: 'male',
                              groupValue1: gender,
                              onPress1: (dynamic val) {
                                setState(() {
                                  gender = val;
                                });
                              },
                              text2: 'انثى',
                              value2: 'female',
                              groupValue2: gender,
                              onPress2: (dynamic val) {
                                setState(() {
                                  gender = val;
                                  print(val);
                                });
                              },
                            ),
                            radioAndText(
                              text: 'الرغبة فى العمل',
                              text1: 'داخل المدينة',
                              value1: 'inside',
                              groupValue1: work,
                              onPress1: (dynamic val) {
                                setState(() {
                                  work = val;
                                });
                              },
                              text2: 'خارج المدينة',
                              value2: 'outside',
                              groupValue2: work,
                              onPress2: (dynamic val) {
                                setState(() {
                                  work = val;
                                  print(val);
                                });
                              },
                            ),
                            radioAndText(
                              text: 'نوع العمل',
                              text1: 'بالساعة',
                              value1: 'hour',
                              groupValue1: genderWork,
                              onPress1: (dynamic val) {
                                setState(() {
                                  genderWork = val;
                                });
                              },
                              text2: 'باليوم',
                              value2: 'day',
                              groupValue2: genderWork,
                              onPress2: (dynamic val) {
                                setState(() {
                                  genderWork = val;
                                });
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            textButton(
                              state: state
                                  is!
                              RegistrationTechnicalCompleteSignupLoadingState,
                              text: 'تسجيل الدخول',
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  await cubit
                                      .registrationTechnicalCompleteSignUp(
                                    job: jobController.text,
                                    experience: experienceController.text,
                                    description: descriptionController.text,
                                    gender: gender!,
                                    rangeJob: work!,
                                    jobKind: genderWork!,
                                    token: token!,
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
