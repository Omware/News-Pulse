import 'package:flutter/material.dart';
import 'package:newsapp/models/article.dart';
import 'package:newsapp/screens/news_detail.dart';
import 'package:newsapp/widgets/news_card.dart';
import 'package:newsapp/widgets/news_card_shimmer.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key, required this.fetchNews});
  final Future<List<Article>?> Function() fetchNews;

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  late Future<List<Article>?> _newsFuture;

  @override
  void initState() {
    super.initState();
    _newsFuture = widget.fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: _newsFuture,
            builder: (ctx, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const ShimmerLoader();
              }
              if (snapshot.hasError) {
                return AlertDialog(
                  icon: const Icon(Icons.error),
                  content: Text(snapshot.error.toString()),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        if (Navigator.of(context).canPop()) {
                          Navigator.pop(context); // Dismiss the AlertDialog
                        }
                        setState(() {
                          _newsFuture =
                              widget.fetchNews(); // Call fetchNews to retry
                        });
                      },
                      child: const Text('Retry'),
                    ),
                  ],
                );
              }

              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(
                  child: Text('No Articles Found'),
                );
              }

              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (ctx, index) => NewsCard(
                      article: snapshot.data![index],
                      onSelectArticle: (article) => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => NewsDetailScreen(
                                    article: article,
                                  )))));
            }));
  }
}
