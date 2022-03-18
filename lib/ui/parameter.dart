import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutterspacex/app/app.dart';
import 'package:flutterspacex/core/manager/notifications_manager.dart';
import 'package:flutterspacex/core/model/Launch/launch.dart';

class Parameter extends StatefulWidget{
  static const route = "/parameter";

  const Parameter({Key? key}): super(key: key);

  @override
  State<StatefulWidget> createState() => _Parameter();
}

class _Parameter extends State<Parameter>{


  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    bool checked = false;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Paramètres"),
      ),
      body: Center(
          child: Column(
            children: [
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Text("Notifications"),
                  ),
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: checked,
                    onChanged: (bool? value) {
                      setState(() {
                        checked = value!;
                      });
                    },
                  ),
                ],
              ),
            ],
          )

      ),
    );
  }
}