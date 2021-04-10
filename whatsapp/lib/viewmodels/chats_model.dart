
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:whatsapp/core/services/chat_service.dart';
import 'package:whatsapp/models/conversations.dart';

// view model datalarda değişiklik olduğunda changenotifier çağrılaraka yenileme yapılabilir
class ChatsModel with ChangeNotifier{
  final ChatService _db=GetIt.instance<ChatService>();

  // method da Firestoredb classından ürettiğimiz _db nesnesiyle Firestoredb classındaki getConversations methodunu çağırıyoruz
  Stream<List<Conversation>> conversations(String userId){
    return _db.getConversations(userId);
  }

}