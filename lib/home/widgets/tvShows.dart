import 'package:flutter/material.dart';
import 'package:movie_app/home/description/description.dart';


class TvShows extends StatelessWidget {

  final List tvShows;

  const TvShows({super.key, required this.tvShows});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Television Shows', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w500)),
          const SizedBox(height: 12,),
          SizedBox(
            height: 200,
            child: ListView.builder(itemCount: tvShows.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(
                          builder: (context)=> DescriptionPage(
                            name: tvShows[index]['title'] ?? tvShows[index]['name'],
                            description: tvShows[index]['overview'],
                            bannerUrl: 'http://image.tmdb.org/t/p/w500'+tvShows[index]['backdrop_path'],
                            posterUrl: 'http://image.tmdb.org/t/p/w500'+tvShows[index]['poster_path'],
                            vote: tvShows[index]['vote_average'].toString(),
                            launch_date: tvShows[index]['first_air_date'],
                          ))
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      width: 250,
                      child: Column(
                        children: [
                          Container(
                            width: 250,
                            height: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "http://image.tmdb.org/t/p/w500" +tvShows[index]['backdrop_path']
                                    ),
                                  fit: BoxFit.cover,
                                )
                            ),
                          ),
                          const SizedBox(height: 10,),
                          Text(tvShows[index]['original_name'] ?? 'Loading',
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
