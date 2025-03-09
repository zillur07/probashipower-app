// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:probashipower_app/src/config/constants.dart';
// import 'package:url_launcher/url_launcher.dart';

// class LinkCard extends StatelessWidget {
//   const LinkCard(
//       {super.key, required this.link, required this.icon, required this.title});

//   final String link;
//   final String title;
//   final IconData icon;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(
//         bottom: Constants.kDefaultPadding * 1.2,
//       ),
//       child: Material(
//         borderRadius: BorderRadius.circular(
//           Constants.kDefaultPadding,
//         ),
//         color: Colors.white,
//         clipBehavior: Clip.antiAlias,
//         child: InkWell(
//           onTap: () {
//             _launchUrl(link);
//           },
//           child: Container(
//             width: double.infinity,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(
//                 Constants.kDefaultPadding,
//               ),
//             ),
//             padding: const EdgeInsets.all(
//               Constants.kDefaultPadding * 1.5,
//             ),
//             child: Row(
//               children: [
//                 Icon(
//                   icon,
//                   size: Constants.kDefaultPadding * 2,
//                 ),
//                 const SizedBox(
//                   width: Constants.kDefaultPadding,
//                 ),
//                 Text(
//                   title,
//                   style: const TextStyle(
//                     color: Constants.darkTextColor,
//                     fontSize: Constants.kDefaultPadding + 2,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Future<void> _launchUrl(String url) async {
//     if (!await launchUrl(Uri.parse(url))) {
//       if (kDebugMode) {
//         print("Couldn't Launch URL: $url");
//       }
//     }
//   }
// }
