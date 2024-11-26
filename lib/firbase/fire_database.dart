import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:talkio_app/Features/chat/models/message_model.dart';
import 'package:talkio_app/Features/chat/models/room_models.dart';
import 'package:uuid/uuid.dart';

class FireData {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final String myUid = FirebaseAuth.instance.currentUser!.uid;

  Future createRoom(String email) async {
    QuerySnapshot userEmail = await firestore
        .collection('users')
        .where(
          'email',
          isEqualTo: email,
        )
        .get();
    if (userEmail.docs.isNotEmpty) {
      String userId = userEmail.docs[0].id;
      List<String> members = [myUid, userId]..sort((a, b) => a.compareTo(b));
      QuerySnapshot roomExist = await firestore
          .collection('rooms')
          .where('members', isEqualTo: members)
          .get();
      if (roomExist.docs.isEmpty) {
        ChatRoom chatRoom = ChatRoom(
          lastMessageTime: DateTime.now().millisecondsSinceEpoch.toString(),
          members: members,
          lastMessage: '',
          id: members.toString(),
          createdAt: DateTime.now().millisecondsSinceEpoch.toString(),
        );
        await firestore
            .collection('rooms')
            .doc(members.toString())
            .set(chatRoom.toJson());
      }
    }
  }

  Future sendMessage(String uId, String msg, String roomId,
      {String? type}) async {
    String msgId = Uuid().v4();
    MessageModel message = MessageModel(
      message: msg,
      id: msgId,
      type: type ?? 'text',
      createdAt: DateTime.now().millisecondsSinceEpoch.toString(),
      read: '',
      fromId: myUid,
      toId: uId,
    );
    await firestore
        .collection('rooms')
        .doc(roomId)
        .collection('messages')
        .doc(msgId)
        .set(message.toJson());
    firestore.collection('rooms').doc(roomId).update({
      'last_message': type ?? msg,
      'last_message_time': DateTime.now().millisecondsSinceEpoch.toString()
    });
  }

  Future readMessage(String roomId, String msgId) async {
    await firestore
        .collection('rooms')
        .doc(roomId)
        .collection('messages')
        .doc(msgId)
        .update({
      'read': DateTime.now().millisecondsSinceEpoch.toString(),
    });
  }
}
