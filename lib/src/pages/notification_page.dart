import 'package:flutter/material.dart';
import 'package:probashipower_app/src/config/colors.dart';
import 'package:probashipower_app/src/widgets/custom_app_app.dart';

import '../helpers/k_text.dart';

class NotificationPage extends StatelessWidget {
  // Dummy notification data
  final List<String> notifications = [
    "You have a new message",
    "Your order has been shipped",
    "Reminder: Meeting at 3 PM",
    "New update available",
    "Your payment was successful"
  ];

   NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'প্রবাসী পাওয়ার',
        backgroundColor: tabColor, // Replace with your desired color
        textColor: Colors.white,
        onLoginPressed: () {
          // Add your login logic here
          print('Login button pressed');
        },
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 70,
              vertical: 15,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.teal.withOpacity(0.3))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 30, child: Image.asset('assets/img/job.png')),
                  const SizedBox(
                    width: 10,
                  ),
                  const KText(
                    text: 'নোটিশ',
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  )
                ],
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: notifications.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 2,
                ),
                child: Card(
                  child: ListTile(
                    leading: Icon(Icons.notifications_active),
                    title: Text(notifications[index]),
                    subtitle: Text('Just now'),
                    onTap: () {
                      // Handle notification tap
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
