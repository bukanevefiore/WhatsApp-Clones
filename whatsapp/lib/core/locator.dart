import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:whatsapp/core/services/auth_service.dart';
import 'package:whatsapp/core/services/chat_service.dart';
import 'package:whatsapp/core/services/navigator_service.dart';
import 'package:whatsapp/viewmodels/chats_model.dart';
import 'package:whatsapp/viewmodels/contacts_model.dart';
import 'package:whatsapp/viewmodels/main_model.dart';
import 'package:whatsapp/viewmodels/sign_in_model.dart';

GetIt getIt=GetIt.instance;

setupLocators(){
  Firebase.initializeApp();
  getIt.registerLazySingleton(() => NavigatorService());
  getIt.registerLazySingleton(() => ChatService());
  getIt.registerLazySingleton(() => AuthService());

  getIt.registerFactory(() => MainModel());
  getIt.registerFactory(() => ChatsModel());
  getIt.registerFactory(() => SignInModel());
  getIt.registerFactory(() => ContactsModel());

}