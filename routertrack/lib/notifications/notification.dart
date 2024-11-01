import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:open_file/open_file.dart';
import 'package:permission_handler/permission_handler.dart';

class Notif {
  static int counter = 0;

  static Future<void> initNotification(FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid
    );
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,

      onDidReceiveNotificationResponse: (NotificationResponse notificationResponse) {
        String? payload = notificationResponse.payload;
        if (payload != null) {
          OpenFile.open(payload);
        }
      }
    );
  }

  static Future<void> showDownloadNotification({
    required FlutterLocalNotificationsPlugin fnp,
    required String routeName,
    required String routeFilename,
  }) async {
    await Permission.notification.isDenied.then((value) {
      if (value) {
        Permission.notification.request();
      }
    });
    if (await Permission.notification.isGranted) {
      AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
        'channel id',
        'notification_channel_name',
        playSound: true,
        importance: Importance.max,
        priority: Priority.high,
        styleInformation: BigTextStyleInformation('The $routeName has been downloaded!'),
      );

      NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails);
      await fnp.show(
          counter++,
          "Routertrack",
          "Downloaded $routeName!",
          notificationDetails,
          payload: routeFilename
      );
    }


  }

}

