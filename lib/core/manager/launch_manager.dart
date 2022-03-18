import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterspacex/core/manager/api_manager.dart';
import 'package:flutterspacex/core/model/Company/spacex.dart';
import 'package:flutterspacex/core/model/Landpad/landpad.dart';
import 'package:flutterspacex/core/model/Launch/launch.dart';
import 'package:flutterspacex/core/model/Launchpad/launchpad.dart';
import 'package:flutterspacex/core/model/Rocket/rocket.dart';


class LaunchManager{
  List<Launch>? _launch;
  List<Launch>? _pastLaunch;
  List<Launchpad>? _launchpad;
  List<Landpad>? _landpad;

  List<Launch> get launchs => _launch ?? [];
  List<Launch> get pastLaunchs => _pastLaunch ?? [];
  List<Launchpad> get launchpad => _launchpad ?? [];
  List<Landpad> get landpad => _landpad ?? [];

  static final LaunchManager _instance = LaunchManager._internal();

  factory LaunchManager() => _instance;

  LaunchManager._internal();

  int get _launchListLength => _launch?.length ?? 0;
  int get _pastLaunchListLength => _pastLaunch?.length ?? 0;
  int get _launchpadListLength => _launchpad?.length ?? 0;
  int get _landpadListLength => _landpad?.length ?? 0;

  Future<bool> initData() async {
    await Future.wait([
      loadAllLaunch(),
      loadAllPastLaunch(),
      loadAllLaunchPad(),
      loadAllLandpad()]
    );
    return true;
  }

  Future<void> loadAllLaunch()async{
    try{
      _launch = await ApiManager().getUpcomingLaunch();
    } catch (e) {
      debugPrint("Erreur : $e");
    }
  }

  Future<void> loadAllPastLaunch() async {
    try{
      _pastLaunch = await ApiManager().getPastLaunch();
    }catch(e){
      debugPrint("Erreur: $e");
    }
  }

  Future<void> loadAllLaunchPad() async {
    try{
      _launchpad = await ApiManager().getAllLaunchPad();
    }catch(e){
      debugPrint("Erreur: $e");
    }
  }

  Future<void> loadAllLandpad() async {
    try{
      _landpad = await ApiManager().getAllLandPad();
    }catch(e){
      debugPrint("Erreur: $e");
    }
  }



  Future<Launch?> getLaunchDetail(String idLaunch) async{
    Launch? launch;
    try{
      launch = await ApiManager().getOneLaunch(idLaunch);
    }catch(e){
      debugPrint("Error: $e");
    }
    return launch;
  }

  Future<Launch?> getNextLaunch() async{
    Launch? launch;
    try{
      launch = await ApiManager().getNextLaunch();
    }catch(e){
      debugPrint("Error: $e");
    }
    return launch;
  }

  Future<Rocket?> getRocket(String idRocket) async{
    Rocket? rocket;
    try{
      rocket = await ApiManager().getOneRocket(idRocket);
    }catch(e){
      debugPrint("Error: $e");
    }
    return rocket;
  }

  Future<Spacex?> getSpacex() async {
    Spacex? spacex;
    try{
      spacex = await ApiManager().getSpacex();
    }catch(e){
      debugPrint("Error: $e");
    }
    return spacex;
  }



}