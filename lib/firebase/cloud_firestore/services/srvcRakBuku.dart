import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_2/firebase/cloud_firestore/classes/buku.dart';

class SrvRakBuku {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late final CollectionReference<ClsBuku> _rakBukuRef;

  SrvRakBuku() {
    _rakBukuRef = _firestore.collection("rak_buku").withConverter<ClsBuku>(
        fromFirestore: (snapshot, _) => ClsBuku.fromJson(snapshot.data()!),
        toFirestore: (rakBuku, _) => rakBuku.toJson());
  }

  // service

  // Add data
  Future<void> addBuku(ClsBuku buku) async {
    await _rakBukuRef.add(buku);
  }

  Stream<QuerySnapshot<ClsBuku>> getStreamRakBuku() =>
      _rakBukuRef.snapshots(); // todo: buat stream collection rak buku>
}
