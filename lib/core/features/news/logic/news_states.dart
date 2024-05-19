import 'package:equatable/equatable.dart';
import 'package:news_app/core/features/news/data/domain/article.dart';

class NewsState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
  const NewsState();
}

class NewsInitState extends NewsState {}

class NewsLoadingState extends NewsState {}

class NewsLoadedState extends NewsState {
  final List<Article> articlesList;
  NewsLoadedState({required this.articlesList});
}

class NewsErrorState extends NewsState{
  final String errorMessage;
  NewsErrorState({required this.errorMessage});
}