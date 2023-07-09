

import 'package:helpme/registration/models/login_model.dart';
import 'package:helpme/registration/models/regestration_model.dart';

abstract class RegistrationStates {}

class InitRegistrationState extends RegistrationStates {}

class RegistrationChangePasswordVisibleState extends RegistrationStates {}

class RegistrationConfirmPasswordVisibleState extends RegistrationStates {}

class RegistrationSignUpLoadingState extends RegistrationStates {}

class RegistrationSignUpSuccessState extends RegistrationStates {
  RegistrationSignUpSuccessState(this.registrationModel);

  final RegistrationModel registrationModel;
}

class RegistrationSignUpErrorState extends RegistrationStates {
  RegistrationSignUpErrorState(this.error);

  final String error;
}

class RegistrationVerifyCodeSignUpLoadingState extends RegistrationStates {}

class RegistrationVerifyCodeSignUpSuccessState extends RegistrationStates {}

class RegistrationVerifyCodeSignUpErrorState extends RegistrationStates {
  RegistrationVerifyCodeSignUpErrorState(this.error);

  final String error;
}

class RegistrationResendOtpSignUpLoadingState extends RegistrationStates {}

class RegistrationResendOtpSignUpSuccessState extends RegistrationStates {}

class RegistrationResendOtpSignUpErrorState extends RegistrationStates {
  RegistrationResendOtpSignUpErrorState(this.error);

  final String error;
}

class RegistrationLoginLoadingState extends RegistrationStates {}

class RegistrationLoginSuccessState extends RegistrationStates {
  RegistrationLoginSuccessState(this.loginModel);

  final LoginModel loginModel;
}

class RegistrationLoginErrorState extends RegistrationStates {
  RegistrationLoginErrorState(this.error);

  final String error;
}

class RegistrationForgotPasswordLoadingState extends RegistrationStates {}

class RegistrationForgotPasswordSuccessState extends RegistrationStates {}

class RegistrationForgotPasswordErrorState extends RegistrationStates {
  RegistrationForgotPasswordErrorState(this.error);

  final String error;
}

class RegistrationVerifyCodeForgotPasswordLoadingState
    extends RegistrationStates {}

class RegistrationVerifyCodeForgotPasswordSuccessState
    extends RegistrationStates {}

class RegistrationVerifyCodeForgotPasswordErrorState
    extends RegistrationStates {
  RegistrationVerifyCodeForgotPasswordErrorState(this.error);

  final String error;
}

class RegistrationResendOtpForgotPasswordLoadingState
    extends RegistrationStates {}

class RegistrationResendOtpForgotPasswordSuccessState
    extends RegistrationStates {}

class RegistrationResendOtpForgotPasswordErrorState extends RegistrationStates {
  RegistrationResendOtpForgotPasswordErrorState(this.error);

  final String error;
}

class RegistrationTechnicalCompleteSignupLoadingState
    extends RegistrationStates {}

class RegistrationTechnicalCompleteSignupSuccessState
    extends RegistrationStates {}

class RegistrationTechnicalCompleteSignupErrorState extends RegistrationStates {
  RegistrationTechnicalCompleteSignupErrorState(this.error);

  final String error;
}
