import 'package:flutter/material.dart';
import 'package:flutterspacex/core/model/Launch/launch.dart';

import 'package:flutterspacex/ui/components/image_placeholder.dart';

class LaunchList extends StatelessWidget{
  final List<Launch> launchs;

  const LaunchList({Key? key,required this.launchs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return launchs.isNotEmpty ? ListView.builder(
        itemBuilder: (context,position) {
          Launch launch = launchs[position];
          print(launch.id);
          return InkWell(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.network(
                    launch.links?.patch?.small ?? '',
                    fit: BoxFit.cover,
                    errorBuilder: (context,child,stack){
                      return const ImagePlaceholder();
                    },
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          launch.name ?? '',
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          launch.date_local.toString(),
                        ),
                      ],
                    )
                )
              ],
            ),
          );
        },
      itemCount: launchs.length,
    ): const Center(child: Text('No Launch'),);
  }
  
}