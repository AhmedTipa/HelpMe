import 'package:helpme/registration/models/login_model.dart';

abstract class TechnicalStates {}

class InitTechnicalStates extends TechnicalStates {}

class TechnicalChangeBtmNavBarState extends TechnicalStates {}

class TechnicalSignOutLoadingState extends TechnicalStates {}

class TechnicalSignOutSuccessState extends TechnicalStates {}

class TechnicalSignOutErrorState extends TechnicalStates {
  final String error;

  TechnicalSignOutErrorState(this.error);
}

class TechnicalGetDataLoadingState extends TechnicalStates {}

class TechnicalGetDataSuccessState extends TechnicalStates {
  final LoginModel technicalModel;

  TechnicalGetDataSuccessState(this.technicalModel);
}

class TechnicalGetDataErrorState extends TechnicalStates {
  final String error;

  TechnicalGetDataErrorState(this.error);
}

class TechnicalAddServicesLoadingState extends TechnicalStates {}

class TechnicalAddServicesSuccessState extends TechnicalStates {}

class TechnicalAddServicesErrorState extends TechnicalStates {
  final String error;

  TechnicalAddServicesErrorState(this.error);
}

class TechnicalGetCompleteDataLoadingState extends TechnicalStates {}

class TechnicalGetCompleteDataSuccessState extends TechnicalStates {}

class TechnicalGetCompleteDataErrorState extends TechnicalStates {
  final String error;

  TechnicalGetCompleteDataErrorState(this.error);
}

class TechnicalGetServicesDataLoadingState extends TechnicalStates {}

class TechnicalGetServicesDataSuccessState extends TechnicalStates {}

class TechnicalGetServicesDataErrorState extends TechnicalStates {
  final String error;

  TechnicalGetServicesDataErrorState(this.error);
}
