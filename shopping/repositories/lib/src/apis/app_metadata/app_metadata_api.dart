part of 'app_metadata_repository.dart';

class AppMetaDataApi {
  final fs.DocumentReference documentRef;

  AppMetaDataApi({String language = 'en'})
      : documentRef = FirebaseService.eMartConsumer.instanceOfFirestore.doc('AppMetaData/$language');

  Future<AppMetaData?> getComplete() async {
    logs.i("AppMetaDataApi:getComplete initiating");
    var result = await documentRef
        .withConverter<AppMetaData>(
            fromFirestore: (snap, _) => AppMetaData.fromJson(snap.data()!),
            toFirestore: (snap, _) => snap.toJson())
        .get();
    return result.data();
  }

  // Future<void> update(AppMetaData data) async {
  //   await documentRef
  //       .withConverter<AppMetaData>(
  //           fromFirestore: (snap, _) => AppMetaData.fromJson(snap.data()!),
  //           toFirestore: (snap, _) => snap.toJson())
  //       .set(data);
  // }
}
