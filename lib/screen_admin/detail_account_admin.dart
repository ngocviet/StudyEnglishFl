import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project4/models/account.dart';

import '../controllers/account_admin_controller.dart';

class DetailAccountAdmin extends StatefulWidget {
  final int id_user;

  const DetailAccountAdmin({Key? key, required this.id_user}) : super(key: key);

  @override
  State<DetailAccountAdmin> createState() => _DetailAccountAdminState();
}

class _DetailAccountAdminState extends State<DetailAccountAdmin> {
  List<dynamic> accounts = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    try {
      final data = await AccountController.getAccountId(widget.id_user);

      setState(() {
        accounts = data ;
      });
    } catch (e) {
      print('Error: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100]!.withOpacity(0.3),
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
                          child: Text('Account Manager',
                          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        ),
                        Container(child:ClipRRect(borderRadius: BorderRadius.circular(50),child: CachedNetworkImage(imageUrl: 'assets/abc1.jpg',height: 50,width: 50,fit: BoxFit.cover,)),)
                      ],),

                  ],
                ),
              )
          )
      ),

      body: ListView.builder(
        itemCount: accounts.length,
        itemBuilder: (context, index) {

          var account = accounts[index];
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
                          child: ClipRRect(borderRadius: BorderRadius.circular(50),child: CachedNetworkImage(imageUrl: 'assets/${account['avatar']}',height: 80,width: 80,fit: BoxFit.cover,))),

                    ),
                    SizedBox(width: 20,),
                    Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Text(
                            'ID: ${account['id']}',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),
                            softWrap: true,
                          ),
                        ),
                        SizedBox(height: 5,),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Text(
                            'Name: ${account['name']}',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),
                            softWrap: true,
                          ),
                        ),
                        SizedBox(height: 5,),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Text(
                            'UserName: ${account['userName']}',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),
                            softWrap: true,

                          ),
                        ),
                        SizedBox(height: 5,),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Text(
                            'Password: ${account['password']}',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),
                            softWrap: true,

                          ),
                        ),
                        SizedBox(height: 5,),

                        Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Text(
                            'CreateTime: ${account['createdTime'].toString().substring(0, 10)}',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            softWrap: true,

                          ),
                        ),
                        SizedBox(height: 5,),

                      ],
                    ),

                  ],
                ),
                Divider(thickness: 10,color: Colors.grey,),
                SizedBox(height: 20,),
                Center(
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

          );
        },
      ),
    );
  }
}

