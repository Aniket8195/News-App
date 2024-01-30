import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Repository/news_repository.dart';
import '../Bloc/news_bloc.dart';
import '../Models/news.dart';
import '../Utils/card_widget.dart';
import '../Utils/shimmer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>NewsBloc(RepositoryProvider.of<NewsRepository>(context),)..add(LoadNewsEvent()),
      child: Scaffold(
        appBar:AppBar(
          title: const Text("News App"),
          backgroundColor: Colors.red,
          actions: [
            BlocBuilder<NewsBloc,NewsState>(
                builder:(context,state){
                  if(state is NewsLoadedState){
                    return IconButton(
                      onPressed: (){
                        BlocProvider.of<NewsBloc>(context).add(RefreshNewsEvent());
                      },
                      icon: const Icon(Icons.refresh),
                    );
                  }
                  else{
                    return const SizedBox.shrink();

                  }
                }

            )
          ],
        ),
        // AppBar(
        //   title:const  Text("News App"),
        //   backgroundColor: Colors.red,
        // ),
        body: BlocBuilder<NewsBloc,NewsState>(
          builder:(context,state){
            if(state is NewsLoadingState){
              // return const Center(
              //   child: CircularProgressIndicator(),
              // );
              return showShimmer(context);
            }
            if(state is NewsLoadedState){
              List<News>newsList=state.news;
              return showNews(context, newsList);
            }
            if(state is NewsErrorState){
              return Center(
                child: Text(state.error),
              );
            }
            if(state is NewsRefreshState){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return const Center(
              child: Text("Error"),
            );

          } ,

        ),
      ),
    );
  }
}