import 'package:abood/models/store_app/register_model.dart';
import 'package:abood/screen&cubits/register/cubit/states.dart';
import 'package:abood/storage/my_dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoreRegisterCubit extends Cubit<StoreRegisterStates> {
  StoreRegisterCubit() : super(StoreRegisterInitialState());

  static StoreRegisterCubit get(context) => BlocProvider.of(context);

  late RegisterModel registerModel;

  void userRegister({
    required String name,
    required String email,
    required String password,
    required String number,
    required String facebook,
  }) {
    emit(StoreRegisterLoadingState());
    // print("Fuck OFFFFF in userRegister");

    MyDio.postData(
      url: 'register',
      data: {
        'name': name,
        'email': email,
        'password': password,
        'number': number,
        'facebook': facebook,
      },
    ).then((value) {
      print('22222222222222222222222222222');
      print(value.data);
      registerModel = RegisterModel.fromJson(value.data);
      emit(StoreRegisterSuccessState(registerModel));
    }).catchError((error) {
      print('1111111111111111111111111111111111');
      print(error.toString());
      emit(StoreRegisterErrorState(error.toString()));
    });
  }
}
