import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';

extension FirebaseAppExt on FirebaseApp {
  FirebaseAuth get instanceOfAuth => FirebaseAuth.instanceFor(app: this);
  FirebaseFirestore get instanceOfFirestore => FirebaseFirestore.instanceFor(app: this);
  FirebaseDatabase get instanceOfDatabase => FirebaseDatabase.instanceFor(app: this);
  FirebaseStorage get instanceOfStorage => FirebaseStorage.instanceFor(app: this);
}
