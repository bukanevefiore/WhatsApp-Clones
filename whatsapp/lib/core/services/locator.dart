import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'file:///C:/src/projeler/WhatsApp-Clones/whatsapp/lib/core/services/firestore_db.dart';

GetIt getIt=GetIt.instance;

setupLocators(){
  getIt.registerLazySingleton(() => FirestoreDB());

}