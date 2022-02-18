import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterspacex/core/manager/launch_manager.dart';
import 'package:flutterspacex/core/model/Launch/launch.dart';


class LaunchDetailArguments{
  Launch launch;

  LaunchDetailArguments({required this.launch});
}

class LaunchDetail extends StatefulWidget{
  static const route = "/oneLaunch";

  final Launch launch;

  const LaunchDetail(this.launch,{Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LaunchDetailState();
}

class _LaunchDetailState extends State<LaunchDetail>{
  late Launch launch;

  @override
  void initState() {
    launch = widget.launch;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
        },
      child: FutureBuilder<dynamic>(
        future: Future.wait([LaunchManager().getLaunchDetail(launch.id)]),
        builder: (context,snapchot){
          launch = snapchot.data[0];
          return Scaffold(
            appBar: AppBar(
              title: Text(launch.name ?? ''),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [],
              ),
            ),
          );
        }
      ),
    );
  }

}