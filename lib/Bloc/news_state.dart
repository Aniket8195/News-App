part of 'news_bloc.dart';

@immutable
abstract class NewsState extends Equatable {}

class NewsLoadingState extends NewsState {
  @override
  List<Object?> get props => [];
}
class NewsLoadedState extends NewsState {
  NewsLoadedState(this.news);
  final List<News>news;
  @override
  List<Object?> get props => [news];
}

class NewsErrorState extends NewsState {
  NewsErrorState(this.error);
  final String error;
  @override
  List<Object?> get props => [error];
}