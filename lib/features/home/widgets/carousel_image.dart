import 'package:amazon_clone/constrains/global_variables.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class CarouselImage extends StatelessWidget {
  const CarouselImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: CarouselSlider(
        items: GlobalVariables.carouselImages.map((e) {
          return Builder(
              builder: (BuildContext context) =>
                  Image.network(e, fit: BoxFit.cover));
        }).toList(),
        options: CarouselOptions(
          viewportFraction: 1,
          height: 200,
        ),
      ),
    );
  }
}
