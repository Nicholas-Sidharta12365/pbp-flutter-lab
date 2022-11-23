import 'package:counter_7/main.dart';
import 'package:counter_7/pages/add.dart';
import 'package:counter_7/pages/mywatchlist.dart';
import 'package:flutter/material.dart';

class DataBudget extends StatefulWidget {
  final List<String> budget;
  final List<int> nominalList;
  final List<String> judulList;

  const DataBudget(
      {super.key,
      required this.judulList,
      required this.nominalList,
      required this.budget});
  @override
  State<DataBudget> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<DataBudget> {
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
                          judulList: widget.judulList,
                          nominalList: widget.nominalList,
                          budget: widget.budget)),
                );
              },
            ),
            ListTile(
                title: const Text('My Watch List'),
                onTap: () {
                  // Route menu ke halaman form
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MyWatchlist(judulList: widget.judulList, nominalList: widget.nominalList, budget: widget.budget)),
                  );
                },
              ),
          ],
        ),
      ),
      body: Center(
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              for (var i = 0; i < widget.judulList.length; i++)
                ListTile(
                  title: Text(widget.judulList[i]),
                  subtitle: Text(widget.nominalList[i].toString()),
                  trailing: Text(widget.budget[i]),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
