import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

typedef OnHomeChangedBannerCallback = void Function(int index);

class HomeCarouselHeadline extends StatelessWidget {
  final int selectedIndex;
  final OnHomeChangedBannerCallback onChangedBanner;
  const HomeCarouselHeadline({
    super.key,
    required this.selectedIndex,
    required this.onChangedBanner,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Stack(
        children: [
          _buildImageCarousel(),
          // _buildPageIndicator(state.entities),
        ],
      ),
    );
  }

  Widget _buildImageCarousel() {
    return Wrap(
      children: List.generate(
        1, // data.length,
        (index) {
          return CarouselSlider.builder(
            itemCount: 1, //data[index].banner?.length ?? 0,
            options: CarouselOptions(
              viewportFraction: 1.0,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              onPageChanged: (index, _) {
                onChangedBanner(index);
              },
            ),
            itemBuilder: (context, itemIndex, dpageViewIndex) {
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
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: CachedNetworkImage(
                        imageUrl: 'https://dummyimage.com/600x400/000/fff',
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  // Widget _buildPageIndicator(StoreCBannerEntities entities) {
  //   final data = entities.data!.where((e) => e.type == 1).toList();
  //   return Positioned(
  //     bottom: 24.0,
  //     right: 24.0,
  //     child: SingleChildScrollView(
  //       scrollDirection: Axis.horizontal,
  //       child: Wrap(
  //         children: List.generate(
  //           data.length,
  //           (index) {
  //             return Row(
  //               children: List.generate(
  //                 data[index].banner!.length,
  //                 (itemIndex) {
  //                   return AnimatedContainer(
  //                     duration: const Duration(milliseconds: 150),
  //                     margin: const EdgeInsets.symmetric(horizontal: 4.0),
  //                     height: 8.0,
  //                     width: selectedIndex == itemIndex ? 24 : 8.0,
  //                     decoration: BoxDecoration(
  //                       borderRadius: BorderRadius.circular(6.0),
  //                       color: selectedIndex == itemIndex
  //                           ? Palette.primary_orange
  //                           : Palette.neutral_white,
  //                     ),
  //                   );
  //                 },
  //               ),
  //             );
  //           },
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
