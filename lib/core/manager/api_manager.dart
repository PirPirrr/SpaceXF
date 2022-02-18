import 'package:dio/dio.dart';
import 'package:flutterspacex/core/model/Launch/launch.dart';



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

  Future<List<Launch>?> getUpcomingLaunch() async {
    try{
      return await dio.get("/launches/upcoming").then((response) => parseListLaunch(response.data));
    }catch(e){
      print("Error: $e");
    }
  }

  Future<Launch?> getOneLaunch(String id) async {
    try{
      return await dio.get("/launches$id").then((response) => parseLaunch(response.data));
    }catch(e){
      print("Error: $e");
    }
  }

}