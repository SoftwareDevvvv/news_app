import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/constants/assets%20manager/constants.dart';
import 'package:news_app/core/features/news/data/domain/article.dart';
import 'package:news_app/core/features/news/logic/news_bloc.dart';
import 'package:news_app/core/features/news/logic/news_event.dart';
import 'package:news_app/core/features/news/logic/news_states.dart';
import 'package:news_app/core/features/news/presentation/screens/article_screen.dart';
import 'package:news_app/core/features/news/presentation/widgets/article_widget.dart';
import 'package:news_app/core/features/news/presentation/widgets/redacted_article_widget.dart';

import '../../../../constants/assets manager/assets_manager.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> categories = Constants.categories;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: categories.length, vsync: this);
    _tabController.addListener(_onTabChanged);
  }

  void _onTabChanged() {
    if (_tabController.indexIsChanging) {
      BlocProvider.of<NewsBloc>(context).add(FetchNewsEvent(categories[_tabController.index]));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 40,
                    width: 90,
                    child: Image.asset(AssetsManager.logo,fit: BoxFit.cover,),),
                  Text(
                    Constants.topHeadlinesText.toUpperCase(),
                    style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
                  ),
                ],
              ),
              InkWell(
                onTap: () => showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color.fromARGB(255, 230, 212, 186),
          title: Text('DEMO MESSAGE'),
          content: Text('User Not Logged In'),
          actions: <Widget>[
            FilledButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    ),
                child: CircleAvatar(
                  
                  child: Icon(Icons.person),
                  radius: 19,
                ),
              )
            ],
          ),
          bottom: TabBar(
            controller: _tabController,
            tabs: categories.map((category) => Tab(child: Text(category,style: const TextStyle(color: Colors.black),),)).toList(),
            isScrollable: true,
          ),
        ),
        body: BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            if (state is NewsLoadingState) {
              return ListView.builder(
                itemCount: 6,
                itemBuilder: (context, index) => const RedactedArticleWidget()
                
        );
        
            } else if (state is NewsLoadedState) {
              final List<Article> articleList = state.articlesList;
              return ListView.builder(
                itemCount: articleList.length,
                itemBuilder: (context, index) => 
                OpenContainer(
              transitionType: ContainerTransitionType.fade,
              openBuilder: (context, _) => ArticleScreen(article: articleList[index]),
              closedBuilder: (context, openContainer) => ArticleWidget(article: articleList[index]),));
            } else if (state is NewsErrorState) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     const Icon(Icons.signal_wifi_statusbar_connected_no_internet_4_outlined,color: Colors.grey,),
                     const SizedBox(height: 8,),
                     Text(Constants.networkErrorText),
                     const SizedBox(height: 8,),
                    FilledButton(
                      onPressed: (){
                         BlocProvider.of<NewsBloc>(context).add(
                          FetchNewsEvent(categories[_tabController.index])
                        );
                      },
                      child: Text(Constants.retryText),
                    ),
                  ],
                ),
              );
            } else {
              return Center(
                child: Text(Constants.networkErrorText),
              );
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
