import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutterspacex/core/manager/launch_manager.dart';
import 'package:flutterspacex/core/model/Launch/launch.dart';

class TimerViewModel extends ChangeNotifier{
  Launch? nextLaunch;
  Duration? timeLeft;

  TimerViewModel(){
    Timer.periodic(const Duration(seconds: 1), (timer) {
      getTimeLeft();
    });
  }

  void getTimeLeft()async {
    try{
      nextLaunch = await LaunchManager().getNextLaunch();
    }catch(e){
      print("Error: $e");
    }
    timeLeft = nextLaunch?.date_local.difference(DateTime.now());

    notifyListeners();
  }

}