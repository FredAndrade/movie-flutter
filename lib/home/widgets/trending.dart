import 'package:flutter/material.dart';
import 'package:movie_app/home/description/description.dart';


class TrendingMovies extends StatelessWidget {

  final List trending;

  const TrendingMovies({super.key, required this.trending});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Trending Movies', style: TextStyle(color: Colors.white, fontSize: 24,fontWeight: FontWeight.w500)),
          const SizedBox(height: 12,),
          SizedBox(
            height: 250,
            child: ListView.builder(itemCount: trending.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(
                          builder: (context)=> DescriptionPage(
                            name: trending[index]['title'] ?? trending[index]['name'],
                            description: trending[index]['overview'],
                            bannerUrl: 'http://image.tmdb.org/t/p/w500'+trending[index]['backdrop_path'],
                            posterUrl: 'http://image.tmdb.org/t/p/w500'+trending[index]['poster_path'],
                            vote: trending[index]['vote_average'].toString(),
                            launch_date: trending[index]['first_air_date'],
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
                                        "http://image.tmdb.org/t/p/w500" +trending[index]['poster_path']
                                    )
                                )
                            ),
                          ),
                          const SizedBox(height: 10,),
                          Text(trending[index]['title'] ?? trending[index]['name'],
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
