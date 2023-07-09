import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helpme/app_components/navigate_to.dart';
import 'package:helpme/app_constants/cache_helper.dart';
import 'package:helpme/registration/models/on_boarding_model.dart';
import 'package:helpme/registration/bloc/regestration_states.dart';
import 'package:helpme/registration/bloc/registration_cubit.dart';
import 'package:helpme/registration/screens/login.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: must_be_immutable
class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({Key? key}) : super(key: key);
  PageController pageController = PageController();
  void submit(context) {
    saveData(key: 'onBoarding', value: true).then((value) {
      if (value) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
                (route) => false);
      }
    }).catchError((error) {
      print(error.toString());
    });
  }
  @override
  Widget build(BuildContext context) => BlocProvider<RegistrationCubit>(
        create: (BuildContext context) => RegistrationCubit(),
        child: BlocConsumer<RegistrationCubit, RegistrationStates>(
          listener: (BuildContext context, RegistrationStates state) {},
          builder: (BuildContext context, RegistrationStates state) {
            final RegistrationCubit cubit = RegistrationCubit.get(context);
            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: PageView.builder(
                        itemCount: cubit.boardingModel.length,
                        itemBuilder: (BuildContext context, int index) =>
                            pageViewBuilder(
                          cubit.boardingModel[index],
                          context,

                        ),
                        controller: pageController,
                        physics: const BouncingScrollPhysics(),
                        onPageChanged: (int index) {
                          if (index == cubit.boardingModel.length - 1) {
                            cubit.isLastBoardingScreen = true;
                          } else {
                            cubit.isLastBoardingScreen = false;
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: <Widget>[
                          SmoothPageIndicator(
                            controller: pageController,
                            count: cubit.boardingModel.length,
                            effect: const ExpandingDotsEffect(
                              activeDotColor: Color(0xffFF7A00),
                              dotHeight: 6,
                              dotWidth: 20,
                            ),
                          ),
                          const Spacer(),
                          FloatingActionButton(
                            onPressed: () async {
                              if (cubit.isLastBoardingScreen == true) {
                                submit(context);
                              } else {
                                await pageController.nextPage(
                                  duration: const Duration(milliseconds: 20),
                                  curve: Curves.easeInOutQuint,
                                );
                              }
                            },
                            child: const Icon(
                              Icons.arrow_forward_ios_outlined,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      );
}

Widget pageViewBuilder(OnBoardingModel model, BuildContext context,) => Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Stack(
          children: <Widget>[
            Image(
              image: AssetImage(model.image1),
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 30,
              right: 10,
              child: Container(
                height: 40,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black12,
                ),
                child: TextButton(
                  onPressed: (){

                    saveData(key: 'onBoarding', value: true).then((value) {
                      if (value) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => LoginScreen()),
                                (route) => false);
                      }
                    }).catchError((error) {
                      print(error.toString());
                    });
                  },
                  child: const Text(
                    'تخطى ',
                    style: TextStyle(
                      color: Color(0xffFFFFFF),
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Image(
          image: AssetImage(model.image2),
          height: 80,
          width: 80,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          model.title1,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Color(0xff000000),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          model.title2,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w300,
            color: Color(0xff707070),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
