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
        create: (BuildContext context) => ClientCubit(),
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
                            const Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                'الاسم بالكامل',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            TextFormField(
                              controller: nameController,
                              validator: (dynamic value) {
                                if (value.toString().isEmpty) {
                                  return 'من فضلك اكتب اسمك';
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
                              height: 5,
                            ),
                            const Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                'العمر',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            TextFormField(
                              controller: ageController,
                              validator: (dynamic value) {
                                if (value.toString().isEmpty) {
                                  return 'من فضلك اكتب اسمك';
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
                              height: 5,
                            ),
                            const Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                'رقم الهاتف',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            TextFormField(
                              controller: phoneController,
                              validator: (dynamic value) {
                                if (value.toString().isEmpty) {
                                  return 'رقم الهاتف';
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
                              height: 5,
                            ),
                            const Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                'البريد الالكترونى',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            TextFormField(
                              controller: emailController,
                              validator: (dynamic value) {
                                if (value.toString().isEmpty) {
                                  return 'من فضلك اكتب اسمك';
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
              fallback: (context) => Center(child: CircularProgressIndicator()),
            );
          },
        ),
      );
}

Widget columnBody({
  required Function() onPressEdit,
  required Function() onPressCamera,
  required TextEditingController nameController,
  required TextEditingController ageController,
  required TextEditingController phoneController,
  required TextEditingController emailController,
  bool iconEdit = false,
}) =>
    Column(
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
              onPressed: onPressEdit,
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
            Positioned(
              top: 80,
              left: 33,
              child: CircleAvatar(
                radius: 15,
                backgroundColor: const Color(0xffFF7A00),
                child: IconButton(
                  onPressed: onPressCamera,
                  icon: const Icon(
                    Icons.camera_alt_outlined,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        const Align(
          alignment: Alignment.topRight,
          child: Text(
            'الاسم بالكامل',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
        ),
        TextFormField(
          controller: nameController,
          validator: (dynamic value) {
            if (value.toString().isEmpty) {
              return 'من فضلك اكتب اسمك';
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
          height: 5,
        ),
        const Align(
          alignment: Alignment.topRight,
          child: Text(
            'العمر',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
        ),
        TextFormField(
          controller: ageController,
          validator: (dynamic value) {
            if (value.toString().isEmpty) {
              return 'من فضلك اكتب اسمك';
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
          height: 5,
        ),
        const Align(
          alignment: Alignment.topRight,
          child: Text(
            'رقم الهاتف',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
        ),
        TextFormField(
          controller: phoneController,
          validator: (dynamic value) {
            if (value.toString().isEmpty) {
              return 'رقم الهاتف';
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
          height: 5,
        ),
        const Align(
          alignment: Alignment.topRight,
          child: Text(
            'البريد الالكترونى',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
        ),
        TextFormField(
          controller: emailController,
          validator: (dynamic value) {
            if (value.toString().isEmpty) {
              return 'من فضلك اكتب اسمك';
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
    );
