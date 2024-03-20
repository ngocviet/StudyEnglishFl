import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project4/screen/list_vocabulary_screen.dart';

import 'learn_word_screen.dart';


class huong extends StatelessWidget {
  const huong({super.key});

  @override
  Widget build(BuildContext context) {
    return LearnWordScreen();
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late Future<List<String>> dogBreeds;

  @override
  void initState() {
    super.initState();
    dogBreeds = listDogs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: FutureBuilder<List<String>>(
            future: dogBreeds,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }else{
                List<String> breeds = snapshot.data!;
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 4.0,
                  ),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return
                      Text(snapshot.data![index],);
                  },
                );
              }
            },
          ),
        )
    );
  }
}

Future<List<String>> listDogs() async {
  final response = await http.get(Uri.parse('https://localhost:7183/api/Accounts'));
  if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body);
    List<String> urls = [];
    for (var item in data) {
      urls.add(item['userName']);
    }
    return urls;
  } else {
    throw Exception('Failed to fetch dog breeds');
  }
}

class tesHuong extends StatelessWidget {
  const tesHuong({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}


