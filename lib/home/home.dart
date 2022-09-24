import 'package:movie_app/home/widgets/trending.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:flutter/material.dart';

import 'widgets/topRated.dart';
import 'widgets/tvShows.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingMovies = [];
  List topRatedMovies = [];
  List tv = [];
  final String apikey = 'b3c70b45d243de9f6eb263d0400dc70a';
  final acessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiM2M3MGI0NWQyNDNkZTlmNmViMjYzZDA0MDBkYzcwYSIsInN1YiI6IjYwZGUyMWUwMGYzNjU1MDA3NTRkMTZmOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.3M3YdMrqDNDMW2N0CHovyIvVG7mSBY4FmcrKLsqnbNc';

  @override
  void initState(){
    loadmovies();
    super.initState();
  }

  loadmovies()async{
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apikey, acessToken),
        logConfig: const ConfigLogger(
          showLogs: true,
          showErrorLogs: true,
        ));
    Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topRatedResult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvResult = await tmdbWithCustomLogs.v3.tv.getPopular();

    setState(() {
      trendingMovies = trendingResult['results'];
      topRatedMovies = topRatedResult['results'];
      tv = tvResult['results'];
    });
    print(tv);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.transparent,
      appBar: AppBar(backgroundColor: Colors.transparent,
        title: const  Text(
          'TMDB Movie App', style: TextStyle(
          color: Colors.white, fontSize: 18,),
        ),
      ),
      body: ListView(
        children: [
          const Divider(thickness: 1.5,),
          TrendingMovies(trending: trendingMovies),
          const Divider(thickness: 1.5,),
          TopRated(topRated: topRatedMovies),
          const Divider(thickness: 1.5,),
          TvShows(tvShows: tv),
        ],
      ),
    );
  }
}

