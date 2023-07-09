import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helpme/app_constants/cache_helper.dart';
import 'package:helpme/app_constants/help_dio.dart';

import 'package:helpme/client/bloc/home_client_states.dart';
import 'package:helpme/client/main_screens/client_profile_screen.dart';
import 'package:helpme/client/main_screens/client_favorite_screen.dart';
import 'package:helpme/client/main_screens/client_home_screen.dart';
import 'package:helpme/client/main_screens/client_setting_screen.dart';
import 'package:helpme/client/models/client_services_model.dart';
import 'package:helpme/registration/models/login_model.dart';

class ClientCubit extends Cubit<ClientStates> {
  ClientCubit() : super(InitClientStates());

  static ClientCubit get(BuildContext context) => BlocProvider.of(context);

  List<Widget> screens = <Widget>[
    ClientHomeScreen(),
    const ClientFavoriteScreen(),
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
        print('success');
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
        print(response.data);
        clientModel = LoginModel.fromJson(response.data);
        print(clientModel!.name);
        emit(ClientGetDataSuccessState(clientModel!));
      }
    } on DioError catch (error) {
      emit(ClientGetDataErrorState(error.response.toString()));
      print(error.response);
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
      print(error.response);
    }
  }
}
