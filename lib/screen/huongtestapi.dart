import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project4/models/account.dart';
import 'package:project4/screen/list_vocabulary_screen.dart';

import 'combine_sentences_screen.dart';
import 'learn_word_screen.dart';

class huong extends StatelessWidget {
  const huong({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MyHomePage(title: "huong");
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<Account>> accounts;

  @override
  void initState() {
    super.initState();
    accounts = getAllAccounts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: FutureBuilder<List<Account>>(
          future: accounts,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              List<Account> accountList = snapshot.data!;
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0,
                ),
                itemCount: accountList.length,
                itemBuilder: (context, index) {
                  return Text(accountList[index].Name);
                },
              );
            }
          },
        ),
      ),
    );
  }
}

const String baseUrl = 'https://localhost:7183/api/Accounts';

Future<List<Account>> getAllAccounts() async {
  final response = await http.get(Uri.parse('$baseUrl'));

  if (response.statusCode == 200) {
    List<Account> accounts =
        (json.decode(response.body)['data'] as List<dynamic>? ?? [])
            .map((json) => Account.fromJson(json))
            .toList();

    return accounts;
  } else {
    throw Exception('Failed to load accounts');
  }
}

class TesHuong extends StatelessWidget {
  const TesHuong({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
