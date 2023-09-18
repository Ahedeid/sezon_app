import 'package:flutter/material.dart';


class ProfileWidget extends StatelessWidget {
  const ProfileWidget({
    required this.text,
    required this.icon,
    required this.onTap,
    super.key,
  });
  final void Function()? onTap;
  final String text;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.white,
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          backgroundColor:
              icon == Icons.logout ? Colors.red.shade100 : Colors.blue.shade100,
          child: Icon(
            icon,
            color: icon == Icons.logout ? Colors.red : Colors.blue,
          ),
        ),
        title: Text(text),
        trailing: CircleAvatar(
          backgroundColor: Colors.grey.shade100,
          child: const Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}
