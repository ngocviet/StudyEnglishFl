import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:project4/controllers/answer_admin_controller.dart';
import 'package:project4/models/account.dart';
import 'package:project4/models/answer.dart';

import '../controllers/account_admin_controller.dart';

class DetailAnswerAdmin extends StatelessWidget {
  final int id_answer;
  final int id_user;

  const DetailAnswerAdmin({super.key, required this.id_answer, required this.id_user, });

  @override
  Widget build(BuildContext context) {
    Account acc = AccountController.getAccountId(id_user);
    Answer ans = AnswerAdminController.getDetailById(id_answer);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Title(color: Colors.blue,
              child: Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text('Answer Manager'),
                        ),
                        Container(child: ClipRRect(borderRadius: BorderRadius.circular(50),child: CachedNetworkImage(imageUrl: 'assets/${acc.Avata}',height: 50,width: 50,fit: BoxFit.cover,)),)
                      ],),

                  ],
                ),
              )
          )
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                    Container(
                      width: MediaQuery.of(context).size.width ,
                      child: Text(
                        'ID: ${ans.Id}',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),
                        softWrap: true,
                      ),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Text(
                        'QuesionId: ${ans.QuestionId}',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),
                        softWrap: true,
                      ),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Text(
                        'Name: ${ans.Name}',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),
                        softWrap: true,

                      ),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Text(
                        'Is True: ${ans.IsTrue}',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),
                        softWrap: true,

                      ),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Text(
                        'Created By: ${ans.CreatedBy}',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),
                        softWrap: true,

                      ),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Text(
                        'Updated By: ${ans.UpdatedBy}',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),
                        softWrap: true,
                      ),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Text(
                        'Deleted By: ${ans.DeletedBy}',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),
                        softWrap: true,
                      ),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Text(
                        'Created Time: ${ans.CreatedTime}',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),
                        softWrap: true,

                      ),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Text(
                        'Updated Time: ${ans.UpdatedTime}',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),
                        softWrap: true,

                      ),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Text(
                        'Deleted Time: ${ans.DeletedTime}',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),
                        softWrap: true,

                      ),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Text(
                        'Is Deleted: ${ans.IsDeleted}',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),
                        softWrap: true,

                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      alignment: Alignment.center,

                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              )
                          )
                          ,onPressed: (){
                        Navigator.pop(context);
                      }, child: Text('Back',style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                      ),)),
                    )

          ],
        ),
      ),
    );
  }
}
