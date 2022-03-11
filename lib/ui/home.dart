import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterspacex/core/manager/launch_manager.dart';
import 'package:flutterspacex/core/model/Launch/launch.dart';
import 'package:flutterspacex/ui/company.dart';
import 'package:flutterspacex/ui/pages/launch_list_page.dart';
import 'package:sembast/timestamp.dart';

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
  int _currentIndex = 0;
  Launch? _nextLaunch;
  final PageController _pageController = PageController();

  String printDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitsHours = twoDigits(duration.inHours.remainder(24));
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inDays)} J $twoDigitsHours H $twoDigitMinutes M $twoDigitSeconds S";
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.info,
                color: Colors.white,
              ),
              onPressed: () async{
                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>Company(title: "Informations")));
              }
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                label: "Liste",
                icon: Icon(Icons.list),
                activeIcon: Icon(
                  Icons.list,
                  color: Colors.blue,
                )),
            BottomNavigationBarItem(
                label: "Historique",
                icon: Icon(Icons.timer),
                activeIcon: Icon(
                  Icons.timer,
                  color: Colors.blue,
                )),
            BottomNavigationBarItem(
                label: "Map",
                icon: Icon(Icons.map),
                activeIcon: Icon(
                  Icons.map,
                  color: Colors.blue,
                )),
          ],
          currentIndex: _currentIndex,
          onTap: (newIndex) {
            setState(() {
              _currentIndex = newIndex;
            });
            _pageController.animateToPage(_currentIndex,
                duration: kThemeAnimationDuration, curve: Curves.ease);
          },
        ),
        body: FutureBuilder<List<dynamic>>(
          future: Future.wait([
            LaunchManager().initData(),
            LaunchManager().getNextLaunch(),
            ]
          ),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              _nextLaunch = snapshot.data?[1];
              Duration tmp  = _nextLaunch!.date_local.difference(DateTime.now());
              return Column(
                children: [
                  Text(
                    printDuration(tmp),
                    style: const TextStyle(fontSize: 30),
                  ),
                  Expanded(
                      child: PageView(
                        controller: _pageController,
                        physics: NeverScrollableScrollPhysics(),
                        children: const [
                          LaunchListPage(),
                          LaunchListPage(isFromPast: true)
                        ],
                      )
                  ),
                ],
              );
            } else {
              return const Center(child: CircularProgressIndicator(),);
            }
          },
        ));
  }
}