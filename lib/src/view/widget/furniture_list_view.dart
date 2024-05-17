import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hungry_hund/core/app_style.dart';
import 'package:hungry_hund/core/app_extension.dart';
import 'package:hungry_hund/src/model/furniture.dart';
import 'package:hungry_hund/src/view/widget/rating_bar.dart';

class FurnitureListView extends StatelessWidget {
  final bool isHorizontal;
  final Function(Furniture furniture)? onTap;
  final List<Furniture> furnitureList;

  const FurnitureListView({
    super.key,
    this.isHorizontal = true,
    this.onTap,
    required this.furnitureList,
  });

  Widget _furnitureScore(Furniture furniture) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StarRatingBar(score: furniture.score),
        const SizedBox(width: 10),
        Text(furniture.score.toString(), style: h4Style),
      ],
    ).fadeAnimation(1.0);
  }

  Widget _furnitureImage(String image) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: Image.asset(image, width: 150, height: 150, fit: BoxFit.cover),
    ).fadeAnimation(0.4);
  }

  Widget _listViewItem(Furniture furniture, int index) {
    Widget widget;
    widget = isHorizontal
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(tag: index, child: _furnitureImage(furniture.images[0])),
              const SizedBox(height: 10),
              Text(furniture.title.addOverFlow, style: h4Style, textAlign: TextAlign.center).fadeAnimation(0.8),
              const SizedBox(height: 5),
              _furnitureScore(furniture),
            ],
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _furnitureImage(furniture.images[0]),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(furniture.title, style: h4Style).fadeAnimation(0.8),
                      const SizedBox(height: 5),
                      _furnitureScore(furniture),
                      const SizedBox(height: 5),
                      Text(
                        furniture.description,
                        style: h5Style.copyWith(fontSize: 12),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ).fadeAnimation(1.4),
                    ],
                  ),
                ),
              ),
            ],
          );

    return GestureDetector(
      onTap: () => onTap?.call(furniture),
      child: widget,
    );
  }

  @override
  Widget build(BuildContext context) {
    return isHorizontal
        ? CarouselSlider.builder(
            itemCount: furnitureList.length,
            itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
              Furniture furniture = furnitureList[itemIndex];
              return _listViewItem(furniture, itemIndex);
            },
            options: CarouselOptions(
              height: 240,
              scrollDirection: Axis.horizontal,
              viewportFraction: 0.8,
              enlargeCenterPage: true,
              enableInfiniteScroll: true,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              aspectRatio: 3.0,
            ),
          )
        : ListView.builder(
            shrinkWrap: true,
            reverse: true,
            physics: const ClampingScrollPhysics(),
            itemCount: furnitureList.length,
            itemBuilder: (_, index) {
              Furniture furniture = furnitureList[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 15, top: 10),
                child: _listViewItem(furniture, index),
              );
            },
          );
  }
}
