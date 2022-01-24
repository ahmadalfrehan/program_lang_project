import 'package:abood/models/store_app/login_model.dart';
import 'package:abood/screen&cubits/login/cubit/states.dart';
import 'package:abood/storage/my_dio.dart';
import 'package:abood/temp_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoreLoginCubit extends Cubit<StoreLoginStates> {
  StoreLoginCubit() : super(StoreLoginInitialState());

  static StoreLoginCubit get(context) => BlocProvider.of(context);

  late LoginModel loginModel;
  late TempModel tempModel;

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(StoreLoginLoadingState());

    MyDio.postData(
      // dont forget okey
      url: 'login',
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      // print(value.data);
      // loginModel = LoginModel.fromJson(value.data);
      // emit(StoreLoginSuccessState(loginModel));
      print(value.data);
      tempModel = TempModel.fromJson(value.data);
      emit(StoreLoginSuccessStateT(tempModel));
    }).catchError((error) {
      print('hiatooo');
      print(error.toString());
      emit(StoreLoginErrorState(error.toString()));
    });
  }
}
