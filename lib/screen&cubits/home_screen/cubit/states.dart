
import 'package:abood/models/store_app/home_model.dart';

class HomeScreenStates {}

class HomeScreenInitialState extends HomeScreenStates {}

class HomeScreenLoadingState extends HomeScreenStates {}

class HomeScreenSuccessState extends HomeScreenStates
{
  final HomeModel homeModel;

  HomeScreenSuccessState(this.homeModel);
}

class HomeScreenErrorState extends HomeScreenStates
{
  final String error;

  HomeScreenErrorState(this.error);
}

class HomeScreenChangePasswordVisibilityState extends HomeScreenStates {}
