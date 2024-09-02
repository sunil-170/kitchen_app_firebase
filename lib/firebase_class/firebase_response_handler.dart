import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:kitchen_app/firebase_class/firebase_response_model.dart';
import 'package:kitchen_app/firebase_class/models.dart';

enum RequestType { ADD, SET, UPDATE }

class FirebaseResponseHandler {
  final _firestore = FirebaseFirestore.instance;

  // Firestore
  // There are three type of data manipulations

  Future<dynamic> getDataFromFirebase(dynamic path) async {
    dynamic response;
    try {
      if (path is CollectionReference) {
        // TODO : ADD SOME COLLECTION FUNCTINALITY HERE.
        response = await _getDataFromCollection(path);
      } else if (path is DocumentReference) {
        // TODO : ADD SOME DOCUMENT REFF FUNCTINALITY HERE.
        response = await _getDataFromDocument(path);
      } else {
        // TODO : ADD SOME QUERY REFF FUNCTINALITY HERE.
        response = await _getDataFromQuery(path as Query);
      }
    } catch (e) {
      rethrow;
    }
  }

  /// 10,000
  /// 1,500
  ///
  ///
  /// 10,000 .where((e)=> e.status == Delivery);

  // Collection Reference
  // db.collection(_collection_name);

  Future<List<FirebaseResponseModel>> _getDataFromCollection(
      CollectionReference reff) async {
    List<FirebaseResponseModel> result = [];
    try {
      final snapshot = await reff.get();
      result = snapshot.docs
          .map((e) => FirebaseResponseModel.fromResponse(e))
          .toList();
    } catch (e) {
      print(e);
      rethrow;
    }
    return result;
  }

  Future<FirebaseResponseModel?> _getDataFromDocument(
      DocumentReference reff) async {
    FirebaseResponseModel? result;
    try {
      final snapshot = await reff.get();
      result = FirebaseResponseModel.fromResponse(snapshot);
    } catch (e) {
      rethrow;
    }
    return result;
  }

  Future<List<FirebaseResponseModel>> _getDataFromQuery(Query reff) async {
    List<FirebaseResponseModel> result = [];
    try {
      final snapshot = await reff.get();
      result = snapshot.docs
          .map((e) => FirebaseResponseModel.fromResponse(e))
          .toList();
    } catch (e) {
      rethrow;
    }

    return result;
  }

  Future<FirebaseResponseModel?> postData(
      dynamic path, Map<String, dynamic> data,
      [RequestType? request]) async {
    try {
      if (path is DocumentReference) {
        if (request == RequestType.SET) {
          await path.set(data);
        } else {
          await path.update(data);
        }
      } else if (path is CollectionReference) {
        final response = await path.add(data);
        return FirebaseResponseModel(data, response.id);
      } else {
        throw "Invalid Request";
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }
}
