import 'package:flutter/material.dart';
import 'package:newsapp/models/article.dart';

class NewsCard extends StatelessWidget {
  const NewsCard(
      {super.key, required this.article, required this.onSelectArticle});
  final Article article;
  final void Function(Article article) onSelectArticle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onSelectArticle(article),
      child: Card(
        margin: const EdgeInsets.all(5.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.source.name,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      article.title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      article.formattedDate,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                flex: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: article.urlToImage == null
                      ? Image.asset('assets/photo.png')
                      : Image.network(
                          article.urlToImage.toString(),
                          fit: BoxFit.cover,
                          height: 100.0,
                          width: double.infinity,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset('assets/photo.png');
                          },
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
