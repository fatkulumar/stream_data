import 'package:flutter_application_2/firebase/cloud_firestore/1_simple_add_data/pageAddBuku.dart';
import 'package:flutter_application_2/firebase/cloud_firestore/2_stream_data.dart/stream_data.dart';

class CloudFirestoreTopic {
  String title;
  dynamic page;

  CloudFirestoreTopic(this.title, this.page);
}

// constant : tambahin kalo sudah membuat topic baru / button baru
List<CloudFirestoreTopic> lsCloudFirebaseTopic = [
  // simple app data
  CloudFirestoreTopic("Simple Add Data", const PageAddBuku()),
  CloudFirestoreTopic("Stream Data", const StreamData()),
  // masukin untuk page / button stream data
];
