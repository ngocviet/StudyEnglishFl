import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:project4/controllers/categories_admin_controller.dart';
import 'package:project4/models/account.dart';
import 'package:project4/models/categories.dart';

import '../controllers/account_admin_controller.dart';

class DetailCategoriesAdmin extends StatelessWidget {
  final int id_ctg;
  final int id_user;

  const DetailCategoriesAdmin({super.key, required this.id_ctg, required this.id_user, });

  @override
  Widget build(BuildContext context) {
    Account acc = AccountController.getAccountId(id_user);
    Categories ctg = CategoriesAdminController.GetCategoriesById(id_ctg);
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
                          child: Text('Category Manager'),
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
                'ID: ${ctg.Id}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),
                softWrap: true,
              ),
            ),
            SizedBox(height: 5,),
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Text(
                'Name: ${ctg.Name}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),
                softWrap: true,

              ),
            ),

            SizedBox(height: 5,),
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Text(
                'Created By: ${ctg.CreateBy}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),
                softWrap: true,

              ),
            ),
            SizedBox(height: 5,),
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Text(
                'Updated By: ${ctg.UpdateBy}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),
                softWrap: true,
              ),
            ),
            SizedBox(height: 5,),
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Text(
                'Deleted By: ${ctg.DeleteBy}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),
                softWrap: true,
              ),
            ),
            SizedBox(height: 5,),
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Text(
                'Created Time: ${ctg.CreateTime}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),
                softWrap: true,

              ),
            ),
            SizedBox(height: 5,),
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Text(
                'Updated Time: ${ctg.UpdateTime}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),
                softWrap: true,

              ),
            ),
            SizedBox(height: 5,),
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Text(
                'Deleted Time: ${ctg.DeleteTime}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),
                softWrap: true,

              ),
            ),
            SizedBox(height: 5,),
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Text(
                'Is Deleted: ${ctg.IsDeleted}',
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
