import 'package:dio/dio.dart';
import 'package:flutterspacex/core/model/Company/spacex.dart';
import 'package:flutterspacex/core/model/Landpad/landpad.dart';
import 'package:flutterspacex/core/model/Launch/launch.dart';
import 'package:flutterspacex/core/model/Launchpad/launchpad.dart';
import 'package:flutterspacex/core/model/Rocket/rocket.dart';



class ApiManager {
  static final ApiManager _instance = ApiManager._internal();

  factory ApiManager() => _instance;

  late Dio dio;

  ApiManager._internal() {
    dio = Dio();
    dio.options.baseUrl =
    "https://api.spacexdata.com/v4";
  }

  List<Launch>? parseListLaunch(List<dynamic>? json){
    if(json == null){
      return null;
    }
    List<dynamic> jsonArray = json;
    return jsonArray.map((json) => Launch.fromJson(json)).toList();
  }

  List<Launchpad>? parseListLaunchPad(List<dynamic>? json){
    if(json == null){
      return null;
    }
    List<dynamic> jsonArray = json;
    return jsonArray.map((json) => Launchpad.fromJson(json)).toList();
  }

  List<Landpad>? parseListLandPad(List<dynamic>? json){
    if(json == null){
      return null;
    }
    List<dynamic> jsonArray = json;
    return jsonArray.map((json) => Landpad.fromJson(json)).toList();
  }

  Launch? parseLaunch(dynamic json){
    if(json == null){
      return null;
    }
    return Launch.fromJson(json);
  }

  Rocket? parseRocket(dynamic json){
    if(json == null){
      return null;
    }
    return Rocket.fromJson(json);
  }

  Spacex? parseSpacex(dynamic json){
    if(json == null){
      return null;
    }
    return Spacex.fromJson(json);
  }



  Future<List<Launch>?> getUpcomingLaunch() async {
    try{
      return await dio.get("/launches/upcoming").then((response) => parseListLaunch(response.data));
    }catch(e){
      print("Error for all launch: $e");
    }
  }

  Future<List<Launch>?> getPastLaunch() async {
    try {
      return await dio.get("/launches/past").then((response) => parseListLaunch(response.data));
    }catch(e){
      print("Error for past launch: $e");
    }
  }
  
  Future<List<Launchpad>?> getAllLaunchPad() async {
    try {
      return await dio.get("/launchpads").then((response) => parseListLaunchPad(response.data));
    }catch(e){
      print("Error for launch pad: $e");
    }
  }

  Future<List<Landpad>?> getAllLandPad() async {
    try{
      return await dio.get("/landpads").then((response) => parseListLandPad(response.data));
    }catch(e){
      print("Error for land pad: $e");
    }
  }

  Future<Launch?> getOneLaunch(String id) async {
    try{
      return await dio.get("/launches/$id").then((response) => parseLaunch(response.data));
    }catch(e){
      print("Error for one launch: $e");
    }
  }
  
  Future<Launch?> getNextLaunch()async{
    try{
      return await dio.get("/launches/next").then((response) => parseLaunch(response.data));
    }catch(e){
      print("Error for next launch: $e");
    }
  }

  Future<Rocket?> getOneRocket(String id) async{
    try{
      return await dio.get("/rockets/$id").then((response) => parseRocket(response.data));
    }catch(e){
      print("Error for one rockets: $e");
    }
  }

  Future<Spacex?> getSpacex() async {
    try{
      return await dio.get("/company").then((response) => parseSpacex(response.data));
    }catch(e){
      print("Error for spacex: $e");
      }
  }
  
  


  
  

}