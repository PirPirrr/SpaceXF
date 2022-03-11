import 'package:dio/dio.dart';
import 'package:flutterspacex/core/model/Launch/launch.dart';
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


  
  

}