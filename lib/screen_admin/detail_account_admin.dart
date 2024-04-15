// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
//
// import '../controllers/account_admin_controller.dart';
//
// class DetailAccountAdmin extends StatefulWidget {
//   final String code;
//   const DetailAccountAdmin({Key? key, required this.code}) : super(key: key);
//
//   @override
//   State<DetailAccountAdmin> createState() => _DetailAccountAdminState();
// }
//
// class _DetailAccountAdminState extends State<DetailAccountAdmin> {
//   List<dynamic> account = [];
//
//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }
//
//   void fetchData() async {
//     try {
//       final acc = await AccountController.getAccountId(widget.code);
//       setState(() {
//         account = acc;
//       });
//     } catch (e) {
//       print('Error: $e');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.lightBlue[100]!.withOpacity(0.3),
//         appBar: AppBar(
//             backgroundColor: Colors.white,
//             title: Title(
//                 color: Colors.blue,
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Container(
//                           padding: const EdgeInsets.all(10),
//                           child: const Text(
//                             'Account Manager',
//                             style: TextStyle(
//                                 fontSize: 20, fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                         Container(
//                           width: 50,
//                           height: 50,
//                           decoration: const BoxDecoration(
//                               image: DecorationImage(
//                                   image: AssetImage("abc1.jpg"))),
//                         )
//                       ],
//                     ),
//                   ],
//                 ))),
//         body: ListView.builder(
//           itemCount: account.length,
//           itemBuilder: (context, index) {
//             var acc = account[index];
//             return Container(
//               color: Colors.white,
//               padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                         width: 80,
//                         height: 80,
//                         decoration: BoxDecoration(
//                             image: DecorationImage(image: AssetImage(acc['avatar']))),
//                       ),
//                       const SizedBox(
//                         width: 20,
//                       ),
//                       Column(
//                         children: [
//                           Container(
//                             width: MediaQuery.of(context).size.width * 0.6,
//                             child: Text(
//                               'ID: ${acc['id']}',
//                               style: const TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.black),
//                               softWrap: true,
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 5,
//                           ),
//                           Container(
//                             width: MediaQuery.of(context).size.width * 0.6,
//                             child: Text(
//                               'Name: ${acc['name']}',
//                               style: const TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.black),
//                               softWrap: true,
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 5,
//                           ),
//                           Container(
//                             width: MediaQuery.of(context).size.width * 0.6,
//                             child: Text(
//                               'UserName: ${acc['userName']}',
//                               style: const TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.black),
//                               softWrap: true,
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 5,
//                           ),
//                           Container(
//                             width: MediaQuery.of(context).size.width * 0.6,
//                             child: Text(
//                               'CreateTime: ${acc['createdTime'].toString().substring(0, 10)}',
//                               style: const TextStyle(
//                                   fontSize: 16, fontWeight: FontWeight.bold),
//                               softWrap: true,
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 5,
//                           ),
//                           Container(
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 const SizedBox(width: 20),
//                                 ElevatedButton(
//                                     style: ElevatedButton.styleFrom(
//                                         backgroundColor: Colors.red,
//                                         shape: RoundedRectangleBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(10))),
//                                     onPressed: () {},
//                                     child: const Text(
//                                       'Delete',
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontWeight: FontWeight.bold),
//                                     )),
//                               ],
//                             ),
//                           )
//                         ],
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             );
//           },
//         ));
//   }
// }
