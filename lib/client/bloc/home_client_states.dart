import 'package:helpme/registration/models/login_model.dart';

abstract class ClientStates {}

class InitClientStates extends ClientStates {}

class ClientChangeBtmNavBarState extends ClientStates {}

class ClientSignOutLoadingState extends ClientStates {}

class ClientSignOutSuccessState extends ClientStates {}

class ClientSignOutErrorState extends ClientStates {
  final String error;

  ClientSignOutErrorState(this.error);
}

class ClientGetDataLoadingState extends ClientStates {}

class ClientGetDataSuccessState extends ClientStates {
  final LoginModel clientData;

  ClientGetDataSuccessState(this.clientData);
}

class ClientGetDataErrorState extends ClientStates {
  final String error;

  ClientGetDataErrorState(this.error);
}

class ClientGetServicesDataLoadingState extends ClientStates {}

class ClientGetServicesDataSuccessState extends ClientStates {}

class ClientGetServicesDataErrorState extends ClientStates {
  final String error;

  ClientGetServicesDataErrorState(this.error);
}
