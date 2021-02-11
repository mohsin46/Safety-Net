import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

Future<void> addContacts(
    int contact1, int contact2, int contact3, int contact4) async {
  CollectionReference contacts =
      FirebaseFirestore.instance.collection('contacts');
  final _auth = FirebaseAuth.instance;
  String uid = _auth.currentUser.uid.toString();
  print("ADDING USER CONTACTSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSs");
  await contacts.doc(uid).set({
    'name': _auth.currentUser.displayName,
    'email': _auth.currentUser.email,
    'contact1': contact1,
    'contact2': contact2,
    'contact3': contact3,
    'contact4': contact4,
  });
  return;
}

Future<Map> getContacts() async {
  Map data;
  List numbers;
  print("INSIDE GET CONTACTSSSSSSSSSSSSSSSSS");
  CollectionReference contacts =
      FirebaseFirestore.instance.collection('contacts');
  final _auth = FirebaseAuth.instance;
  String uid = _auth.currentUser.uid.toString();
  await FirebaseFirestore.instance
      .collection('contacts')
      .doc(uid)
      .get()
      .then((DocumentSnapshot documentSnapshot) {
    if (documentSnapshot.exists) {
      print('Document data: ${documentSnapshot.data()}');
      data = documentSnapshot.data();
    } else {
      print('Document does not exist on the database');
      print(uid);
    }
  });
  return data;
}
