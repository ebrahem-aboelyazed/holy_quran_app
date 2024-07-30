// import 'package:flutter/material.dart';
// import 'package:quran/quran.dart';
//
// class QuranHeader extends StatelessWidget {
//   const QuranHeader({
//     required this.index,
//     super.key,
//   });
//
//   final int index;
//
//   @override
//   Widget build(BuildContext context) {
//     final screenSize = MediaQuery.of(context).size;
//     final pageData = getPageData(index)[0];
//     final surahName = pageData.suraNameAr;
//     return SizedBox(
//       width: screenSize.width,
//       height: 40,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           SizedBox(
//             width: screenSize.width * .27,
//             child: Row(
//               children: [
//                 IconButton(
//                   onPressed: () => Navigator.pop(context),
//                   icon: const Icon(Icons.arrow_back_ios, size: 24),
//                 ),
//                 Text(
//                   surahName,
//                   style: const TextStyle(fontFamily: 'Taha', fontSize: 14),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             color: Colors.orange.withOpacity(.5),
//             height: 20,
//             width: 120,
//             child: Center(
//               child: Text(
//                 ' الصفحه $index',
//                 style: const TextStyle(
//                   fontFamily: 'aldahabi',
//                   fontSize: 12,
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(
//             width: screenSize.width * .27,
//             child: Container(),
//           ),
//           // SizedBox(
//           //   width: screenSize.width * .27,
//           //   child: Row(
//           //     mainAxisAlignment: MainAxisAlignment.end,
//           //     children: [
//           //       IconButton(
//           //         onPressed: () {},
//           //         icon: const Icon(
//           //           Icons.settings,
//           //           size: 24,
//           //         ),
//           //       ),
//           //     ],
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }
// }
