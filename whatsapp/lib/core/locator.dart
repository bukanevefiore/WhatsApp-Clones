import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:whatsapp/core/services/auth_service.dart';
import 'package:whatsapp/core/services/chat_service.dart';
import 'package:whatsapp/viewmodels/chats_model.dart';
import 'package:whatsapp/viewmodels/sign_in_model.dart';

GetIt getIt=GetIt.instance;

setupLocators(){
  getIt.registerLazySingleton(() => ChatService());
  getIt.registerLazySingleton(() => AuthService());

  getIt.registerFactory(() => ChatsModel());
  getIt.registerFactory(() => SignInModel());

}