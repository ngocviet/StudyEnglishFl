import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project4/models/account.dart';
import 'package:project4/models/topic.dart';

import '../controllers/account_admin_controller.dart';
import '../controllers/choose_topic_controller.dart';

class DetailTopicAdmin extends StatefulWidget {
  final int id_user;
  final int id_topic;

  const DetailTopicAdmin({Key? key, required this.id_user, required this.id_topic}) : super(key: key);

  @override
  State<DetailTopicAdmin> createState() => _DetailTopicAdmin();
}

class _DetailTopicAdmin extends State<DetailTopicAdmin> {
  List<dynamic> accounts = [];
  List<dynamic> topics = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    try {
      final data = await AccountController.getAccountId(widget.id_user);

      final data1 = await ChooseTopicController.getTopicById(widget.id_topic);

      setState(() {
        accounts = data ;
        topics = data1;
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
                          child: Text('Topic Manager',
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
        itemCount: topics.length,
        itemBuilder: (context, index) {
          var topic = topics[index];
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
                          child: ClipRRect(borderRadius: BorderRadius.circular(50),child: CachedNetworkImage(imageUrl: 'assets/${topic['avatar']}',height: 80,width: 80,fit: BoxFit.cover,))),

                    ),
                    SizedBox(width: 20,),
                    Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Text(
                            'ID: ${topic['id']}',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),
                            softWrap: true,
                          ),
                        ),
                        SizedBox(height: 5,),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Text(
                            'Name: ${topic['name']}',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),
                            softWrap: true,
                          ),
                        ),
                        SizedBox(height: 5,),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Text(
                            'code: ${topic['code']}',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),
                            softWrap: true,

                          ),
                        ),
                        SizedBox(height: 5,),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Text(
                            'comboColor: ${topic['comboColor']}',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),
                            softWrap: true,

                          ),
                        ),
                        SizedBox(height: 5,),

                        Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Text(
                            'CreateTime: ${topic['createTime'].toString().substring(0, 10)}',
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

