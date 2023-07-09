// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helpme/app_constants/cache_helper.dart';
import 'package:helpme/app_constants/constance.dart';
import 'package:helpme/registration/data_source/regestration_remote_data.dart';
import 'package:helpme/registration/models/login_model.dart';
import 'package:helpme/registration/models/on_boarding_model.dart';
import 'package:helpme/registration/models/regestration_model.dart';
import 'package:helpme/registration/models/registration_technical_model.dart';

import 'package:helpme/registration/bloc/regestration_states.dart';

class RegistrationCubit extends Cubit<RegistrationStates> {
  RegistrationCubit() : super(InitRegistrationState());

  static RegistrationCubit get(BuildContext context) =>
      BlocProvider.of(context);
  bool isLastBoardingScreen = false;
  List<OnBoardingModel> boardingModel = <OnBoardingModel>[
    OnBoardingModel(
      image1: 'assets/images/boarding_photo1.png',
      image2: 'assets/images/Logo.png',
      title1: 'ساعدنى ',
      title2: 'ساعدنى شركة مؤثوقة مختصة فى عالم \nالصيانة',
    ),
    OnBoardingModel(
      image1: 'assets/images/boarding_photo2.png',
      image2: 'assets/images/Logo.png',
      title1: 'لديك مشكلة و تحتاج للصيانة ',
      title2: 'اختر الخدمة التى تريدها و نرسل'
          ' لك مختصا \n للقيام بما تريده بأسرع ما يمكن',
    ),
    OnBoardingModel(
      image1: 'assets/images/boarding_photo3.png',
      image2: 'assets/images/Logo.png',
      title1: 'الكثير من الخدمات ',
      title2:
          'لدينا الكثير من الخدمات التى نقدمها لك \n  لتنال إعجابك بتطبيقنا',
    ),
  ];

  //----------------------------------------------
  // changePasswordVisible changePasswordVisible changePasswordVisible
  //----------------------------------------------
  IconData icon = Icons.visibility_outlined;
  bool isVisible = false;

  void changePasswordVisible() {
    isVisible = !isVisible;
    isVisible
        ? icon = Icons.visibility_outlined
        : icon = Icons.visibility_off_outlined;
    emit(RegistrationChangePasswordVisibleState());
  }

  IconData confirmIcon = Icons.visibility_outlined;
  bool isConfirmVisible = false;

  void confirmPasswordVisible() {
    isConfirmVisible = !isConfirmVisible;
    isConfirmVisible
        ? confirmIcon = Icons.visibility_outlined
        : confirmIcon = Icons.visibility_off_outlined;
    emit(RegistrationConfirmPasswordVisibleState());
  }

  //----------------------------------------------
  // RegistrationSignUp RegistrationSignUp RegistrationSignUp
  //----------------------------------------------

  RegistrationModel? registrationModel;

  // Future<void> registrationSignUp({
  //   required String name,
  //   required String age,
  //   required String country,
  //   required String government,
  //   required String city,
  //   required String phone,
  //   required String email,
  //   required String password,
  //   required String role,
  // }) async {
  //   emit(RegistrationSignUpLoadingState());
  //   await signup(
  //     url: '/api/users/signup',
  //     data: <String,dynamic>{
  //       'name': name,
  //       'age': int.parse(age),
  //       'country': country,
  //       'governorate': government,
  //       'city': city,
  //       'number': phone,
  //       'email': email,
  //       'password': password,
  //       'role': role,
  //     },
  //   ).then((Response<dynamic> value) {
  //     if (value.statusCode == 201) {
  //       registrationModel = RegistrationModel.fromJson(value.data);
  //       emailResendOtpSignup = email;
  //       registrationModel!.msg = value.statusMessage;
  //       emit(RegistrationSignUpSuccessState(registrationModel!));
  //     } else {
  //       throw Exception('Error');
  //     }
  //   }).catchError((dynamic error) {
  //     print(error);
  //     emit(RegistrationSignUpErrorState(error.toString()));
  //   });
  // }

  Future<void> registrationSignUp({
    required String name,
    required String age,
    required String country,
    required String government,
    required String city,
    required String phone,
    required String email,
    required String password,
    required String role,
  }) async {
    emit(RegistrationSignUpLoadingState());
    try {
      final Response<dynamic> response = await signup(
        url: '/api/users/signup',
        data: <String, dynamic>{
          'name': name,
          'age': int.parse(age),
          'country': country,
          'governorate': government,
          'city': city,
          'number': phone,
          'email': email,
          'password': password,
          'role': role,
        },
      );
      if (response.statusCode == 201) {
        registrationModel = RegistrationModel.fromJson(response.data);
        emailResendOtpSignup = email;
        emit(RegistrationSignUpSuccessState(registrationModel!));
      } else {
        throw Exception('Error');
      }
    } on DioError catch (error) {
      print(error.response);
      emit(RegistrationSignUpErrorState(error.response.toString()));
    }
  }

  Future<void> registrationVerifyCodeSignUp({
    required String uniqueString,
  }) async {
    emit(RegistrationVerifyCodeSignUpLoadingState());
    try {
      final Response<dynamic> response = await postData(
        url: '/api/users/verfiy-user',
        data: <String, dynamic>{
          'uniqueString': uniqueString,
        },
      );
      if (response.statusCode == 200) {
        emit(RegistrationVerifyCodeSignUpSuccessState());
      } else {
        throw Exception('Error Verify');
      }
    } on DioError catch (error) {
      emit(RegistrationVerifyCodeSignUpErrorState(error.response.toString()));
    }
  }

  Future<void> registrationResendOtpSignUp() async {
    emit(RegistrationResendOtpSignUpLoadingState());
    try {
      final Response<dynamic> response = await postData(
        url: '/api/users/resend-otp',
        data: <String, dynamic>{
          'email': emailResendOtpSignup,
        },
      );
      if (response.statusCode == 200) {
        emit(RegistrationResendOtpSignUpSuccessState());
      } else {
        throw Exception('Error Resend');
      }
    } on DioError catch (error) {
      print(error.response);
      emit(RegistrationResendOtpSignUpErrorState(error.response.toString()));
    }
  }

  //----------------------------------------------
  // Login Login Login Login Login Login Login
  //----------------------------------------------
  LoginModel? loginModel;

  Future<void> registrationLogin(
      {required String email,
      required String password,
      required String role}) async {
    emit(RegistrationLoginLoadingState());
    try {
      final Response<dynamic> response = await postData(
        url: '/api/users/signin',
        data: <String, dynamic>{
          'email': email,
          'password': password,
          'role': role,
        },
      );
      if (response.statusCode == 200) {
        loginModel = LoginModel.fromJson(response.data);
        print(loginModel!.token);
        print(loginModel!.role);
        token = loginModel!.token;
        emit(RegistrationLoginSuccessState(loginModel!));
      } else {
        throw Exception('Error');
      }
    } on DioError catch (error) {
      print(error.response);
      emit(RegistrationLoginErrorState(error.response.toString()));
    }
  }

  //----------------------------------------------
  // Forgot Password Forgot Password Forgot Password
  //----------------------------------------------
  Future<void> registrationForgotPassword({
    required String email,
  }) async {
    emit(RegistrationForgotPasswordLoadingState());
    try {
      final Response<dynamic> response = await postData(
        url: '/api/users/forgot-password',
        data: <String, dynamic>{
          'email': email,
        },
      );
      if (response.statusCode == 200) {
        emailResendOtpForgotPassword = email;
        emit(RegistrationForgotPasswordSuccessState());
      } else {
        throw Exception('Error Forgot Password');
      }
    } on DioError catch (error) {
      print(error.response);
      emit(RegistrationForgotPasswordErrorState(error.response.toString()));
    }
  }

  Future<void> registrationVerifyCodeForgotPassword({
    required String email,
    required String newPassword,
    required String uniqueString,
  }) async {
    emit(RegistrationVerifyCodeForgotPasswordLoadingState());
    try {
      final Response<dynamic> response = await postData(
        url: '/api/users/reset-password',
        data: <String, dynamic>{
          'email': email,
          'newpass': newPassword,
          'uniqueString': uniqueString,
        },
      );
      if (response.statusCode == 200) {
        emit(RegistrationVerifyCodeForgotPasswordSuccessState());
      } else {
        throw Exception('Error Verify');
      }
    } on DioError catch (error) {
      print(error.response);
      emit(
        RegistrationVerifyCodeForgotPasswordErrorState(
          error.response.toString(),
        ),
      );
    }
  }

  Future<void> registrationResendOtpForgotPassword() async {
    emit(RegistrationResendOtpForgotPasswordLoadingState());
    try {
      final Response<dynamic> response = await postData(
        url: '/api/users/resend-otp-reset',
        data: <String, dynamic>{
          'email': emailResendOtpForgotPassword,
        },
      );
      if (response.statusCode == 200) {
        emit(RegistrationResendOtpForgotPasswordSuccessState());
      } else {
        throw Exception('Error Resend');
      }
    } on DioError catch (error) {
      print(error.response);
      emit(
        RegistrationResendOtpForgotPasswordErrorState(
          error.response.toString(),
        ),
      );
    }
  }

  RegistrationTechnicalModel? registrationTechnicalModel;

  Future<void> registrationTechnicalCompleteSignUp({
    required String job,
    required String experience,
    required String description,
    required String gender,
    required String rangeJob,
    required String jobKind,
    required String token,
  }) async {
    emit(RegistrationTechnicalCompleteSignupLoadingState());
    try {
      final Response<dynamic> response = await postData(
        url: '/api/technical/technical-data',
        data: <String, dynamic>{
          'job': job,
          'experience': experience,
          'description': description,
          'gender': gender,
          'rangeJob': rangeJob,
          'jobKind': jobKind,
        },
        token: token,
      );
      if (response.statusCode == 201) {
        registrationTechnicalModel =
            RegistrationTechnicalModel.fromJson(response.data);

        emit(RegistrationTechnicalCompleteSignupSuccessState());
      } else {
        throw Exception('Error');
      }
    } on DioError catch (error) {
      print(error.response);
      emit(
        RegistrationTechnicalCompleteSignupErrorState(
          error.response.toString(),
        ),
      );
    }
  }
}
