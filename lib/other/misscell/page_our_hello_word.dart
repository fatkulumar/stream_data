import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PageOurHelloWord extends StatefulWidget {
  const PageOurHelloWord({super.key, required this.title});

  final String title;

  @override
  State<PageOurHelloWord> createState() => _PageOurHelloWordState();
}

class _PageOurHelloWordState extends State<PageOurHelloWord> {
  Future<QuerySnapshot<Map<String, dynamic>>> getRakData() async {
    await Future.delayed(const Duration(seconds: 2));
    return FirebaseFirestore.instance.collection("rak_buku").get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
        future: getRakData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: Text('waiting...'));
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ...snapshot.data!.docs.map((doc) {
                    return Text(
                      '${doc['penulis']} ${doc['judul_buku']}',
                    );
                  }),
                ],
              ),
            );
          } else {
            return const Center(child: Text('No data found'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
