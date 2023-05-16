import 'package:beritaku/core/model/argument/detail_arg.dart';
import 'package:beritaku/core/router/router_constant.dart';
import 'package:beritaku/domain/home_headline/entities/home_headline_entities.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HomeCategoryList extends StatelessWidget {
  final HomeHeadlineEntities entities;
  const HomeCategoryList({
    super.key,
    required this.entities,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: 10,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 12.0);
        },
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () => Navigator.pushNamed(
              context,
              RouterConstant.detailWebview,
              arguments: DetailArg(
                url: entities.articles?[index].url ?? '',
              ),
            ),
            child: Container(
              color: Colors.transparent,
              child: Row(
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
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildImage(HomeHeadlineEntities entities, int index) {
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
      BuildContext context, HomeHeadlineEntities entities, int index) {
    return Text(
      entities.articles?[index].title ?? '-',
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontSize: 16.0,
            fontWeight: FontWeight.w700,
          ),
    );
  }

  Widget _buildDesc(
      BuildContext context, HomeHeadlineEntities entities, int index) {
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
      BuildContext context, HomeHeadlineEntities entities, int index) {
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
