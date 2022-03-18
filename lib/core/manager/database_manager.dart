import 'package:flutterspacex/core/model/Launch/launch.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class DataBaseManager{
  static const launchStore = "launch-store";
  static DataBaseManager instance = DataBaseManager._internal();

  factory DataBaseManager() => instance;

  late Database _db;

  final StoreRef<String, Map<String, Object?>> _launchStore = intMapStoreFactory.store(launchStore) as StoreRef<String, Map<String, Object?>>;

  DataBaseManager._internal();

  Future<void> init() async{
    String dataDirectoryPath = (await getApplicationDocumentsDirectory()).path;
    _db = (await databaseFactoryIo.openDatabase("$dataDirectoryPath/launch_fav.db"));
  }

  Future<void> addLaunch(Launch launch) async =>
      await _db.transaction((transaction) async =>
        await _launchStore.record(launch.id).put(transaction, launch.toJson()));

  Future<void> deleteLaunch(String idLaunch) async =>
      await _launchStore.record(idLaunch).delete(_db);

  Future<void> isFavorite(String idLaunch) async =>
      await _launchStore.record(idLaunch).delete(_db);



}