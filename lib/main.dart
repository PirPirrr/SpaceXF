import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutterspacex/core/manager/database_manager.dart';
import 'package:flutterspacex/core/manager/launch_manager.dart';
import 'package:flutterspacex/core/manager/notifications_manager.dart';
import 'package:flutterspacex/ui/home.dart';

import 'app/app.dart';
import 'core/model/Launch/launch.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationManager().init();
  await DataBaseManager().init();
  runApp(const MyApp());
  void selectNotification(String? nameLaunch) async {
    if (nameLaunch != null) {
      debugPrint('$nameLaunch est le prochain lancement');
    }
    runApp(const MyApp());
  }
  Launch? nextLaunch = await LaunchManager().getNextLaunch();

  if(NotificationManager().getNotifState()){
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
// initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('app_icon');

    const InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: selectNotification);

    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
        'repeating channel id', 'repeating channel name',
        channelDescription: 'repeating description');
    const NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.periodicallyShow(0, 'Le prochain lancement est',
        nextLaunch?.name, RepeatInterval.weekly, platformChannelSpecifics,
        androidAllowWhileIdle: true);
  }


}






