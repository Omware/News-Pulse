import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/models/article.dart';
import 'package:newsapp/provider/news_provider.dart';
import 'package:newsapp/screens/news_detail.dart';
import 'package:newsapp/service/news_service.dart';
import 'package:newsapp/widgets/news_card.dart';
import 'package:newsapp/widgets/news_card_shimmer.dart';

class SearchNewsScreen extends StatefulWidget {
  const SearchNewsScreen({super.key});

  @override
  State<SearchNewsScreen> createState() => _SearchNewsScreenState();
}

class _SearchNewsScreenState extends State<SearchNewsScreen> {
  var newsProvider = NewsService();
  var word = '';
  Future<List<Article>?> _newsFuture = Future.value([]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Search News'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SearchBar(
                controller: TextEditingController(),
                padding: const MaterialStatePropertyAll<EdgeInsets>(
                    EdgeInsets.symmetric(horizontal: 16.0)),
                onSubmitted: (value) {
                  setState(() {
                    word = value;
                    _newsFuture = newsProvider.searchEverything(value);
                  });
                },
                leading: const Icon(Icons.search),
              ),
              const SizedBox(
                height: 5,
              ),
              FutureBuilder(
                  future: _newsFuture,
                  builder: (ctx, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    }
                    if (snapshot.hasError) {
                      return Center(
                        child: Text('error---- ${snapshot.error!.toString()}'),
                      );
                    }
                    if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(
                        child: Text('No Articles Found'),
                      );
                    }
                    return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (ctx, index) => NewsCard(
                            article: snapshot.data![index],
                            onSelectArticle: (article) => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) => NewsDetailScreen(
                                          article: article,
                                        )))));
                  })
            ],
          ),
        ));
  }
}
