import 'package:counter_7/pages/add.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/pages/mywatchlist.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/pages/data.dart';

class Detail extends StatefulWidget {
  final List<String> budget;
  final List<int> nominalList;
  final List<String> judulList;
  final String title;
  final String date;
  final String rating;
  final String status;
  final String review;

  const Detail({
    super.key,
    required this.judulList,
    required this.nominalList,
    required this.budget,
    required this.title,
    required this.date,
    required this.rating,
    required this.status,
    required this.review,
  });

  @override
  State<Detail> createState() => MyFormPageState();
}

class MyFormPageState extends State<Detail> {
  String judul = "";
  late List<String> judulList = List<String>.from(widget.judulList);
  int nominal = 0;
  late List<int> nominalList = List<int>.from(widget.nominalList);
  late List<String> budget = List<String>.from(widget.budget);
  String? tipe;
  List<String> tipeBudget = ['pemasukan', 'pengeluaran'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form'),
      ),
      // Menambahkan drawer menu
      drawer: Drawer(
        child: Column(
          children: [
            // Menambahkan clickable menu
            ListTile(
              title: const Text('Counter'),
              onTap: () {
                // Route menu ke halaman utama
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyHomePage(
                          title: 'Program Counter',
                          judulList: widget.judulList,
                          nominalList: widget.nominalList,
                          budget: widget.budget)),
                );
              },
            ),
            ListTile(
              title: const Text('Tambah Budget'),
              onTap: () {
                // Route menu ke halaman form
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AddBudget(
                          judulList: widget.judulList,
                          nominalList: widget.nominalList,
                          budget: widget.budget)),
                );
              },
            ),
            ListTile(
              title: const Text('Data Budget'),
              onTap: () {
                // Route menu ke halaman form
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DataBudget(
                          judulList: judulList,
                          nominalList: nominalList,
                          budget: budget)),
                );
              },
            ),
            ListTile(
              title: const Text('My Watch List'),
              onTap: () {
                // Route menu ke halaman form
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyWatchlist(
                          judulList: judulList,
                          nominalList: nominalList,
                          budget: budget)),
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Text(widget.title,
                style: const TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                )),
          ),
          Text("Release Date: ${widget.date}",
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 20.0,
              )),
          Text("Rating: ${widget.rating}",
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 20.0,
              )),
          if (widget.status == "true")
            (const Text("Status: Watched",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20.0,
                )))
          else
            (const Text("Status: Plan to Watch / Watching",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20.0,
                ))),
          Text("Review: ${widget.review}",
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 20.0,
              )),
          ListTile(
            title: const Text("Back"),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyWatchlist(
                          judulList: widget.judulList,
                          nominalList: widget.nominalList,
                          budget: widget.budget)));
            },
          )
        ],
      ),
    );
  }
}
