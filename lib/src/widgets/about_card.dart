// import 'package:flutter/material.dart';
// import 'package:probashipower_app/src/config/constants.dart';

// class AboutCard extends StatelessWidget {
//   const AboutCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.symmetric(
//         vertical: Constants.kDefaultPadding * 1.8,
//         horizontal: Constants.kDefaultPadding * 1.5,
//       ),
//       decoration: BoxDecoration(
//         color: Constants.white,
//         borderRadius: BorderRadius.circular(
//           Constants.kDefaultPadding,
//         ),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             "About Me",
//             style: TextStyle(
//               fontSize: Constants.kDefaultPadding * 1.4,
//               color: Constants.darkTextColor,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//           const SizedBox(
//             height: Constants.kDefaultPadding * 0.5,
//           ),
//           Text(
//             Constants.data['about']!,
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
