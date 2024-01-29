import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../Models/news.dart';
import '../Repository/news_repository.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository newsRepository;
  NewsBloc(this.newsRepository) : super(NewsLoadingState()) {
    on<LoadNewsEvent>((event, emit) async {
         emit(NewsLoadingState());
         try{
            final news= await newsRepository.fetchNews();
            emit(NewsLoadedState(news));
         }catch(e){
               emit(NewsErrorState(e.toString()));
         }

    });
  }
}
