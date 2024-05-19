import 'package:news_app/core/features/news/data/domain/article.dart';
import 'package:news_app/core/features/news/data/repository/news_repository.dart';
import 'package:news_app/core/features/news/logic/news_event.dart';
import 'package:news_app/core/features/news/logic/news_states.dart';
import 'package:bloc/bloc.dart';
class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsRepository newsRepository;
  final Map<String, List<Article>> _cachedArticles = {};
  NewsBloc({required NewsState initialState, required this.newsRepository }) : super(initialState){
    add(StartEvent());
  }
  
  
  @override
  Stream<NewsState> mapEventToState(NewsEvent event) async* {
    if (event is StartEvent) {
      yield* _mapStartEventToState();
    } else if (event is FetchNewsEvent) {
      yield* _mapFetchNewsEventToState(event.category);
    }
  }

  Stream<NewsState> _mapStartEventToState() async* {
    yield NewsLoadingState();
    try {
      final List<Article> articleList = await newsRepository.fetchNews();
      _cachedArticles['General'] = articleList;
      yield NewsLoadedState(articlesList: articleList);
    } catch (e) {
      yield NewsErrorState(errorMessage: e.toString());
    }
  }

  Stream<NewsState> _mapFetchNewsEventToState(String category) async* {
    yield NewsLoadingState();
    try {
      if (_cachedArticles.containsKey(category)) {
        yield NewsLoadedState(articlesList: _cachedArticles[category]!);
      } else {
        final List<Article> articleList =
            await newsRepository.fetchNewsByCategory(category);
        _cachedArticles[category] = articleList;
        yield NewsLoadedState(articlesList: articleList);
      }
    } catch (e) {
      yield NewsErrorState(errorMessage: "An error has occured");
    }
  }
}

