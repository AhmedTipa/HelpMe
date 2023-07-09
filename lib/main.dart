import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helpme/app_constants/bloc_observer.dart';
import 'package:helpme/app_constants/cache_helper.dart';
import 'package:helpme/app_constants/color_constant.dart';
import 'package:helpme/app_constants/constance.dart';
import 'package:helpme/app_constants/help_dio.dart';
import 'package:helpme/client/data_source/client_remote_data.dart';
import 'package:helpme/client/main_screens/client_body_screen.dart';
import 'package:helpme/technical/data_source/technical_remote_data.dart';
import 'package:helpme/technical/screens/technical_body_screen.dart';
import 'package:helpme/registration/data_source/regestration_remote_data.dart';
import 'package:helpme/registration/screens/login.dart';

import 'registration/screens/on_boarding_screen.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Color(backgroundColor),
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  if (kDebugMode) {
    Bloc.observer = MyBlocObserver();
  }
  registrationInitDio();
  helpInitDio();
  await cacheHelperInit();
  token = getData(key: 'token');
  print(token);
  var onBoarding = getData(key: 'onBoarding');
  print(onBoarding);
  role = getData(key: 'role');
  print(role);
  Widget? widget;
  if (onBoarding != null) {
    if (token != null) {
      if (role == 'Client') {
        widget = ClientBodyScreen();
      } else if (role == 'Technical') {
        widget = TechnicalBodyScreen();
      }
    } else {
      widget = OnBoardingScreen();
    }
  } else if (onBoarding == null) {
    widget = OnBoardingScreen();
  }
  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget? startWidget;

  const MyApp({super.key, this.startWidget});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Directionality(
            textDirection: TextDirection.ltr, child: startWidget!),
        theme: ThemeData(
          scaffoldBackgroundColor: Color(backgroundColor),
          appBarTheme: AppBarTheme(
            color: Color(backgroundColor),
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Color(backgroundColor),
            ),
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Color(buttonColor),
          ),
          indicatorColor: const Color(0xffFF7A00),
        ),
      );
}
