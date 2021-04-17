import 'package:flutter/material.dart';
import 'package:whatsapp/core/locator.dart';
import 'package:whatsapp/core/services/chat_service.dart';
import 'package:whatsapp/models/profile.dart';
import 'package:whatsapp/viewmodels/base_model.dart';

class ContactsModel extends BaseModel {
  final ChatService _chatService = getIt<ChatService>();

  Future<List<Profile>> getContacts(String query) async {
    var contacts = await _chatService.getContacts();

    var filteredContacts = contacts.where(
            (profile) => profile.userName.startsWith(query ?? ""),
    ).toList();
    return filteredContacts;
  }
}