import 'package:flutter/material.dart';
import 'package:newsapp/models/article.dart';

class NewsDetailScreen extends StatelessWidget {
  const NewsDetailScreen({super.key, required this.article});
  final Article article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.bookmark_add)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.share))
        ],
      )),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    article.source.name,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  const Spacer(),
                  Text(
                    article.formattedDate,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                article.title,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(
                height: 15,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: article.urlToImage == null
                    ? Image.asset('assets/photo.png')
                    : Image.network(
                        article.urlToImage!,
                        fit: BoxFit.cover,
                        height: 250.0,
                        width: double.infinity,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset('assets/photo.png');
                        },
                      ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Icons.account_circle_sharp, size: 30,),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Published by',
                          style: Theme.of(context).textTheme.bodySmall,
                          
                        ),
                        Text(
                          article.author == null ? '' : article.author!,
                          style: Theme.of(context).textTheme.titleMedium,
                          maxLines: 2,
                          softWrap: true,
                        ),
                      ],
                    )
                  ]),
              const SizedBox(
                height: 15,
              ),
              Text(
                '${article.description ?? ""}. ${article.content ?? ""}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              
            ],
          )),
    );
  }
}
