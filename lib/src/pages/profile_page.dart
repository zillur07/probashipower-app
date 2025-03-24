import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:probashipower_app/src/config/colors.dart';
import 'package:probashipower_app/src/controllers/auth_controller.dart';
import 'package:probashipower_app/src/controllers/profile_controller.dart';
import 'package:probashipower_app/src/helpers/k_text.dart';
import 'package:probashipower_app/src/pages/login_page.dart';
import 'package:probashipower_app/src/widgets/custom_app_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

// class ProfilePage extends StatelessWidget {
//   const ProfilePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: const Text('Profile'),
//       //   centerTitle: true,
//       //   backgroundColor: Colors.blue,
//       //   elevation: 0,
//       //   actions: [
//       //     IconButton(
//       //       icon: const Icon(Icons.edit),
//       //       onPressed: () {
//       //         // Edit profile functionality
//       //       },
//       //     ),
//       //   ],
//       //   leading: IconButton(
//       //     icon: const Icon(Icons.arrow_back),
//       //     onPressed: () {
//       //       Navigator.pop(context);
//       //     },
//       //   ),
//       // ),

//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: tabColor,
//         title: const KText(
//           text: 'প্রবাসী পাওয়ার',
//           color: white,
//           fontSize: 25,
//           fontWeight: FontWeight.w500,
//         ),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(
//               right: 5,
//             ),
//             child: IconButton(
//                 onPressed: () {}, icon: const Icon(Icons.login_outlined)),
//           ),
//         ],
//         // leading: IconButton(
//         //   icon: const Icon(Icons.arrow_back),
//         //   onPressed: () {
//         //     Navigator.pop(context);
//         //   },
//         // ),
//       ),
//       drawer: Drawer(),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             SizedBox(
//               height: 15,
//             ),
//             KText(
//               text: 'আপনার প্রোফাইল',
//               fontSize: 25,
//               fontWeight: FontWeight.bold,
//             ),
//             const SizedBox(height: 20),
//             const CircleAvatar(
//               radius: 50,
//               backgroundImage: AssetImage(
//                   'assets/img/sohid/dipto-dey.jpg'), // Add your profile image in assets
//             ),
//             const SizedBox(height: 20),
//             const Text(
//               'John Doe', // Replace with actual name
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 10),
//             const Text(
//               'ID/Refer Code : PPR-2', // Replace with actual designation
//               style: TextStyle(
//                 fontSize: 16,
//                 color: Colors.grey,
//               ),
//             ),
//             const SizedBox(height: 20),
//             const ListTile(
//               leading: Icon(Icons.phone, color: Colors.blue),
//               title: Text('Mobile Number'),
//               subtitle:
//                   Text('+123 456 7890'), // Replace with actual mobile number
//             ),
//             const Divider(),
//             const ListTile(
//               leading: Icon(Icons.message, color: Colors.green),
//               title: Text('WhatsApp Number'),
//               subtitle:
//                   Text('+123 456 7890'), // Replace with actual WhatsApp number
//             ),
//             const Divider(),
//             const ListTile(
//               leading: Icon(Icons.email, color: Colors.red),
//               title: Text('Email'),
//               subtitle:
//                   Text('john.doe@example.com'), // Replace with actual email
//             ),
//             const Divider(),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // Add functionality to edit profile
//               },
//               style: ElevatedButton.styleFrom(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
//                 textStyle: const TextStyle(fontSize: 16),
//               ),
//               child: Text('Edit Profile'),
//             ),
//             const SizedBox(height: 20),
//           ],
//         ),
//       ),
//     );
//   }
// }

class ProfilePage extends StatelessWidget {
  final ProfileController _profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   // ... your existing app bar code
      //   actions: [
      //     IconButton(
      //       icon: const Icon(Icons.logout),
      //       onPressed: () async {
      //
      //       },
      //     ),
      //   ],
      // ),
      // appBar: CustomAppBar(
      //   title: 'প্রবাসী পাওয়ার',
      //   backgroundColor: tabColor, // Replace with your desired color
      //   textColor: Colors.white,
      //   onLoginPressed: () async {
      //     // Add your login logic here
      //     await _logout();
      //     print('Login button pressed');
      //   },
      // ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: tabColor,
        title: KText(
          text: 'প্রবাসী পাওয়ার',
          color: white,
          fontSize: 25,
          fontWeight: FontWeight.w500,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: IconButton(
              icon: Icon(Icons.logout),
              onPressed: () => Get.find<AuthController>().logout(),
            ),
          ),
        ],
      ),
      body: Obx(() {
        if (_profileController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        // Show login prompt if not authenticated
        if (_profileController.profile.value.userid == 0) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Please login to view profile'),
                ElevatedButton(
                  onPressed: () => Get.toNamed('/login'),
                  child: Text('Login'),
                ),
              ],
            ),
          );
        }

        return _buildProfileContent();
      }),
    );
  }

  Widget _buildProfileContent() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 15),
          KText(
            text: 'আপনার প্রোফাইল',
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(height: 20),
          CircleAvatar(
            radius: 50,
            backgroundImage:
                _profileController.profile.value.userImg.isNotEmpty
                    ? CachedNetworkImageProvider(
                      _profileController.profile.value.userImg,
                    )
                    : AssetImage('assets/img/sohid/dipto-dey.jpg')
                        as ImageProvider,
          ),
          SizedBox(height: 20),
          KText(
            text: _profileController.profile.value.name,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(height: 10),
          KText(
            text: 'ID/Refer Code : ${_profileController.profile.value.refId}',
            fontSize: 16,
            color: Colors.grey,
          ),
          SizedBox(height: 20),
          ListTile(
            leading: Icon(Icons.phone, color: Colors.blue),
            title: KText(text: 'Mobile Number'),
            subtitle: KText(text: _profileController.profile.value.mobile),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.message, color: Colors.green),
            title: KText(text: 'WhatsApp Number'),
            subtitle: KText(text: _profileController.profile.value.waNumber),
          ),
          Divider(),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Add functionality to edit profile
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              textStyle: TextStyle(fontSize: 16),
            ),
            child: KText(text: 'Edit Profile'),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Future<void> _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token'); // Remove token on logout
    await prefs.remove('userid');
    // Remove other user data as needed

    Get.offAll(LoginPage()); // Navigate to login page
  }
}
