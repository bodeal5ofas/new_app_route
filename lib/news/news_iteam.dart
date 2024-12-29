//import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/modal/news_model.dart';
import 'package:news_app/mytheme.dart';

class NewsIteam extends StatelessWidget {
  const NewsIteam({super.key, required this.newsModel});
  final NewsModel newsModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(),
        padding: const EdgeInsets.all(13),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // CachedNetworkImage(
            //   imageUrl: newsModel.image,
            //   placeholder: (context, url) => CircularProgressIndicator(),
            //   errorWidget: (context, url, error) => Icon(Icons.error),
            // ),
            Image.network(
              newsModel.image,
              height: MediaQuery.of(context).size.height * 0.35,
              fit: BoxFit.fill,
            ),
            Text(
              newsModel.title,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: MyTheme.greyColor),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              newsModel.description,
              style: Theme.of(context).textTheme.titleLarge,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'BBc Nes',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: MyTheme.greyColor),
              textAlign: TextAlign.end,
            ),
          ],
        ),
      ),
    );
  }
}
