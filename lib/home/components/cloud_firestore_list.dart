import 'package:flutter/material.dart';
import 'package:flutter_application_2/home/helper/cloud_firestore_constant.dart';
import 'package:flutter_application_2/firebase/cloud_firestore/1_simple_add_data/pageAddBuku.dart';

class CloudFirestoreList extends StatefulWidget {
  const CloudFirestoreList({super.key});

  @override
  State<CloudFirestoreList> createState() => _CloudFirestoreListState();
}

class _CloudFirestoreListState extends State<CloudFirestoreList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 0.25),
          child: Divider(
            height: 1,
          ),
        ),
        const Text("Could firestore library"),
        const Divider(
          height: 1,
        ),
        SizedBox(
          height: 60,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            itemCount: lsCloudFirebaseTopic.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(8),
            itemBuilder: (context, index) {
              return SizedBox(
                width: 200,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                            barrierDismissible: true,
                            context: context,
                            builder: (context) {
                              return lsCloudFirebaseTopic[index].page;
                            });
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      child: Text(
                        lsCloudFirebaseTopic[index].title,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 11),
                      )),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
