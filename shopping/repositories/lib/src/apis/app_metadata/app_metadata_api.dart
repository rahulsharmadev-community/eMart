part of 'app_metadata_repository.dart';

class AppMetaDataApi {
  final fs.DocumentReference documentRef;

  AppMetaDataApi({String language = 'en'})
      : documentRef = FirebaseService.eMartConsumer.instanceOfFirestore.doc('AppMetaData/$language');

  Stream<AppMetaData?> get stream {
    logs.i("AppMetaDataApi:getComplete initiating");
    return documentRef
        .withConverter<AppMetaData>(
            fromFirestore: (snap, _) => AppMetaData.fromJson(snap.data()!),
            toFirestore: (snap, _) => snap.toJson())
        .snapshots()
        .map((event) => event.data());
  }

  // Future<void> update(AppMetaData data) async {
  //   await documentRef
  //       .withConverter<AppMetaData>(
  //           fromFirestore: (snap, _) => AppMetaData.fromJson(snap.data()!),
  //           toFirestore: (snap, _) => snap.toJson())
  //       .set(data);
  // }
}
