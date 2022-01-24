
import 'package:abood/models/store_app/register_model.dart';

 class StoreRegisterStates {}

class StoreRegisterInitialState extends StoreRegisterStates {}

class StoreRegisterLoadingState extends StoreRegisterStates {}

class StoreRegisterSuccessState extends StoreRegisterStates
{
  final RegisterModel registerModel;

  StoreRegisterSuccessState(this.registerModel);
}

class StoreRegisterErrorState extends StoreRegisterStates
{
  final String error;

  StoreRegisterErrorState(this.error);
}

class StoreRegisterChangePasswordVisibilityState extends StoreRegisterStates {}
