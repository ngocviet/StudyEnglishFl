import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:project4/controllers/topic_admin.dart';

import '../controllers/account_admin_controller.dart';
import '../controllers/choose_topic_controller.dart';
import 'detail_topic_admin.dart';

class TopicAdmin extends StatefulWidget {
  final String code;
  const TopicAdmin({super.key, required this.code});

  @override
  State<TopicAdmin> createState() => _TopicAdminState();
}

class _TopicAdminState extends State<TopicAdmin> {
  List<dynamic> accounts = [];
  List<dynamic> topics = [];

  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    try {
      final data = await AccountController.getAccountId(widget.code);

      final data1 = await TopicAdmin1.getTopic();

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
      appBar:AppBar(
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
                          child: Text('Topic Manager',style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),),
                        ),
                        Container(child: ClipRRect(borderRadius: BorderRadius.circular(50),child: CachedNetworkImage(imageUrl: 'assets/abc1.jpg',height: 50,width: 50,fit: BoxFit.cover,)),)
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
            padding: EdgeInsets.all(10),
            child: OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailTopicAdmin(code: accounts[0]['code'], code_topic: topic['code'])
                  ),
                );
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.white), // Màu của đường viền
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(thickness: 3,color: Colors.grey,),
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
                            child: CachedNetworkImage(imageUrl: 'assets/${topic['avatar']}',height: 80,width: 80,fit: BoxFit.cover,)),
                      ),
                      SizedBox(width: 20,),
                      Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Text(
                              'Id: ${topic['id']}',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              softWrap: true,

                            ),
                          ),
                          SizedBox(width: 20,),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Text(
                              'Name: ${topic['name']}',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              softWrap: true,

                            ),
                          ),
                          SizedBox(width: 20,),



                        ],
                      ),

                    ],
                  ),


                ],
              ),
            ),
          );
        },

      ),
    );
  }
}
