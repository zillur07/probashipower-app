// import 'package:bootstrap_icons/bootstrap_icons.dart';
// import 'package:flutter/material.dart';
// import 'package:probashipower_app/src/config/constants.dart';
// import 'package:probashipower_app/src/widgets/about_card.dart';
// import 'package:probashipower_app/src/widgets/link_card.dart';
// import 'package:probashipower_app/src/widgets/profile_card.dart';

// class AboutPage extends StatelessWidget {
//   const AboutPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Constants.bgColor,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           physics: const BouncingScrollPhysics(),
//           child: Padding(
//             padding: const EdgeInsets.all(
//               Constants.kDefaultPadding * 1.5,
//             ),
//             child: Column(
//               children: [
//                 const ProfileCard(),
//                 const SizedBox(
//                   height: Constants.kDefaultPadding * 1.5,
//                 ),
//                 const AboutCard(),
//                 const SizedBox(
//                   height: Constants.kDefaultPadding * 1.5,
//                 ),
//                 LinkCard(
//                   link: Constants.data['linkedin']!,
//                   icon: BootstrapIcons.linkedin,
//                   title: "Linkedin Profile",
//                 ),
//                 LinkCard(
//                   link: Constants.data['github']!,
//                   icon: BootstrapIcons.github,
//                   title: "Github Profile",
//                 ),
//                 LinkCard(
//                   link: Constants.data['facebook']!,
//                   icon: BootstrapIcons.facebook,
//                   title: "Facebook Profile",
//                 ),
//                 LinkCard(
//                   link: Constants.data['instagram']!,
//                   icon: BootstrapIcons.instagram,
//                   title: "Instagram Profile",
//                 ),
//                 LinkCard(
//                   link: Constants.data['youtube']!,
//                   icon: BootstrapIcons.youtube,
//                   title: "Youtube Channel",
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
