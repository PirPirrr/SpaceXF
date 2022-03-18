
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterspacex/core/manager/launch_manager.dart';
import 'package:flutterspacex/core/model/Launch/launch.dart';
import 'package:flutterspacex/ui/company.dart';
import 'package:flutterspacex/ui/home.dart';
import 'package:flutterspacex/ui/launch_detail.dart';
import 'package:flutterspacex/ui/map.dart';
import 'package:flutterspacex/ui/parameter.dart';

import '../main.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter X SpaceX',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (RouteSettings settings) {
        var arguments = settings.arguments;
        switch (settings.name) {
          case LaunchDetail.route:
            if (arguments != null && arguments is LaunchDetailArguments) {
              Launch launch = arguments.launch;
              return MaterialPageRoute(builder: (_) => LaunchDetail(launch));
            } else {
              throw Exception(
                  "Cette route doit avoir un objet SpotDetailArgument en argument");
            }
          case Company.route:
            return MaterialPageRoute(builder: (_) => Company(title: "Informations"));
          case Maps.route:
            return MaterialPageRoute(builder: (_) => Maps(
              listLaunchpad: LaunchManager().launchpad,
              listLandpad: LaunchManager().landpad,
            ),);
          case Parameter.route:
            return MaterialPageRoute(builder: (_) => const Parameter());
          default:
            return unknownRoute();
        }
      },
      home:  MyHomePage(title: 'SpaceX'),
    );
  }

  MaterialPageRoute unknownRoute() {
    return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(child: Text("Route inconnue")),
        ));
  }
}