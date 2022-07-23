import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final db = FirebaseFirestore.instance;

// Create a new user with a first and last name
final notes = <String, dynamic>{
  "first": "Ada",
  "last": "Lovelace",
  "born": 1815
};


class NewNote extends StatefulWidget {
  const NewNote({Key? key}) : super(key: key);

  @override
  State<NewNote> createState() => _NewNoteState();
}

class _NewNoteState extends State<NewNote> {
  late String title;
  late String body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0x6FFFFF6F),
        actions: [
          TextButton(
              onPressed: () {
                print("Text : $title\nBody : $body");

                // Add a new document with a generated ID
                db.collection("notes").add({
                  "title" : title,
                  "desc" : body
                }).then((DocumentReference doc) =>
                    print('DocumentSnapshot added with ID: ${doc.id}'));

              },
              child: const Text("Save"))
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (text) {
                  title = text;
                },
                style: const TextStyle(fontSize: 30),
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: "Title"),
              ),
            ),
            const SizedBox(height: 0),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  maxLines: 26,
                  onChanged: (text) {
                    body = text;
                  },
                  style: const TextStyle(fontSize: 20),
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: "Title"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
