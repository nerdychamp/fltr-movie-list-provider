import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/movie_provider.dart';

class MyListScreen extends StatefulWidget {
  const MyListScreen({super.key});

  @override
  State<MyListScreen> createState() => _MyListScreenState();
}

class _MyListScreenState extends State<MyListScreen> {
  @override
  Widget build(BuildContext ctx) {
    final myList = ctx.watch<MovieProvider>().myList;
    return Scaffold(
      appBar: AppBar(
        title: Text("My List (${myList.length})"),
      ),
      body: ListView.builder(
        itemCount: myList.length,
        itemBuilder: (_, index) {
          final currentMovie = myList[index];

          return Card(
            key: ValueKey(currentMovie),
            elevation: 4,
            child: ListTile(
              title: Text(currentMovie.title),
              subtitle: Text(currentMovie.duration ?? ''),
              trailing: TextButton(
                child: const Text(
                  "Remove",
                  style: TextStyle(color: Colors.red),
                ),
                onPressed: () {
                  ctx.read<MovieProvider>().removeFromList(currentMovie);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
