import 'package:take_out_app/constants/imports.dart';

class Api {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final String path;
  late CollectionReference ref;
  Api(this.path) {
    ref = _db.collection(path);
  }
  Future<QuerySnapshot> getDataCollection() async {
    return ref.get();
  }

  Future<List<FoodData>> getDocuments([isExpress = false]) async {
    List<FoodData> foods = [];

    if (isExpress) {
      QuerySnapshot<Object?> a = await ref
          .where(
            "category",
            isEqualTo: "express",
          )
          .get();
      try {
        for (QueryDocumentSnapshot<Object?> e in a.docs) {
          foods.add(FoodData.fromJson(e.data() as Map<String, dynamic>));
        }
      } catch (e) {
        e.toString();
      }
    } else {
      QuerySnapshot data = await ref.get();
      try {
        for (QueryDocumentSnapshot<Object?> e in data.docs) {
          foods.add(FoodData.fromJson(e.data() as Map<String, dynamic>));
        }
      } catch (e) {
        e.toString();
      }
    }

    return foods;
  }

  Stream<QuerySnapshot> streamDataCollection() {
    return ref.snapshots();
  }

  Future<DocumentSnapshot> getDocumentById(String id) async {
    return ref.doc(id).get();
  }

  Future<void> removeDocument(String id) async {
    ref.doc(id).delete();
  }

  Future<DocumentReference> addDocument(Map data) {
    return ref.add(data);
  }

  Future<void> updateDocument(Map<String, dynamic> data, String id) async {
    return ref.doc(id).update(data);
  }
}
