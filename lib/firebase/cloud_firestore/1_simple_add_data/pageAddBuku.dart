import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/firebase/cloud_firestore/classes/buku.dart';
import 'package:flutter_application_2/firebase/cloud_firestore/services/srvcRakBuku.dart';

class PageAddBuku extends StatefulWidget {
  const PageAddBuku({super.key});

  @override
  State<PageAddBuku> createState() => _PageAddBukuState();
}

class _PageAddBukuState extends State<PageAddBuku> {
  final TextEditingController tecPenulis = TextEditingController();
  final TextEditingController tecJudulBuku = TextEditingController();
  final TextEditingController tecJumlahHalaman = TextEditingController();

  void _resetForm() {
    tecPenulis.clear();
    tecJudulBuku.clear();
    tecJumlahHalaman.clear();
  }

  final SrvRakBuku srvRakBuku = SrvRakBuku();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple add data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  TextField(
                    controller: tecPenulis,
                    decoration: const InputDecoration(
                      label: Text("Masukkan nama penulis"),
                    ),
                  ),
                  TextField(
                    controller: tecJudulBuku,
                    decoration: const InputDecoration(
                      label: Text("Masukkan nama buku"),
                    ),
                  ),
                  TextField(
                    controller: tecJumlahHalaman,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(
                      label: Text("Masukkan jumlah halaman"),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                ClsBuku buku = ClsBuku(
                  penulis: tecPenulis.text,
                  judulBuku: tecJudulBuku.text,
                  tanggalTerbit: DateTime.now(),
                  jumlahStockBuku: int.parse(tecJumlahHalaman.text),
                );

                bool isSuccess = srvRakBuku.addBuku(buku) as bool;

                if (isSuccess) {
                  _resetForm();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Data berhasil ditambahkan'),
                    ),
                  );
                }
              },
              child: const Text('Tambah Data'),
            ),
          ],
        ),
      ),
    );
  }
}
