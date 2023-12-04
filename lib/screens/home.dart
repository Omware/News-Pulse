import 'package:flutter/material.dart';
import 'package:newsapp/screens/news_screen.dart';
import 'package:newsapp/service/news_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool dark = false;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 65,
          leading: const Icon(Icons.rss_feed),
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'News',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 5,
              ),
              Text('Pulse',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold))
            ],
          ),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'Top Headliness'),
              Tab(text: 'Business'),
              Tab(text: 'Technology'),
              Tab(text: 'Sports'),
              Tab(text: 'Science'),
            ],
          ),
        ),
        body: TabBarView(children: [
          NewsScreen(fetchNews: () => NewsService().getNews()),
          NewsScreen(fetchNews: () => NewsService().getBusiness()),
          NewsScreen(fetchNews: () => NewsService().getTechnology()),
          NewsScreen(fetchNews: () => NewsService().getSports()),
          NewsScreen(fetchNews: () => NewsService().getScience()),
        ]),
      ),
    );
  }
}
