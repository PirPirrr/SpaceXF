import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterspacex/core/manager/launch_manager.dart';
import 'package:flutterspacex/core/model/Launch/launch.dart';
import 'package:flutterspacex/core/model/Rocket/rocket.dart';
import 'package:flutterspacex/ui/components/image_placeholder.dart';


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
        Navigator.pop(context);
        return true;
        },
      child: FutureBuilder<List<dynamic>>(
        future: Future.wait([
          LaunchManager().getLaunchDetail(launch.id),
          LaunchManager().getRocket(launch.rocket),
        ]),
        builder: (context,snapchot){
          if(snapchot.hasData) {
            launch = snapchot.data?[0];
            launch.nomRocket = snapchot.data?[1];
          }
          return Scaffold(
            appBar: AppBar(
              title: Text(launch.name ?? ''),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Hero(
                      tag: launch.name ?? "",
                      child: Image.network(
                        launch.links?.patch?.large ?? '',
                        fit: BoxFit.cover,
                        errorBuilder: (context,child,stack){
                          return const ImagePlaceholder();
                        },
                      ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                      launch.details ?? "",
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                      "Rocket : ${launch.nomRocket?.name ?? "Unknow Rocket"}" ,
                    style: const TextStyle(
                      fontSize: 30,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  Stack(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 300,
                        child: PageView.builder(
                            itemBuilder: (context,position){
                              return Image.network(
                                  snapchot.hasData ? (launch.nomRocket?.flickr_images?[position] ?? '') : launch.links?.patch?.large ?? '',
                                fit: BoxFit.cover,
                                errorBuilder: (context,child,stack){
                                    return const ImagePlaceholder();
                                }
                              );
                            },
                          itemCount: launch.nomRocket?.flickr_images?.length ?? 0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),

                ],
              ),
            ),
          );
        }
      ),
    );
  }

}