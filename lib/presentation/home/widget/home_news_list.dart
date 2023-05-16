import 'package:beritaku/domain/home_everything/entities/home_everything_entities.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HomeNewsList extends StatelessWidget {
  final HomeEverythingEntities entities;
  const HomeNewsList({
    super.key,
    required this.entities,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 12.0);
      },
      itemBuilder: (BuildContext context, int index) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImage(entities, index),
            const SizedBox(width: 12.0),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTitle(context, entities, index),
                  _buildDesc(context, entities, index),
                  _buildAuthor(context, entities, index)
                ],
              ),
            )
          ],
        );
      },
    );
  }

  Widget _buildImage(HomeEverythingEntities entities, int index) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        height: 100,
        width: 100,
        imageUrl: entities.articles?[index].urlToImage ??
            'https://dummyimage.com/600x400/000/fff',
      ),
    );
  }

  Widget _buildTitle(
      BuildContext context, HomeEverythingEntities entities, int index) {
    return Text(
      entities.articles?[index].title ?? '-',
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontSize: 16.0,
            fontWeight: FontWeight.w700,
          ),
    );
  }

  Widget _buildDesc(
      BuildContext context, HomeEverythingEntities entities, int index) {
    return Text(
      "${entities.articles?[index].description ?? '-'} \n",
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
          ),
    );
  }

  Widget _buildAuthor(
      BuildContext context, HomeEverythingEntities entities, int index) {
    return Text(
      "by ${entities.articles?[index].author ?? '-'}",
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontSize: 14.0,
            color: Colors.grey,
            fontWeight: FontWeight.w400,
          ),
    );
  }
}
