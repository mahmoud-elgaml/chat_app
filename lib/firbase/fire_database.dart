import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:talkio_app/Features/chat/models/room_models.dart';

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
        if(userEmail.docs.isNotEmpty){
         
    String userId = userEmail.docs[0].id;
    List<String> members = [myUid, userId]..sort((a, b) => a.compareTo(b));
    QuerySnapshot roomExist = await firestore
        .collection('rooms')
        .where('members', isEqualTo: members)
        .get();
    if (roomExist.docs.isEmpty) {
      ChatRoom chatRoom = ChatRoom(
        lastMessageTime: DateTime.now().toString(),
        members: members,
        lastMessage: '',
        id: members.toString(),
        createdAt: DateTime.now().toString(),
      );
      await firestore
          .collection('rooms')
          .doc(members.toString())
          .set(chatRoom.toJson());
    }
  }
}
}