import 'package:shared_preferences/shared_preferences.dart';

class NotificationManager{
  static final NotificationManager instance = NotificationManager._internal();

  factory NotificationManager() => instance;

  NotificationManager._internal();

  late SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    try{
      _prefs.getBool('notif');
    }catch(e){
      await _prefs.setBool('notif', false);
    }
  }

  bool getNotifState(){
    return _prefs.getBool('notif');
  }

  Future<void> toggleNotifActive(bool active) async{
    await _prefs.remove('notif');
    await _prefs.setBool('notif', active);
  }





}