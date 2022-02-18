import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterspacex/core/manager/launch_manager.dart';
import 'package:flutterspacex/ui/pages/launch_list_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void _incrementCounter() {
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the HomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: FutureBuilder(
          future: LaunchManager().initData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return PageView(
                controller: PageController(),
                children: const [
                  LaunchListPage(),
                ],
              );
            } else {
              return const Center(child: CircularProgressIndicator(),);
            }
          },
        ));
  }
}