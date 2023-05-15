import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HomeNewsList extends StatelessWidget {
  const HomeNewsList({super.key});

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
            _buildImage(),
            const SizedBox(width: 12.0),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTitle(context),
                  _buildDesc(context),
                  _buildAuthor(context, 'Nicola')
                ],
              ),
            )
          ],
        );
      },
    );
  }

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        height: 100,
        width: 100,
        imageUrl: 'https://dummyimage.com/600x400/000/fff',
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      "Title",
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontSize: 16.0,
            fontWeight: FontWeight.w700,
          ),
    );
  }

  Widget _buildDesc(BuildContext context) {
    return Text(
      "asu \n",
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
          ),
    );
  }

  Widget _buildAuthor(BuildContext context, String author) {
    return Text(
      "by $author",
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontSize: 14.0,
            color: Colors.grey,
            fontWeight: FontWeight.w400,
          ),
    );
  }
}
