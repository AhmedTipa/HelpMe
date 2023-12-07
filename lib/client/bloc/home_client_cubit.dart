import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helpme/app_constants/cache_helper.dart';
import 'package:helpme/app_constants/help_dio.dart';

import 'package:helpme/client/bloc/home_client_states.dart';
import 'package:helpme/client/main_screens/client_profile_screen.dart';
import 'package:helpme/client/main_screens/client_favorite_screen.dart';
import 'package:helpme/client/main_screens/client_home_screen.dart';
import 'package:helpme/client/main_screens/client_services_screen.dart';
import 'package:helpme/client/main_screens/client_setting_screen.dart';
import 'package:helpme/client/models/client_get_technicals_date_model.dart';
import 'package:helpme/client/models/client_services_model.dart';
import 'package:helpme/client/screens/sections/plumbing_screen.dart';
import 'package:helpme/registration/models/login_model.dart';

class ClientCubit extends Cubit<ClientStates> {
  ClientCubit() : super(InitClientStates());

  static ClientCubit get(BuildContext context) => BlocProvider.of(context);

  List<Widget> screens = <Widget>[
    ClientHomeScreen(),
    const ClientServicesScreen(),
    const ClientProfileScreen(),
    const ClientSettingScreen(),
  ];
  int currentIndex = 0;

  void changeBtmNavBar(int index) {
    currentIndex = index;
    emit(ClientChangeBtmNavBarState());
  }

// ClientSignOut   ClientSignOut    ClientSignOut

  Future<void> clientSignOut() async {
    emit(ClientSignOutLoadingState());
    try {
      final response = await helpGetData(url: '/api/users/signout');
      if (response.statusCode == 200) {

        emit(ClientSignOutSuccessState());
      }
    } on DioError catch (error) {
      emit(ClientSignOutErrorState(error.response.toString()));
    }
  }

  // ClientGetData  ClientGetData   ClientGetData

  LoginModel? clientModel;

  Future<void> clientGetData() async {
    emit(ClientGetDataLoadingState());
    try {
      final Response<dynamic> response = await helpGetData(
        url: '/api/users/current-user',
        token: getData(key: 'token'),
      );
      if (response.statusCode == 200) {
        clientModel = LoginModel.fromJson(response.data);
        emit(ClientGetDataSuccessState(clientModel!));
      }
    } on DioError catch (error) {
      emit(ClientGetDataErrorState(error.response.toString()));
    }
  }

// ClientGetServicesData  ClientGetServicesData   ClientGetServicesData

  ClientServicesModel? clientServicesModel;

  Future<void> clientGetServicesData({
    int? index,
  }) async {
    emit(ClientGetServicesDataLoadingState());
    try {
      final Response<dynamic> response = await helpGetData(
        url: '/api/services/get-services',
        token: getData(key: 'token'),
      );
      if (response.statusCode == 200) {
        clientServicesModel = ClientServicesModel.fromJson(response.data);

        emit(ClientGetServicesDataSuccessState());
      }
    } on DioError catch (error) {
      emit(ClientGetServicesDataErrorState(error.response.toString()));
    }
  }
int index=0;
  ClientGetTechnicalsDataModel? clientGetTechnicalsDataModel;

  Future<void> clientGetTechnicalsData() async {
    emit(ClientGetTechnicalsDataLoadingState());
    try {
      final Response<dynamic> response = await helpGetData(
          url: '/api/technical/get-technicals',
          token: getData(key: 'token'),
          );
      if (response.statusCode == 200) {
        clientGetTechnicalsDataModel =
            ClientGetTechnicalsDataModel.fromJson(response.data);
        emit(
            ClientGetTechnicalsDataSuccessState(clientGetTechnicalsDataModel!));
      }
    } on DioError catch (error) {
      emit(ClientGetServicesDataErrorState(error.response.toString()));
    }
  }
}
