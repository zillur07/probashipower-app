// lib/src/pages/notification_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:probashipower_app/src/config/colors.dart';
import 'package:probashipower_app/src/controllers/notification_controller.dart';
import 'package:probashipower_app/src/helpers/k_text.dart';
import 'package:probashipower_app/src/widgets/custom_app_app.dart';

class NotificationPage extends StatelessWidget {
  final NotificationController _controller = Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'প্রবাসী পাওয়ার',
        backgroundColor: tabColor,
        textColor: Colors.white,
        onLoginPressed: () => Get.offAllNamed('/login'),
      ),
      body: Obx(() {
        if (_controller.isLoading.value && _controller.notifications.isEmpty) {
          return _buildLoading();
        }

        if (_controller.error.isNotEmpty) {
          return _buildError();
        }

        if (_controller.notifications.isEmpty) {
          return _buildEmpty();
        }

        return _buildNotificationList();
      }),
    );
  }

  Widget _buildLoading() => Center(child: CircularProgressIndicator());

  Widget _buildError() => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        KText(text: _controller.error.value, color: Colors.red, fontSize: 16),
        if (_controller.error.value.contains('login'))
          TextButton(
            onPressed: () => Get.offAllNamed('/login'),
            child: KText(text: 'Login Now'),
          ),
      ],
    ),
  );

  Widget _buildEmpty() => Center(
    child: KText(
      text: 'No notifications available',
      fontSize: 18,
      color: Colors.red,
    ),
  );

  Widget _buildNotificationList() => RefreshIndicator(
    onRefresh: _controller.refresh,
    child: Column(
      children: [
        _buildHeader(),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            primary: false,
            padding: EdgeInsets.only(top: 8),
            itemCount: _controller.notifications.length,
            itemBuilder: (context, index) => _buildNotificationItem(index),
          ),
        ),
      ],
    ),
  );

  Widget _buildHeader() => Container(
    margin: EdgeInsets.symmetric(horizontal: 70, vertical: 15),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.teal.withOpacity(0.3)),
    ),
    child: Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/img/job.png', height: 30),
          SizedBox(width: 10),
          KText(text: 'নোটিশ', fontSize: 22, fontWeight: FontWeight.bold),
        ],
      ),
    ),
  );

  Widget _buildNotificationItem(int index) {
    final notification = _controller.notifications[index];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: ListTile(
          leading: Icon(Icons.notifications_active, color: tabColor),
          title: KText(text: notification.message),
          subtitle: KText(
            text: _formatDate(notification.date!),
            color: Colors.grey[600],
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
      ),
    );
  }

  String _formatDate(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      return DateFormat('dd MMM yyyy').format(date);
    } catch (e) {
      return dateString;
    }
  }
}
