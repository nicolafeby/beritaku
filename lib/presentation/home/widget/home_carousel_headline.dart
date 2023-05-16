import 'package:beritaku/core/utils/app_constant.dart';
import 'package:beritaku/domain/home_headline/entities/home_headline_entities.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

typedef OnHomeChangedBannerCallback = void Function(int index);

class HomeCarouselHeadline extends StatelessWidget {
  final HomeHeadlineEntities entities;
  final int selectedIndex;
  final OnHomeChangedBannerCallback onChangedBanner;
  const HomeCarouselHeadline({
    super.key,
    required this.selectedIndex,
    required this.onChangedBanner,
    required this.entities,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: _buildImageCarousel(),
        ),
        _buildPageIndicator(entities)
      ],
    );
  }

  Widget _buildImageCarousel() {
    return CarouselSlider.builder(
      itemCount:
          entities.articles!.length >= 10 ? 10 : entities.articles?.length,
      options: CarouselOptions(
        viewportFraction: 1.0,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        onPageChanged: (index, _) {
          onChangedBanner(index);
        },
      ),
      itemBuilder: (context, itemIndex, dpageViewIndex) {
        final data = entities.articles?[itemIndex];
        return GestureDetector(
          onTap: () async {
            // final link = data[index].banner![itemIndex].link;
            // if (link == null) return;

            // if (!link.startsWith('https')) return;

            // await launchUrl(
            //   Uri.parse(link),
            //   mode: LaunchMode.externalApplication,
            // );
          },
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
              margin: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                bottom: 16.0,
                top: 2.0,
              ),
              child: Stack(
                children: [
                  Banner(
                    location: BannerLocation.topStart,
                    message: 'Headline',
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: CachedNetworkImage(
                          imageUrl: data?.urlToImage ??
                              'https://dummyimage.com/600x400/000/fff',
                        ),
                      ),
                    ),
                  ),
                  _buildTitle(data ?? ArticlesEntities())
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTitle(ArticlesEntities data) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
                colors: [Colors.black12.withOpacity(0), Colors.black],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              data.title ?? '',
              style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPageIndicator(HomeHeadlineEntities entities) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          entities.articles!.length >= 10 ? 10 : entities.articles!.length,
          (itemIndex) {
            // final data = entities.articles?[itemIndex];
            return AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              height: 8.0,
              width: selectedIndex == itemIndex ? 24 : 8.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
                color: selectedIndex == itemIndex
                    ? ColorConstant.primary900
                    : ColorConstant.light900,
              ),
            );
          },
        ),
      ),
    );
  }
}
