import 'package:flutter/material.dart';
import 'package:flutterspacex/core/manager/launch_manager.dart';
import 'package:flutterspacex/ui/components/launch_list.dart';

class LaunchListPage extends StatefulWidget{

  const LaunchListPage({Key? key}): super(key: key);

  @override
  State<StatefulWidget> createState() => _LaunchListPageState();
}

class _LaunchListPageState extends State<LaunchListPage>{
  @override
  Widget build(BuildContext context) {
    return LaunchList(
        launchs: LaunchManager().launchs
    );
  }

}