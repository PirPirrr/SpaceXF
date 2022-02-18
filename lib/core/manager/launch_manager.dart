import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterspacex/core/manager/api_manager.dart';
import 'package:flutterspacex/core/model/Launch/launch.dart';


class LaunchManager{
  List<Launch>? _launch;

  List<Launch> get launchs => _launch ?? [];

  static final LaunchManager _instance = LaunchManager._internal();

  factory LaunchManager() => _instance;

  LaunchManager._internal();

  int get _launchListLength => _launch?.length ?? 0;

  Future<bool> initData() async {
    await Future.wait([loadAllLaunch()]);
    return true;
  }

  Future<void> loadAllLaunch()async{
    try{
      _launch = await ApiManager().getUpcomingLaunch();
    } catch (e) {
      debugPrint("Erreur : $e");
    }
  }

  Future<Launch?> getLaunchDetail(String idLaunch) async{
    Launch? launch;
    try{
      launch = await LaunchManager().getLaunchDetail(idLaunch);
    }catch(e){
      print("Error: $e");
    }
    return launch;
  }
}