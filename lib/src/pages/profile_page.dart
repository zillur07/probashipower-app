import 'package:flutter/material.dart';
import 'package:probashipower_app/src/config/colors.dart';
import 'package:probashipower_app/src/helpers/k_text.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Profile'),
      //   centerTitle: true,
      //   backgroundColor: Colors.blue,
      //   elevation: 0,
      //   actions: [
      //     IconButton(
      //       icon: const Icon(Icons.edit),
      //       onPressed: () {
      //         // Edit profile functionality
      //       },
      //     ),
      //   ],
      //   leading: IconButton(
      //     icon: const Icon(Icons.arrow_back),
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //   ),
      // ),

      appBar: AppBar(
        centerTitle: true,
        backgroundColor: tabColor,
        title: const KText(
          text: 'প্রবাসী পাওয়ার',
          color: white,
          fontSize: 25,
          fontWeight: FontWeight.w500,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 5,
            ),
            child: IconButton(
                onPressed: () {}, icon: const Icon(Icons.login_outlined)),
          ),
        ],
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back),
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        // ),
      ),
      drawer: Drawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            KText(
              text: 'আপনার প্রোফাইল',
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                  'assets/img/sohid/dipto-dey.jpg'), // Add your profile image in assets
            ),
            const SizedBox(height: 20),
            const Text(
              'John Doe', // Replace with actual name
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'ID/Refer Code : PPR-2', // Replace with actual designation
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            const ListTile(
              leading: Icon(Icons.phone, color: Colors.blue),
              title: Text('Mobile Number'),
              subtitle:
                  Text('+123 456 7890'), // Replace with actual mobile number
            ),
            const Divider(),
            const ListTile(
              leading: Icon(Icons.message, color: Colors.green),
              title: Text('WhatsApp Number'),
              subtitle:
                  Text('+123 456 7890'), // Replace with actual WhatsApp number
            ),
            const Divider(),
            const ListTile(
              leading: Icon(Icons.email, color: Colors.red),
              title: Text('Email'),
              subtitle:
                  Text('john.doe@example.com'), // Replace with actual email
            ),
            const Divider(),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add functionality to edit profile
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                textStyle: const TextStyle(fontSize: 16),
              ),
              child: Text('Edit Profile'),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
