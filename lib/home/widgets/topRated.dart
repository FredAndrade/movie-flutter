import 'package:flutter/material.dart';
import 'package:movie_app/home/description/description.dart';


class TopRated extends StatelessWidget {

  final List topRated;

  const TopRated({super.key, required this.topRated});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Top Rated Movies', style: TextStyle(color: Colors.white, fontSize: 24,fontWeight: FontWeight.w500)),
          const SizedBox(height: 12,),
          SizedBox(
            height: 250,
            child: ListView.builder(itemCount: topRated.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(
                          builder: (context)=> DescriptionPage(
                            name: topRated[index]['title'] ?? 'loading',
                            description: topRated[index]['overview'],
                            bannerUrl: 'http://image.tmdb.org/t/p/w500'+topRated[index]['backdrop_path'],
                            posterUrl: 'http://image.tmdb.org/t/p/w500'+topRated[index]['poster_path'],
                            vote: topRated[index]['vote_average'].toString(),
                            launch_date: topRated[index]['release_date'],
                          ))
                      );
                    },
                    child: SizedBox(
                      width: 150,
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "http://image.tmdb.org/t/p/w500" +topRated[index]['poster_path']
                                    )
                                )
                            ),
                          ),
                          const SizedBox(height: 10,),
                          Text(topRated[index]['title'] ?? 'Loading',
                            style: const TextStyle(fontSize: 14,
                            fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
