import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterspacex/core/manager/launch_manager.dart';
import 'package:flutterspacex/core/model/Company/spacex.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:url_launcher/url_launcher.dart';



class Company extends StatefulWidget{
  Company({Key? key, required this.title}) : super(key: key);

  final String title;

  static const route = "/company";

  @override
  State<Company> createState() => _Company();
}

class _Company extends State<Company>{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: LaunchManager().getSpacex(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            Spacex spacex = snapshot.data as Spacex;
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Text(spacex.name ?? "",
                    style: const TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold
                    )
                    ,textAlign: TextAlign.center,),
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(2, 0, 0, 5),
                  child:Column(
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.account_circle),
                          Text(spacex.founder ?? "Inconnu",
                            style: const TextStyle(
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.calendar_today_sharp),
                          Text(spacex.founded.toString() ?? "Inconnu",
                            style: const TextStyle(
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.group),
                          Text(spacex.employees.toString() ?? "Inconnu",
                            style: const TextStyle(
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.monetization_on),
                          Text("${spacex.valuation.toString()} \$" ?? "Inconnu",
                            style: const TextStyle(
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Pays: ${spacex.headquarters?.state} ",
                            style: const TextStyle(
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.location_city),
                          Text(spacex.headquarters?.city ?? "Inconnu",
                            style: const TextStyle(
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Adresse: ${spacex.headquarters?.address} ",
                            style: const TextStyle(
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(5, 0, 5, 20),
                  child:Text("Description: \n ${spacex.summary} " ,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.justify,
                  ) ,
                ),
                Center(
                  child:  Row(
                    children:  [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: IconButton(
                          onPressed:(){
                            launch(spacex.links?.twitter);
                          },
                          icon: const Icon(FontAwesome5.space_shuttle),
                        )
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: IconButton(
                          onPressed:(){
                            launch(spacex.links?.elon_twitter);
                          },
                          icon: const Icon(FontAwesome5.twitter),
                        )
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: IconButton(
                          onPressed:(){
                            launch(spacex.links?.flickr);
                          },
                          icon: const Icon(FontAwesome5.flickr),
                        )
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: IconButton(
                          onPressed:(){
                            launch(spacex.links?.website);
                          },
                          icon: const Icon(Linecons.globe),
                        )
                      ),
                    ],
                  ),
                ),
              ],
            );
          }else{
            return const Center(child: Text("No info for SpaceX"),);
          }
        },
      ),
    );
  }

}