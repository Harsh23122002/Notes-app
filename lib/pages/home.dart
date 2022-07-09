import 'package:flutter/material.dart';
import 'dart:async';

import 'package:notes_app/main.dart';
List<NoteCard> cards = [];
int count =0;


class Home extends StatefulWidget {
  Home({required this.stream});
  final Stream<int> stream;



  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState(){
    super.initState();
    widget.stream.listen((index) {
      mySetState(index);
    });
  }

  void mySetState(int index){
    setState((){
      cards.removeAt(index);
      print("index is $index");
      print("1called $index");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          count++;
          setState((){
            cards.add(NoteCard(title: count.toString(), content: 'ex',indx: count,));
          });

        },
        backgroundColor: Colors.red,
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [ElevatedButton(onPressed: (){print(cards);}, child: Text("print"))],
        title: const Text(
          "Notes",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: cards),
      ),
    );
  }

}


//Row(children: [Icon(Icons.delete),Icon(Icons.edit)]),

class NoteCard extends StatefulWidget {

  const NoteCard({Key? key, required this.title, required this.content,required this.indx} ) : super(key: key);

  final String title;
  final String content;
  final int indx;

  @override
  State<NoteCard> createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8,4,8,0),
      child: Card(
        elevation: 10,
        child: ListTile(
          // leading: Icon(Icons.note),
          title: Text(widget.title),
          subtitle: Text(widget.content),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {

                  setState((){
                    //cards.removeAt(widget.indx);
                    streamController.add(widget.indx);
                  });

                },
              ),
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  print(widget.indx);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

//here's a change in the code
//change 2



