import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sezon_app/models/notification_model.dart';
import 'package:sezon_app/service_locator.dart';
import 'package:sezon_app/utils/style_manager.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  String timeFormat = DateFormat("hh:mm a").format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("notifications".tr),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream:
              sl<FirebaseFirestore>().collection('notifications').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 15,
                ),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  final notificationData =
                      NotificationsModel.fromJson(snapshot.data!.docs[index]);
                  print('in list view');
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Container(
                          height: 44,
                          width: 44,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              shape: BoxShape.circle),
                          child: const Text(
                            '👏🏻',
                            style: StyleManager.headline2,
                          ),
                        ),
                        title: Text(
                          notificationData.title,
                          style: StyleManager.headline2,
                        ),
                        subtitle: Text(
                          'منذ  ${notificationData.time} ساعات ',
                          //  timeFormat,
                          style: StyleManager.labelStyle,
                        ),
                      ),
                      // const SizedBox(height: 4),
                      // Text(
                      //   notificationData.body,
                      //   style: StyleManager.smallText(),
                      // ),
                      // const SizedBox(height: 8),
                      const Divider(),
                    ],
                  );
                });
          }),
    );
  }
}
