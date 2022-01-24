


import 'package:abood/models/store_app/home_model.dart';
import 'package:abood/models/store_app/register_model.dart';
import 'package:abood/screen&cubits/home_screen/cubit/states.dart';
import 'package:abood/storage/my_dio.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenCubit extends Cubit<HomeScreenStates> {
  HomeScreenCubit() : super(HomeScreenInitialState());

  static HomeScreenCubit get(context) => BlocProvider.of(context);

  late HomeModel homeModel;

  Future<Response?> getHome(String type , String value)
  {
    
    emit(HomeScreenLoadingState());
    // print("Fuck OFFFFF in userRegister");
    if(value=='All' && type =='category'){
      return MyDio.postData(
        url: 'products', data: {},
      ).then((value){
        print(value.data);
        homeModel = HomeModel.fromJson(value.data);
        emit(HomeScreenSuccessState(homeModel));
      }).catchError((error)
      {
        print(error.toString());
        emit(HomeScreenErrorState(error.toString()));
      });
    }
    else
    return MyDio.postData(
      url: 'search', data: {
        'colum':type,
        'value':value
    },
    ).then((value){
      print(value.data);
      homeModel = HomeModel.fromJson(value.data);
      emit(HomeScreenSuccessState(homeModel));
    }).catchError((error)
    {
      print(error.toString());
      emit(HomeScreenErrorState(error.toString()));
    });
  }

}
