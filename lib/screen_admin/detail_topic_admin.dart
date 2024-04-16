import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project4/controllers/topic_admin.dart';
import 'package:project4/models/account.dart';
import 'package:project4/models/topic.dart';

import '../controllers/account_admin_controller.dart';
import '../controllers/choose_topic_controller.dart';

class DetailTopicAdmin extends StatefulWidget {
  final String code;
  final String code_topic;

  const DetailTopicAdmin({Key? key, required this.code, required this.code_topic}) : super(key: key);

  @override
  State<DetailTopicAdmin> createState() => _DetailTopicAdmin();
}

class _DetailTopicAdmin extends State<DetailTopicAdmin> {
  List<dynamic> accounts = [];
  List<dynamic> topics = [];
  final TextEditingController _codeController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _avatarController = TextEditingController();
  final TextEditingController _comboColorController = TextEditingController();
  DateTime _createdTime = DateTime.now();
  DateTime _updatedTimeController = DateTime.now();



  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    try {
      final data = await AccountController.getAccountId(widget.code);
      final data1 = await TopicAdmin1.getTopicById(widget.code_topic);

      setState(() {
        accounts = data ;
        topics = data1;
      });
    } catch (e) {
      print('Error: 1 $e');
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
                        Container(child:ClipRRect(borderRadius: BorderRadius.circular(50),child: CachedNetworkImage(imageUrl: 'assets/assets/${accounts[0]['avatar']}',height: 50,width: 50,fit: BoxFit.cover,)),)
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
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Căn lề của hàng theo chiều ngang
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10)
                                    )
                                ),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text("Thêm dữ liệu"),
                                        content: SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              // Thêm các trường dữ liệu vào form
                                              TextFormField(
                                                controller: _codeController,
                                                decoration: InputDecoration(labelText: 'Code'),
                                              ),
                                              TextFormField(
                                                controller: _nameController,
                                                decoration: InputDecoration(labelText: 'Name'),
                                              ),
                                              TextFormField(
                                                controller: _avatarController,
                                                decoration: InputDecoration(labelText: 'Avatar'),
                                              ),
                                              TextFormField(
                                                controller: _comboColorController,
                                                decoration: InputDecoration(labelText: 'ComboColor'),
                                              ),
                                            ],
                                          ),
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text('Hủy'),
                                          ),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.green,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(10)
                                                )
                                            ),
                                            onPressed: () async  {
                                              final String code = _codeController.text;
                                              final String name = _nameController.text;
                                              final String avatar = _avatarController.text;
                                              final String comboColor = _comboColorController.text;
                                              final String createdBy = 'Thuong';
                                              final DateTime createdTime = _createdTime;

                                              await TopicAdmin1.AddTopicAPI(code, name, avatar);
                                              Navigator.of(context).pop();
                                            },
                                            child: Text('Thêm', style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold
                                            )),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Text('Add', style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold
                                )),
                              ),

                              SizedBox(width: 20),

                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.orange,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10)
                                      )
                                  ),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text("Chỉnh sửa dữ liệu"),
                                          content: SingleChildScrollView(
                                            child: Column(
                                              children: [
                                                TextFormField(
                                                  controller: _codeController,
                                                  decoration: InputDecoration(labelText: 'Code'),
                                                ),
                                                TextFormField(
                                                  controller: _nameController,
                                                  decoration: InputDecoration(labelText: 'Name'),
                                                ),
                                                TextFormField(
                                                  controller: _avatarController,
                                                  decoration: InputDecoration(labelText: 'Avatar'),
                                                ),
                                                TextFormField(
                                                  controller: _comboColorController,
                                                  decoration: InputDecoration(labelText: 'ComboColor'),
                                                ),

                                              ],
                                            ),
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text('Hủy'),
                                            ),
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.blue,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(10)
                                                  )
                                              ),
                                              onPressed: () async {
                                                final String code = _codeController.text;
                                                final String name = _nameController.text;
                                                final String avatar = _avatarController.text;
                                                final String comboColor = _comboColorController.text;
                                                final String updatedBy = 'thuong';
                                                final DateTime updatedTime = _updatedTimeController;

                                                await TopicAdmin1.UpdateTopicAPI(code, name, avatar, comboColor, updatedBy, updatedTime);
                                                Navigator.of(context).pop();
                                              },
                                              child: Text('Lưu', style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold
                                              )),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: Text('Edit',style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold
                                  ),)
                              ),

                              SizedBox(width: 20),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10)
                                      )
                                  ),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text("Xác nhận xóa"),
                                          content: Text("Bạn có chắc chắn muốn xóa không?"),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop(); // Đóng hộp thoại
                                              },
                                              child: Text('Hủy'),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                final String code = topic['code'];
                                                TopicAdmin1.deleteTopicById(code);

                                                Navigator.of(context).pop();
                                              },
                                              child: Text('Xóa', style: TextStyle(color: Colors.red)),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: Text('Delete',style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                              ),
                              )
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),

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



