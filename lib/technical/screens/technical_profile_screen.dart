import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helpme/app_components/text_button.dart';
import 'package:helpme/technical/bloc/home-technical-cubit.dart';
import 'package:helpme/technical/bloc/home_technical_states.dart';

class TechnicalProfileScreen extends StatefulWidget {
  const TechnicalProfileScreen({Key? key}) : super(key: key);

  @override
  State<TechnicalProfileScreen> createState() => _TechnicalProfileScreenState();
}

class _TechnicalProfileScreenState extends State<TechnicalProfileScreen> {
  TextEditingController nameController = TextEditingController();

  TextEditingController ageController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController jobController = TextEditingController();

  TextEditingController governmentController = TextEditingController();

  TextEditingController cityController = TextEditingController();
  TextEditingController experienceController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool iconEdit = true;

  @override
  Widget build(BuildContext context) => BlocProvider<TechnicalCubit>(
        create: (BuildContext context) => TechnicalCubit()
          ..technicalGetData()
          ..technicalGetCompleteData(),
        child: BlocConsumer<TechnicalCubit, TechnicalStates>(
          listener: (BuildContext context, TechnicalStates state) {},
          builder: (BuildContext context, TechnicalStates state) {
            final TechnicalCubit cubit = TechnicalCubit.get(context);

            return ConditionalBuilder(
              condition: state is! TechnicalGetCompleteDataLoadingState &&
                  state is TechnicalGetCompleteDataSuccessState,
              builder: (context) => Directionality(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  const SizedBox(
                                    width: 60,
                                  ),
                                  const Text(
                                    'ملفى الشخصى',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        iconEdit = !iconEdit;
                                      });
                                    },
                                    icon: iconEdit == true
                                        ? const Icon(
                                            Icons.edit,
                                            color: Color(0xff707B81),
                                          )
                                        : const Icon(
                                            Icons.edit,
                                            color: Color(0xffFF7A00),
                                          ),
                                  ),
                                ],
                              ),
                              Stack(
                                children: <Widget>[
                                  const SizedBox(
                                    height: 110,
                                    child: CircleAvatar(
                                      radius: 45,
                                      backgroundImage: AssetImage(
                                        'assets/images/aa.jpg',
                                      ),
                                    ),
                                  ),
                                  const Positioned(
                                    top: 80,
                                    left: 33,
                                    child: CircleAvatar(
                                      radius: 15,
                                      backgroundColor: Color(0xffFF7A00),
                                    ),
                                  ),
                                  Positioned(
                                    top: 71,
                                    left: 24,
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.camera_alt_outlined,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              textAndTextField(
                                controller: nameController,
                                text1: 'الاسم بالكامل',
                                validateText: 'اسمك',
                                hintText: '${cubit.technicalModel!.name}',
                              ),
                              textAndTextField(
                                controller: ageController,
                                text1: 'العمر',
                                validateText: 'عمرك',
                                hintText: '${cubit.technicalModel!.age}',
                              ),
                              textAndTextField(
                                controller: phoneController,
                                text1: 'رقم الهاتف',
                                validateText: 'رقمك',
                                hintText: '${cubit.technicalModel!.number}',
                              ),
                              textAndTextField(
                                controller: governmentController,
                                text1: 'محافظة',
                                validateText: 'محافظتك',
                                hintText:
                                    '${cubit.technicalModel!.governorate}',
                              ),
                              textAndTextField(
                                controller: cityController,
                                text1: 'منطقة',
                                validateText: 'منطقتك',
                                hintText: '${cubit.technicalModel!.city}',
                              ),
                              textAndTextField(
                                controller: jobController,
                                text1: 'المهنه',
                                validateText: 'مهنتك',
                                hintText:
                                    '${cubit.technicalCompleteModel!.technical!.job}',
                              ),
                              textAndTextField(
                                controller: experienceController,
                                text1: 'الخبره',
                                validateText: 'خبرتك',
                                hintText:
                                '${cubit.technicalCompleteModel!.technical!.experience}',
                              ),
                              textAndTextField(
                                controller: emailController,
                                text1: 'البريد الالكترونى',
                                validateText: 'بريدك الالكترونى',
                                hintText: '${cubit.technicalModel!.email}',
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              if (iconEdit == false)
                                textButton(
                                  text: 'تعديل',
                                  onPressed: () {},
                                  state: true,
                                )
                              else
                                const Text(''),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              fallback: (context) =>
                  const Center(child: CircularProgressIndicator()),
            );
          },
        ),
      );
}

Widget textAndTextField({
  required TextEditingController controller,
  required String text1,
  required String validateText,
  required String hintText,
}) =>
    Column(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: Text(
            text1,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
        ),
        TextFormField(
          controller: controller,
          validator: (dynamic value) {
            if (value.toString().isEmpty) {
              return 'من فضلك اكتب $validateText';
            }
            return null;
          },
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintText: hintText,
            fillColor: const Color(0xffFFFFFF),
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.black12,
              ),
              borderRadius: BorderRadius.circular(
                8,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xffFF8B00),
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        const SizedBox(
          height: 0,
        ),
      ],
    );
