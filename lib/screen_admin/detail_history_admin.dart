// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:project4/controllers/history_admin_controller.dart';
// import 'package:project4/models/account.dart';
// import 'package:project4/models/history.dart';
// import '../controllers/account_admin_controller.dart';
//
// class DetailHistoryAdmin extends StatelessWidget {
//   final int id_history;
//   final int id_user;
//
//   const DetailHistoryAdmin({super.key, required this.id_history, required this.id_user, });
//
//   @override
//   Widget build(BuildContext context) {
//     Account acc = AccountController.getAccountId(id_user);
//     History history = HistoryAdminController.GetHistoryById(id_history);
//     return Scaffold(
//       appBar: AppBar(
//           backgroundColor: Colors.white,
//           title: Title(color: Colors.blue,
//               child: Container(
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Container(
//                           padding: EdgeInsets.all(10),
//                           child: Text('History Manager'),
//                         ),
//                         Container(child: ClipRRect(borderRadius: BorderRadius.circular(50),child: CachedNetworkImage(imageUrl: 'assets/${acc.Avata}',height: 50,width: 50,fit: BoxFit.cover,)),)
//                       ],),
//
//                   ],
//                 ),
//               )
//           )
//       ),
//       body: Container(
//         color: Colors.white,
//         padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               width: MediaQuery.of(context).size.width ,
//               child: Text(
//                 'Id: ${history.Id}',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),
//                 softWrap: true,
//               ),
//             ),
//             SizedBox(height: 5,),
//             Container(
//               width: MediaQuery.of(context).size.width ,
//               child: Text(
//                 'WordId: ${history.LessonId}',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),
//                 softWrap: true,
//               ),
//             ),
//             SizedBox(height: 5,),
//             Container(
//               width: MediaQuery.of(context).size.width * 0.6,
//               child: Text(
//                 'Quantity Correct: ${history.QuantityCorrect}',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),
//                 softWrap: true,
//
//               ),
//             ),
//
//             SizedBox(height: 5,),
//             Container(
//               width: MediaQuery.of(context).size.width * 0.6,
//               child: Text(
//                 'Created By: ${history.CreatedBy}',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),
//                 softWrap: true,
//
//               ),
//             ),
//             SizedBox(height: 5,),
//             Container(
//               width: MediaQuery.of(context).size.width * 0.6,
//               child: Text(
//                 'Updated By: ${history.UpdatedBy}',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),
//                 softWrap: true,
//               ),
//             ),
//             SizedBox(height: 5,),
//             Container(
//               width: MediaQuery.of(context).size.width * 0.6,
//               child: Text(
//                 'Deleted By: ${history.DeletedBy}',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),
//                 softWrap: true,
//               ),
//             ),
//             SizedBox(height: 5,),
//             Container(
//               width: MediaQuery.of(context).size.width * 0.6,
//               child: Text(
//                 'Created Time: ${history.CreatedTime}',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),
//                 softWrap: true,
//
//               ),
//             ),
//             SizedBox(height: 5,),
//             Container(
//               width: MediaQuery.of(context).size.width * 0.6,
//               child: Text(
//                 'Updated Time: ${history.UpdatedTime}',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),
//                 softWrap: true,
//
//               ),
//             ),
//             SizedBox(height: 5,),
//             Container(
//               width: MediaQuery.of(context).size.width * 0.6,
//               child: Text(
//                 'Deleted Time: ${history.DeletedTime}',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),
//                 softWrap: true,
//
//               ),
//             ),
//             SizedBox(height: 5,),
//             Container(
//               width: MediaQuery.of(context).size.width * 0.6,
//               child: Text(
//                 'Is Deleted: ${history.IsDeleted}',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),
//                 softWrap: true,
//
//               ),
//             ),
//             SizedBox(height: 10,),
//             Container(
//               alignment: Alignment.center,
//
//               child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.white,
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10)
//                       )
//                   )
//                   ,onPressed: (){
//                 Navigator.pop(context);
//               }, child: Text('Back',style: TextStyle(
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold
//               ),)),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
