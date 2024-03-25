import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:project4/models/account.dart';

import '../controllers/account_admin_controller.dart';

class DetailAccountAdmin extends StatelessWidget {
  final int id_user;

  const DetailAccountAdmin({super.key, required this.id_user, });

  @override
  Widget build(BuildContext context) {
    Account acc = AccountController.getAccountId(id_user);
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(150),
                    child: CachedNetworkImage(imageUrl: 'assets/${acc.Avata}',height: 80,width: 80,fit: BoxFit.cover,)),

              ),
              SizedBox(width: 20,),
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Text(
                      'ID: ${acc.ID}',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),
                      softWrap: true,
                    ),
                  ),
                  SizedBox(height: 5,),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Text(
                      'Name: ${acc.Name}',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),
                      softWrap: true,
                    ),
                  ),
                  SizedBox(height: 5,),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Text(
                      'UserName: ${acc.UserName}',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),
                      softWrap: true,

                    ),
                  ),
                  SizedBox(height: 5,),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Text(
                      'CreateBy: ${acc.CreateBy}',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),
                      softWrap: true,

                    ),
                  ),
                  SizedBox(height: 5,),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Text(
                      'UpdateBy: ${acc.UpdateBy}',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),
                      softWrap: true,
                    ),
                  ),
                  SizedBox(height: 5,),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Text(
                      'DeleteBy: ${acc.DeleteBy}',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),
                      softWrap: true,
                    ),
                  ),
                  SizedBox(height: 5,),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Text(
                      'CreateTime: ${acc.CreateTime}',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),
                      softWrap: true,

                    ),
                  ),
                  SizedBox(height: 5,),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Text(
                      'UpdateTime: ${acc.UpdateTime}',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),
                      softWrap: true,

                    ),
                  ),
                  SizedBox(height: 5,),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Text(
                      'DeleteTime: ${acc.DeleteTime}',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),
                      softWrap: true,

                    ),
                  ),
                  SizedBox(height: 5,),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Text(
                      'IsDeleted: ${acc.IsDeleted}',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),
                      softWrap: true,

                    ),
                  ),
                  SizedBox(height: 10,),

                  Container(
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

            ],
          )

        ],
      ),
    );
  }
}
