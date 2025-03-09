// import 'package:flutter/material.dart';
// import 'package:probashipower_app/src/config/constants.dart';

// class ProfileCard extends StatelessWidget {
//   const ProfileCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       decoration: BoxDecoration(
//         color: Constants.headerColor,
//         borderRadius: BorderRadius.circular(
//           Constants.kDefaultPadding,
//         ),
//       ),
//       padding: const EdgeInsets.symmetric(
//         vertical: Constants.kDefaultPadding * 2,
//         horizontal: Constants.kDefaultPadding,
//       ),
//       child: Column(
//         children: [
//           Container(
//             width: Constants.kDefaultPadding * 5,
//             height: Constants.kDefaultPadding * 5,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(
//                 Constants.kDefaultPadding * 2.5,
//               ),
//               image: DecorationImage(
//                 image: AssetImage(
//                   Constants.data["image"]!,
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: Constants.kDefaultPadding,
//           ),
//           Text(
//             Constants.data['name']!,
//             style: const TextStyle(
//               fontSize: Constants.kDefaultPadding * 1.5,
//               color: Constants.accentColor,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//           const SizedBox(
//             height: Constants.kDefaultPadding * 0.5,
//           ),
//           Text(
//             Constants.data['email']!,
//             style: const TextStyle(
//               fontSize: Constants.kDefaultPadding * 1.1,
//               color: Constants.lightTextColor,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
