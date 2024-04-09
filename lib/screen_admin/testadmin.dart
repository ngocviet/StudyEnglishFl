import 'package:flutter/material.dart';

import '../controllers/account_admin_controller.dart';
import '../controllers/question_answers_admin_controller.dart';


class TestAdmin extends StatefulWidget {
  final String code;

  const TestAdmin({super.key, required this.code});
  @override
  _TestAdminState createState() => _TestAdminState();
}

class _TestAdminState extends State<TestAdmin> {
  Map<String, bool> showAnswers = {};
  List<dynamic> accounts = [];
  List<dynamic> questions = [];

  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    try {
      final data = await AccountController.getAccountId(widget.code); // Corrected typo
      final data1 = await QuestionAnswersAdminController.getQuestion();

      setState(() {
        accounts = data;
        questions = data1;
      });
    } catch (e) {
      print('Error: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Admin'),
      ),
      body: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) {
          final question = questions[index];
          final bool isShowingAnswers = showAnswers[question['questionCode']] ?? false;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Text(question['questionName']),
                onTap: () {
                  setState(() {
                    showAnswers[question['questionCode']] = !isShowingAnswers;
                  });
                },
              ),
              if (isShowingAnswers) ...[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: question['answers'].map<Widget>((answer) {
                    return Container(
                      color: answer['isTrue'] ? Colors.blue : null,
                      child: ListTile(
                        title: Text(answer['answerName']),
                      ),
                    );
                  }).toList(),
                ),
              ],
              Divider(),
            ],
          );
        },
      ),
    );
  }
}
