import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project4/controllers/home_controller.dart';
import 'package:project4/controllers/list_vocabulary_controller.dart';
import 'package:project4/models/account.dart';
import 'package:project4/screen/list_vocabulary_screen.dart';

import 'answer_the_question_screen.dart';
import 'combine_sentences_screen.dart';
import 'learn_word_screen.dart';

class huong extends StatelessWidget {
  const huong({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      // return AnswerTheQuestionScreen();
      return CombineSentencesScreen();
    // return const MyHomePage(title: 'huong',);
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<dynamic> accounts = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async{
    try {
      final data = await ListVocabularyScreenController.getListWord();
      setState(() {
        accounts = data;
      });
    } catch (e) {
      // Handle errors
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: accounts.length,
            itemBuilder: (context, index){
              return ListTile(title: Text(accounts[index]['userName']),);
            }
        ),
      ),
    );
  }
}
