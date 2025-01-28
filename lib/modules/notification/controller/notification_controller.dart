import 'package:get/get.dart';

class AppNotification {
  String title;
  String description;
  String time;
  bool isRead;

  AppNotification({
    required this.title,
    required this.description,
    required this.time,
    this.isRead = false,
  });
}

class NotificationController extends GetxController {
  var selectedFilter = 'all'.obs;

  var notifications = <AppNotification>[
    AppNotification(title: "Deposit", description: "Your deposit of ", time: "12:25 am", isRead: false),
    AppNotification(title: "Transfer", description: "Your Transfer of ", time: "1:20 am", isRead: true),
    AppNotification(title: "Deposit", description: "Your deposit of ", time: "12:25 am", isRead: false),
    AppNotification(title: "Deposit", description: "Your deposit of ", time: "1:20 am", isRead: true),
    AppNotification(title: "Transfer", description: "Your Transfer of ", time: "1:20 am", isRead: true),
  ].obs;

  List<AppNotification> get filteredNotifications {
    if (selectedFilter.value == 'unread') {
      return notifications.where((n) => !n.isRead).toList();
    } else if (selectedFilter.value == 'read') {
      return notifications.where((n) => n.isRead).toList();
    }
    return notifications; // Show all
  }
}
