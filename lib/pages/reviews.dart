// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Reviews extends StatefulWidget {
  const Reviews({super.key});

  @override
  State<Reviews> createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
  final db = FirebaseFirestore.instance;
  TextEditingController reviews = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment(2, 1),
            colors: <Color>[
              Color.fromARGB(255, 84, 138, 183),
              Color.fromARGB(255, 255, 255, 255),
            ],
            tileMode: TileMode.mirror,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Column(
            children: [
              Expanded(
                child: StreamBuilder(
                  stream: db.collection('reviews').snapshots(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: snapshot.data?.docs.length,
                        itemBuilder: (context, int index) {
                          DocumentSnapshot documentSnapshot =
                              snapshot.data.docs[index];

                          return Card(
                            color: const Color.fromARGB(255, 167, 200, 227),
                            elevation: 4.0,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 8.0,
                            ),
                            child: ListTile(
                              title: Text(
                                documentSnapshot['review'],
                                style: const TextStyle(color: Colors.black),
                              ),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete_outline),
                                onPressed: () {
                                  db
                                      .collection('reviews')
                                      .doc(documentSnapshot.id)
                                      .delete();
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text("Deleted"),
                                    backgroundColor: Colors.red,
                                  ));
                                },
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color.fromARGB(255, 84, 138, 183),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: TextField(
                          controller: reviews,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Your Reviews",
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await db
                            .collection('reviews')
                            .add({'review': reviews.text});
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Thank You"),
                            backgroundColor: Colors.green,
                          ),
                        );
                      },
                      child: const Text("Send"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.circular(4.0),
        child: BottomAppBar(
          padding: const EdgeInsets.all(6.0),
          color: const Color.fromARGB(255, 84, 138, 183),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                iconSize: 30.0,
                onPressed: () {},
                icon: const Icon(Icons.add_comment_outlined),
              ),
              IconButton(
                iconSize: 30.0,
                onPressed: () {},
                icon: const Icon(Icons.airplane_ticket_outlined),
              ),
              IconButton(
                iconSize: 30.0,
                onPressed: () {
                  Navigator.pushNamed(context, "/home");
                },
                icon: const Icon(Icons.home_outlined),
              ),
              IconButton(
                iconSize: 30.0,
                onPressed: () {},
                icon: const Icon(Icons.rate_review_outlined),
              ),
              IconButton(
                iconSize: 30.0,
                onPressed: () {
                  Navigator.pushNamed(context, '/profile');
                },
                icon: const Icon(Icons.account_circle_outlined),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
