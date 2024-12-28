import 'package:flutter/material.dart';
import 'package:flutter_application_2/home/components/cloud_firestore_list.dart';
import 'package:flutter_application_2/other/misscell/page_our_hello_word.dart';
import 'package:flutter_application_2/firebase/cloud_firestore/1_simple_add_data/pageAddBuku.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Halaman Utama')), //
      body: SizedBox(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.end, //nempatkan Row di tengah secara horizontal
          children: [
            const CloudFirestoreList(),
            const Expanded(child: Column()),
            Row(
              mainAxisAlignment: MainAxisAlignment
                  .center, // Menempatkan tombol di tengah secara horizontal dalam Row
              children: [
                Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PageAddBuku(),
                            ),
                          );
                        },
                        child: const Text('Simple add data'))),
                Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const PageOurHelloWord(title: 'title')));
                        },
                        child: const Text('Ke halaman hellow word'))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// return const PageOurHelloWord(title: 'Ini adalah halaman hello word');
