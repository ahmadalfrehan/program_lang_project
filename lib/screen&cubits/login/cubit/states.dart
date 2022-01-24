
import 'package:abood/models/store_app/login_model.dart';
import 'package:abood/temp_model.dart';

abstract class StoreLoginStates {}

class StoreLoginInitialState extends StoreLoginStates {}

class StoreLoginLoadingState extends StoreLoginStates {}

class StoreLoginSuccessState extends StoreLoginStates
{
  final LoginModel loginModel;

  StoreLoginSuccessState(this.loginModel);
}
class StoreLoginSuccessStateT extends StoreLoginStates
{
  final TempModel tempModel;

  StoreLoginSuccessStateT(this.tempModel);
}

class StoreLoginErrorState extends StoreLoginStates
{
  final String error;

  StoreLoginErrorState(this.error);
}

class StoreChangePasswordVisibilityState extends StoreLoginStates {}
