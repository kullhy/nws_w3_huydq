import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nws_w3_huydq/common/app_colors.dart';
import 'package:nws_w3_huydq/common/app_svgs.dart';
import 'package:nws_w3_huydq/common/app_text_styles.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        categoryItem(AppSVGs.icGenres, "Genres"),
        const SizedBox(width: 18),
        categoryItem(AppSVGs.icTiviSeries, "TV series"),
        const SizedBox(width: 18),
        categoryItem(AppSVGs.icMovies, "Movies"),
        const SizedBox(width: 18),
        categoryItem(AppSVGs.icInTheatre, "In Theatre"),
      ],
    );
  }

  Container categoryItem(String assetsPath, String name) {
    return Container(
      padding: const EdgeInsets.only(top: 28, bottom: 14),
      height: 95,
      width: 65,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 1, color: const Color(0x40FFFFFF)),
          gradient: AppColors.category),
      child: Column(
        children: [
          SvgPicture.asset(
            assetsPath,
            height: 31,
            width: 31,
          ),
          const Spacer(),
          Text(
            name,
            style: AppTextStyle.whiteS10,
          )
        ],
      ),
    );
  }
}
