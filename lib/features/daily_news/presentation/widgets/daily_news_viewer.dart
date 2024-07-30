import 'package:flutter/material.dart';
import '../../domain/entities/article.dart';

class DailyNewsViewer extends StatelessWidget {
  final ArticleEntity article;
  const DailyNewsViewer({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: const BoxDecoration(color: Colors.white10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              article.urlToImage == null
                  ? Container(
                      color: Colors.white12,
                      height: 250,
                      width: 150,
                      child: const Center(
                        child : Icon(Icons.error_outline_sharp,size: 40,)
                      ),
                    )
                  : Container(
                      height: 250,
                      width: 150,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(article.urlToImage!),
                              fit: BoxFit.fill)),
                    ),
              const SizedBox(
                width: 8,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                      width: 200,
                      height: 45,
                      child: Text(
                        article.title!,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      )),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                      width: 200,
                      height: 100,
                      child: Text(
                        article.description ?? '',
                        style: const TextStyle(color: Colors.white60),
                      )),
                  const SizedBox(
                    height: 65,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 130,
                      ),
                      SizedBox(
                          width: 80,
                          height: 20,
                          child: Text(
                            article.publishedAt ?? '',
                            style: const TextStyle(color: Colors.white60),
                          )),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
