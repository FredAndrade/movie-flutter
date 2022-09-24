import 'package:flutter/material.dart';

class DescriptionPage extends StatelessWidget {

  final String name;
  final String description;
  final String bannerUrl;
  final String posterUrl;
  final String vote;
  final String launch_date;

  const DescriptionPage({super.key, required this.name, required this.description, required this.bannerUrl, required this.posterUrl, required this.vote, required this.launch_date});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent,
        title: Text(name),
      ),
      body: ListView(
        children: [
          Container(
            height: 250,
              child: Stack(
                children: [
                 Positioned(child: SizedBox(
                   height: 250,
                   width: MediaQuery.of(context).size.width,
                   child: Image.network(bannerUrl, fit: BoxFit.cover,),
                 )),
                ],
              ),
          ),
          const SizedBox(height: 5),
          Container(
              margin: const EdgeInsets.only(left: 10, top: 5),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Released:$launch_date', style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                      Text('$vote ⭐ ', style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w500),)
                    ],
                  ),
                  const SizedBox(height: 15),
                  Text(description),
                ],

              )
          ),
        ],
      ),
    );
  }
}
