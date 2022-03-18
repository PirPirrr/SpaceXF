import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutterspacex/core/manager/launch_manager.dart';
import 'package:flutterspacex/core/model/Launch/launch.dart';
import 'package:flutterspacex/ui/components/launch_list.dart';

class LaunchListPage extends StatefulWidget{
  final bool isFromPast;
  final bool isFav;

  const LaunchListPage({Key? key,this.isFromPast = false,this.isFav = false}): super(key: key);

  @override
  State<StatefulWidget> createState() => _LaunchListPageState();
}

class _LaunchListPageState extends State<LaunchListPage>{
  @override
  Widget build(BuildContext context) {
    return LaunchList(
      launchs: widget.isFromPast ?
      LaunchManager().pastLaunchs :
      widget.isFav ?
          LaunchManager().favLaunch :
          LaunchManager().launchs,
      onFavChanged: (Launch launch, bool shouldToggle) async {
          if(shouldToggle){
            await LaunchManager().toggleFav(launch);
          }
          setState(() {});
      },
    );
  }

}