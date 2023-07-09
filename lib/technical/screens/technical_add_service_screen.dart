import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helpme/app_components/flutter_toastr.dart';
import 'package:helpme/app_components/text_button.dart';
import 'package:helpme/technical/bloc/home-technical-cubit.dart';
import 'package:helpme/technical/bloc/home_technical_states.dart';

// ignore: must_be_immutable
class TechnicalAddServiceScreen extends StatelessWidget {
  TechnicalAddServiceScreen({Key? key}) : super(key: key);

  TextEditingController serviceNameController = TextEditingController();
  TextEditingController servicePaymentController = TextEditingController();
  TextEditingController serviceBioController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      TechnicalCubit()
        ..technicalGetData(),
      child: BlocConsumer<TechnicalCubit, TechnicalStates>(
        listener: (context, state) {
          if (state is TechnicalAddServicesSuccessState) {
            flutterToastr(
              context,
              msg: 'تم اضافه الخدمه بنجاح',
              color: Colors.green,
            );
          }else if(state is TechnicalAddServicesErrorState){
            flutterToastr(
              context,
              msg:state.error,
              color: Colors.green,
            );
          }
        },
        builder: (context, state) {
          TechnicalCubit cubit = TechnicalCubit.get(context);
        return  ConditionalBuilder(
              condition: state is ! TechnicalGetDataLoadingState,
              builder: (context) =>
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Scaffold(
                      body: SafeArea(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Form(
                               key: formKey,
                              child: Column(
                                children: [
                                  const Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'اضافه خدمه ',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 25,
                                      ),
                                    ),
                                  ),
                                  Stack(
                                    children: [
                                      const Center(
                                        child: Image(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              'assets/images/Rectangle 34624115.png'),
                                          height: 200,
                                          width: 500,
                                        ),
                                      ),
                                      const Positioned(
                                        bottom: 10,
                                        left: 150,
                                        child: CircleAvatar(
                                          radius: 20,
                                          backgroundColor: Color(0xffFF7A00),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 4,
                                        left: 146,
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.camera_alt_outlined,
                                            size: 27,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  textAndTextField(
                                    controller: serviceNameController,
                                    text1: 'اسم الخدمه',
                                    validateText: 'اسم الخدمه',
                                  ),
                                  textAndTextField(
                                    controller: servicePaymentController,
                                    text1: 'حساب الخدمه',
                                    validateText: 'حساب الخدمه',
                                  ),
                                  textAndTextField(
                                    controller: serviceBioController,
                                    text1: 'عن الخدمه',
                                    validateText: 'وصف الخدمه',
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  textButton(
                                    text: 'اضافة الخدمة',
                                    onPressed: () {
                                      if(formKey.currentState!.validate()) {
                                        cubit.technicalAddServices(
                                          technicalId: cubit.technicalModel!.id
                                              .toString(),
                                          title: serviceNameController.text,
                                          description: serviceBioController.text,
                                          price: servicePaymentController.text,
                                        );
                                      }
                                    },
                                    state: state is! TechnicalAddServicesLoadingState,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
              fallback: (context) =>
              const Center(child: CircularProgressIndicator(),),
          );
        },
      ),
    );
  }
}

Widget textAndTextField({
  required TextEditingController controller,
  required String text1,
  required String validateText,
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
            if (value
                .toString()
                .isEmpty) {
              return 'من فضلك اكتب $validateText';
            }
            return null;
          },
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
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
