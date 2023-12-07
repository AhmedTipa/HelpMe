import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helpme/app_components/text_button.dart';
import 'package:helpme/client/bloc/home_client_cubit.dart';
import 'package:helpme/client/bloc/home_client_states.dart';

class ClientProfileScreen extends StatefulWidget {
  const ClientProfileScreen({Key? key}) : super(key: key);

  @override
  State<ClientProfileScreen> createState() => _ClientProfileScreenState();
}

class _ClientProfileScreenState extends State<ClientProfileScreen> {
  TextEditingController nameController = TextEditingController();

  TextEditingController ageController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  bool iconEdit = true;

  @override
  Widget build(BuildContext context) => BlocProvider<ClientCubit>(
        create: (BuildContext context) => ClientCubit()..clientGetData(),
        child: BlocConsumer<ClientCubit, ClientStates>(
          listener: (BuildContext context, ClientStates state) {},
          builder: (BuildContext context, ClientStates state) {
            final ClientCubit cubit = ClientCubit.get(context);
            return ConditionalBuilder(
              condition: state is! ClientGetDataLoadingState,
              builder: (context) => Directionality(
                textDirection: TextDirection.rtl,
                child: Scaffold(
                  body: SafeArea(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              validateText: 'من فضلك اكتب الاسم',
                              hintText: '${cubit.clientModel!.name}',
                            ),
                            textAndTextField(
                              controller: nameController,
                              text1: 'العمر',
                              validateText: 'من فضلك اكتب العمر',
                              hintText: '${cubit.clientModel!.age}',
                            ),
                            textAndTextField(
                              controller: nameController,
                              text1: 'رقم الهاتف',
                              validateText: 'من فضلك اكتب رقم الهاتف',
                              hintText: '${cubit.clientModel!.number}',
                            ),
                            textAndTextField(
                              controller: nameController,
                              text1: 'البريد الالكترونى',
                              validateText: 'من فضلك اكتب البريد الالكترونى',
                              hintText: '${cubit.clientModel!.email}',
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
              fallback: (context) => const Center(child: CircularProgressIndicator()),
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
