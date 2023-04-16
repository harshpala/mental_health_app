import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '/globals.dart' as globals;

class UserModel {
  final String? id;
  final String email;
  final String journal;
  final String name;
  final String phoneno;

  const UserModel({
    this.id,
    required this.email,
    required this.journal,
    required this.name,
    required this.phoneno,
  });

  toJson() {
    return {
      'email': email,
      'name': name,
      'number': phoneno,
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
      id: document.id,
      email: data['email'],
      journal: data['journal'],
      name: data['name'],
      phoneno: data['number'],
    );
  }
}

Future<UserModel> getUserDetails() async {
  final email = FirebaseAuth.instance.currentUser!.email;
  final snapshot = await FirebaseFirestore.instance
      .collection('Users')
      .where('email', isEqualTo: email)
      .get();
  final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
  return userData;
}

Future<void> updateJournal(value) async {
  await FirebaseFirestore.instance
      .collection('Users')
      .doc(globals.doc_id)
      .update({'journal': value})
      .then((v) => print('success'))
      .catchError((onError) => print('Failed: $onError'));
}
