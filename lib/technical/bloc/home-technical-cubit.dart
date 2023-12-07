import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helpme/app_constants/cache_helper.dart';
import 'package:helpme/app_constants/constance.dart';
import 'package:helpme/app_constants/help_dio.dart';
import 'package:helpme/registration/models/login_model.dart';
import 'package:helpme/technical/bloc/home_technical_states.dart';
import 'package:helpme/technical/models/technical_add_services_model.dart';
import 'package:helpme/technical/models/technical_complete_model.dart';
import 'package:helpme/technical/models/technical_services_model.dart';
import 'package:helpme/technical/screens/technical_add_service_screen.dart';
import 'package:helpme/technical/screens/technical_home_screen.dart';
import 'package:helpme/technical/screens/technical_profile_screen.dart';
import 'package:helpme/technical/screens/technical_setting_screen.dart';

class TechnicalCubit extends Cubit<TechnicalStates> {
  TechnicalCubit() : super(InitTechnicalStates());

  static TechnicalCubit get(BuildContext context) => BlocProvider.of(context);
  List<Widget> screens = <Widget>[
    TechnicalSettingScreen(),
    TechnicalProfileScreen(),
    TechnicalAddServiceScreen(),

  ];
  int activeIndex = 2;

  void changeBtmNavBar(int index) {
    activeIndex = index;
    emit(TechnicalChangeBtmNavBarState());
  }

  Future<void> technicalSignOut() async {
    emit(TechnicalSignOutLoadingState());
    try {
      final response = await helpGetData(url: '/api/users/signout');
      if (response.statusCode == 200) {
        print('success');
        emit(TechnicalSignOutSuccessState());
      }
    } on DioError catch (error) {
      emit(TechnicalSignOutErrorState(error.response.toString()));
    }
  }

  LoginModel? technicalModel;

  Future<void> technicalGetData() async {
    emit(TechnicalGetDataLoadingState());
    try {
      final Response<dynamic> response = await helpGetData(
        url: '/api/users/current-user',
        token: getData(key: 'token'),
      );
      if (response.statusCode == 200) {
        print(response.data);
        technicalModel = LoginModel.fromJson(response.data!);
        print(technicalModel!.id);
        technicalId = technicalModel!.id!.toString();
        emit(TechnicalGetDataSuccessState(technicalModel!));
      }
    } on DioError catch (error) {
      emit(TechnicalGetDataErrorState(error.response.toString()));
      print(error.response);
    }
  }

  TechnicalCompleteModel? technicalCompleteModel;

  Future<void> technicalGetCompleteData() async {
    emit(TechnicalGetDataLoadingState());
    try {
      final Response<dynamic> response = await helpGetData(
        url: '/api/technical/get-technical-data',
        token: getData(key: 'token'),
      );
      if (response.statusCode == 200) {
        technicalCompleteModel =
            TechnicalCompleteModel.fromJson(response.data!);
        print(technicalModel!.name);
        emit(TechnicalGetCompleteDataSuccessState());
      }
    } on DioError catch (error) {
      emit(TechnicalGetCompleteDataErrorState(error.response.toString()));
      print(error.response);
    }
  }

  TechnicalAddServicesModel? technicalAddServicesModel;

  Future<void> technicalAddServices({
    required String title,
    required String technicalId,
    required String description,
    required String price,
  }) async {
    emit(TechnicalAddServicesLoadingState());
    try {
      final Response<dynamic> response = await helpPostData(
        url: '/api/services/create-service',
        data: {
          'title': title,
          'technicalId': technicalId,
          'description': description,
          'price': int.parse(price),
        },
        token: getData(key: 'token'),
      );
      if (response.statusCode == 201) {
        print(response.data);
        technicalAddServicesModel =
            TechnicalAddServicesModel.fromJson(response.data!);
        emit(TechnicalAddServicesSuccessState());
      }
    } on DioError catch (error) {
      emit(TechnicalAddServicesErrorState(error.response.toString()));
      print(error.response);
    }
  }

  TechnicalServicesModel? technicalServicesModel;

  Future<void> technicalGetServicesData({
    required String technicalId,
  }) async {
    emit(TechnicalGetServicesDataLoadingState());
    try {
      final Response<dynamic> response = await helpPostData(
        url: '/api/services/get-services-by-user',
        token: getData(key: 'token'),
        data: {
          'technicalId': technicalId,
        },
      );
      if (response.statusCode == 200) {
        technicalServicesModel =
            TechnicalServicesModel.fromJson(response.data!);
        emit(TechnicalGetServicesDataSuccessState());
      }
    } on DioError catch (error) {
      emit(TechnicalGetServicesDataErrorState(error.response.toString()));
      print(error.response);
    }
  }
}
