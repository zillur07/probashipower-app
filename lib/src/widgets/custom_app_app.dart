import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback? onLoginPressed;

  const CustomAppBar({
    super.key,
    required this.title,
    required this.backgroundColor,
    required this.textColor,
    this.onLoginPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: backgroundColor,
      title: Text(
        title,
        style: TextStyle(
          color: textColor,
          fontSize: 25,
          fontWeight: FontWeight.w500,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: IconButton(
            onPressed: onLoginPressed,
            icon: const Icon(Icons.login_outlined),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
