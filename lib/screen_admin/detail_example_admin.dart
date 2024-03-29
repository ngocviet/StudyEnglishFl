import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:project4/controllers/categories_admin_controller.dart';
import 'package:project4/controllers/example_admin_controller.dart';
import 'package:project4/models/account.dart';
import 'package:project4/models/categories.dart';
import 'package:project4/models/example.dart';

import '../controllers/account_admin_controller.dart';

class DetailExampleAdmin extends StatelessWidget {
  final int id_example;
  final int id_user;

  const DetailExampleAdmin({super.key, required this.id_example, required this.id_user, });

  @override
  Widget build(BuildContext context) {
    Account acc = AccountController.getAccountId(id_user);
    Example example = ExampleAdminController.GetExampleById(id_example);
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
                          child: Text('Example Manager'),
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
                'ID: ${example.Id}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),
                softWrap: true,
              ),
            ),
            SizedBox(height: 5,),
            Container(
              width: MediaQuery.of(context).size.width ,
              child: Text(
                'WordId: ${example.WordId}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),
                softWrap: true,
              ),
            ),
            SizedBox(height: 5,),
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Text(
                'Name VN: ${example.NameVN}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),
                softWrap: true,

              ),
            ),

            SizedBox(height: 5,),
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Text(
                'Name NameLanguage: ${example.NameLanguage}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),
                softWrap: true,

              ),
            ),

            SizedBox(height: 5,),
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Text(
                'Created By: ${example.CreatedBy}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),
                softWrap: true,

              ),
            ),
            SizedBox(height: 5,),
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Text(
                'Updated By: ${example.UpdatedBy}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),
                softWrap: true,
              ),
            ),
            SizedBox(height: 5,),
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Text(
                'Deleted By: ${example.DeletedBy}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),
                softWrap: true,
              ),
            ),
            SizedBox(height: 5,),
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Text(
                'Created Time: ${example.CreatedTime}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),
                softWrap: true,

              ),
            ),
            SizedBox(height: 5,),
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Text(
                'Updated Time: ${example.UpdatedTime}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),
                softWrap: true,

              ),
            ),
            SizedBox(height: 5,),
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Text(
                'Deleted Time: ${example.DeletedTime}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),
                softWrap: true,

              ),
            ),
            SizedBox(height: 5,),
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Text(
                'Is Deleted: ${example.IsDeleted}',
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
