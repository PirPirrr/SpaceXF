import 'package:flutter/material.dart';
import 'package:flutterspacex/core/model/Launch/launch.dart';

import 'package:flutterspacex/ui/components/image_placeholder.dart';
import 'package:flutterspacex/ui/launch_detail.dart';

class LaunchList extends StatelessWidget{
  final List<Launch> launchs;

  const LaunchList({Key? key,required this.launchs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return launchs.isNotEmpty ? ListView.builder(
        itemBuilder: (context,position) {
          Launch launch = launchs[position];
          return InkWell(
            onTap: () async{
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => LaunchDetail(launch)));
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                SizedBox(
                  width: 100,
                  height: 100,
                  child: Hero(
                    tag: launch.name ?? "",
                    child: Image.network(
                      launch.links?.patch?.small ?? '',
                      fit: BoxFit.cover,
                      errorBuilder: (context,child,stack){
                        return const ImagePlaceholder();
                      },
                    ),
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
                ),
                IconButton(
                  icon: const Icon(Icons.favorite_border),
                  onPressed: (){

                  },
                )
              ],
            ),
          );
        },
      itemCount: launchs.length,
    ): const Center(child: Text('No Launch'),);
  }
  
}