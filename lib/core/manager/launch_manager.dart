import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterspacex/core/manager/api_manager.dart';
import 'package:flutterspacex/core/model/Launch/launch.dart';
import 'package:flutterspacex/core/model/Rocket/rocket.dart';


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
      launch = await ApiManager().getOneLaunch(idLaunch);
    }catch(e){
      print("Error: $e");
    }
    return launch;
  }

  Future<Rocket?> getRocket(String idRocket) async{
    Rocket? rocket;
    try{
      rocket = await ApiManager().getOneRocket(idRocket);
    }catch(e){
      print("Error: $e");
    }
    return rocket;
  }
}