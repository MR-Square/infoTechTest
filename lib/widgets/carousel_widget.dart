import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:nimap_app/models/record_model.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({
    super.key,
    required this.record,
  });

  final RecordModel record;

  static final _myCacheManager = CacheManager(Config(
    'myImages',
    stalePeriod: const Duration(days: 2),
    
  )); 

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return CarouselSlider(
      options: CarouselOptions(height: 200.0,),
      items: [record.mainImageUrl].map(
        (i) {
          return Builder(
            builder: (BuildContext context) {
              return CachedNetworkImage(
                key: UniqueKey(),
                width: width,
                height: 250,
                imageUrl: i,
                fit: BoxFit.cover,
                cacheManager: _myCacheManager,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              );
            },
          );
        },
      ).toList(),
    );
  }
}
