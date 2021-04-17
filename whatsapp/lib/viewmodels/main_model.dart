import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/screens/contacts_page.dart';
import 'package:whatsapp/viewmodels/base_model.dart';

class MainModel extends BaseModel{

  Future<void> navigateToContacts() {
    Firebase.initializeApp();
    return navigatorService.navigateTo(ContactsPage());
  }
}