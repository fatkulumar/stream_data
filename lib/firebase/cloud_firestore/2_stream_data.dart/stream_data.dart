import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/firebase/cloud_firestore/classes/buku.dart';
import 'package:flutter_application_2/firebase/cloud_firestore/services/srvcRakBuku.dart';
import 'package:intl/intl.dart';

class StreamData extends StatelessWidget {
  const StreamData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Expanded(child: CardCollectionRakBuku())],
      ),
    );
  }
}

class CardCollectionRakBuku extends StatelessWidget {
  CardCollectionRakBuku({super.key});

  final SrvRakBuku srvRakBuku = SrvRakBuku();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<ClsBuku>>(
        // todo: buat stream collection rak buku
        stream: srvRakBuku.getStreamRakBuku(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasData &&
              snapshot.connectionState == ConnectionState.active) {
            List<QueryDocumentSnapshot<ClsBuku>> data = snapshot.data!.docs;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(data[index].data().judulBuku),
                              Text(data[index].data().penulis),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(data[index].data().jumlahStockBuku.toString()),
                            Text(DateFormat.yMMMMEEEEd()
                                .format(data[index].data().tanggalTerbit)),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return const Center(
            child: Text("Tidak ada data kan"),
          );
        });
  }
}
