import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Mainfoodpage extends StatefulWidget {
  const Mainfoodpage({super.key});

  @override
  State<Mainfoodpage> createState() => _MainfoodpageState();
}

class _MainfoodpageState extends State<Mainfoodpage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("เมนูอาหาร"),
      ),
      body: ListView(
        children: [
          Text("รายการอาหาร"),
          StreamBuilder(stream: FirebaseFirestore.instance.collection("Foods").snapshots(),
          builder: (context,snapshot) {
            switch (snapshot.connectionState){
              case ConnectionState.waiting:
              return CircularProgressIndicator();
              default:
              print(snapshot.data.length.toStr)
            }
          }
     
        ],
      ),
    );
  }
}