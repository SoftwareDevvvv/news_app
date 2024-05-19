import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../utils/utils.dart';
import '../../data/domain/article.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key, required this.article});
  final Article article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: Container(
              height: 50,
              width: 50,
              child: BackButton(
                color: Colors.white,
              ),
            ),
            expandedHeight: 200.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: CachedNetworkImage(
                imageUrl: article.urlToImage.toString(),
                fit: BoxFit.cover,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            title: Text(article.title.toString()),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(article.description.toString()),
                  SizedBox(
                    height: 8,
                  ),
                  Text(article.content.toString()),
                  SizedBox(
                    height: 8,
                  ),
                  Text(article.description.toString()),
                  SizedBox(
                    height: 8,
                  ),
                  Text(article.content.toString()),
                  SizedBox(
                    height: 8,
                  ),
                  Text(article.description.toString()),
                  SizedBox(
                    height: 8,
                  ),
                  Text(article.content.toString()),
                  SizedBox(
                    height: 8,
                  ),
                  Text(article.description.toString()),
                  Text(article.url.toString()),
                  SizedBox(
                    height: 16,
                  ),
                  Text(article.author.toString()),
                  Text(article.source!.name.toString()),
                  Text(
                    Utils().convertToTimeString(article.publishedAt.toString()),
                  ),
                ],
              ),
            )
          ])),
        ],
      ),
    );
  }
}
