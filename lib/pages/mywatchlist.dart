import 'package:counter_7/pages/add.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/pages/details.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/pages/data.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:counter_7/model/watchlist.dart';

class MyWatchlist extends StatefulWidget {

  final List<String> budget;
  final List<int> nominalList;
  final List<String> judulList;

  const MyWatchlist(
    {super.key,
      required this.judulList,
      required this.nominalList,
      required this.budget
      });

  @override
  State<MyWatchlist> createState() => MyFormPageState();
}

class MyFormPageState extends State<MyWatchlist> {
  String judul = "";
  late List<String> judulList = List<String>.from(widget.judulList);
  int nominal = 0;
  late List<int> nominalList = List<int>.from(widget.nominalList);
  late List<String> budget = List<String>.from(widget.budget);
  String? tipe;
  List<String> tipeBudget = ['pemasukan', 'pengeluaran'];

  @override
  Widget build(BuildContext context) {

    Future<List<Watchlist>> fetchWatchlist() async {
        final String response = await rootBundle.loadString('assets/movie.json');
        final data = await json.decode(response);

        // melakukan konversi data json menjadi object ToDo
        List<Watchlist> movieList = [];
        for (var d in data) {
          if (d != null) {
              movieList.add(Watchlist.fromJson(d));
          }
        }

        return movieList;
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('My Watch List'),
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
                        builder: (context) =>
                            MyHomePage(title: 'Program Counter', judulList: widget.judulList, nominalList: widget.nominalList, budget: widget.budget)),
                  );
                },
              ),
              ListTile(
                title: const Text('Tambah Budget'),
                onTap: () {
                  // Route menu ke halaman form
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => AddBudget(judulList: widget.judulList, nominalList: widget.nominalList, budget: widget.budget)),
                  );
                },
              ),
              ListTile(
                title: const Text('Data Budget'),
                onTap: () {
                  // Route menu ke halaman form
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => DataBudget(judulList: judulList, nominalList: nominalList, budget: budget)),
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
        body: FutureBuilder(
        future: fetchWatchlist(),
        builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
            } else {
            if (!snapshot.hasData) {
                return Column(
                children: const [
                    Text(
                    "Tidak ada to do list :(",
                    style: TextStyle(
                        color: Color(0xff59A5D8),
                        fontSize: 20),
                    ),
                    SizedBox(height: 8),
                ],
                );
            } else {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index)=> Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: const [
                        BoxShadow(
                            color: Colors.black,
                            blurRadius: 2.0
                        )
                        ]
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        ListTile(
                            title: Text(
                              "${snapshot.data![index].title}",
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onTap: () {
                              // Route menu ke halaman form
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => Detail(
                                  judulList: widget.judulList, 
                                  nominalList: widget.nominalList, 
                                  budget: widget.budget, 
                                  title: "${snapshot.data![index].title}", 
                                  date: "${snapshot.data![index].releaseDate}", 
                                  rating: "${snapshot.data![index].movieRating}", 
                                  status: "${snapshot.data![index].watched}", 
                                  review: "${snapshot.data![index].review}")),
                              );
                            },
                        ),
                        const SizedBox(height: 10),
                        ],
                    ),
                    )
                );
            }
            }
        }
    )
    );
  }
}
