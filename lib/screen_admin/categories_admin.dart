// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:project4/controllers/categories_admin_controller.dart';
// import 'package:project4/models/categories.dart';
// import 'package:project4/screen_admin/detail_categories_admin.dart';
//
// import '../controllers/account_admin_controller.dart';
// import '../models/account.dart';
//
//
// class CategoriesAdmin extends StatelessWidget {
//
//   const CategoriesAdmin({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     Categories ctg = CategoriesAdminController.GetCategories();
//     Account acc = AccountController.getAccountId(1);
//     return Scaffold(
//       appBar: AppBar(
//           backgroundColor: Colors.white,
//           title: Title(color: Colors.blue,
//               child: Container(
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//
//                       children: [
//                         Container(
//                           padding: EdgeInsets.all(10),
//                           child: Text('Category Manager'),
//                         ),
//                         Container(child: ClipRRect(borderRadius: BorderRadius.circular(50),child: CachedNetworkImage(imageUrl: 'assets/${acc.Avata}',height: 50,width: 50,fit: BoxFit.cover,)),)
//                       ],),
//
//                   ],
//                 ),
//               )
//           )
//       ),
//
//       body: Container(
//         color: Colors.white,
//         padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               width: MediaQuery.of(context).size.width * 0.6,
//               child: Text(
//                 'Id: ${ctg.Id}',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                 softWrap: true,
//
//               ),
//             ),
//             SizedBox(height: 5,),
//             Container(
//               width: MediaQuery.of(context).size.width * 0.6,
//               child: Text(
//                 'Name: ${ctg.Name}',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                 softWrap: true,
//
//               ),
//             ),
//             SizedBox(height: 5,),
//
//             Container(
//               width: MediaQuery.of(context).size.width * 0.6,
//               child: Text(
//                 'Create Time: ${ctg.CreateTime}',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                 softWrap: true,
//
//               ),
//             ),
//             SizedBox(height: 10,),
//             Container(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.yellow,
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10)
//                           )
//                       )
//                       ,onPressed: (){
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => DetailCategoriesAdmin(id_ctg: 1, id_user: 1)
//                         )
//                     );
//                   }, child: Text('Detail',style: TextStyle(
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold
//                   ),)),
//
//                   ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.green,
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10)
//                           )
//                       )
//                       ,onPressed: (){}, child: Text('Add',style: TextStyle(
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold
//                   ),)),
//
//                   ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.orange,
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10)
//                           )
//                       )
//                       ,onPressed: (){}, child: Text('Edit',style: TextStyle(
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold
//                   ),)),
//
//                   ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.red,
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10)
//                           )
//                       ),
//                       onPressed: (){}, child: Text('Delete',style: TextStyle(
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold
//                   ),)
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
