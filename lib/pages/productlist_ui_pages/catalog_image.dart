import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../theme_data/theme_data.dart';
class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({super.key, required this.image}):assert(image!=null);

  @override
  Widget build(BuildContext context) {

    return  Image.network(image).box.roundedLg.p8.color(MyTheme.creamColor).make().py12().w40(context);
  }
}
