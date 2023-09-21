import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nws_w3_huydq/common/app_colors.dart';
import 'package:nws_w3_huydq/common/app_svgs.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.only(left: 50, right: 50),
      padding: const EdgeInsets.only(left: 16, right: 16),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.secondary),
          borderRadius: BorderRadius.circular(15),
          gradient: AppColors.itemBackgroundGadient),
      child: Row(children: [
        SvgPicture.asset(
          AppSVGs.icSearch,
          height: 22,
          width: 22,
        ),
        const SizedBox(
          width: 15,
        ),
        const Flexible(
          child: TextField(
            decoration: InputDecoration(
              // border: OutlineInputBorder(),
              border: InputBorder.none,
              hintText: 'Search',
              hintStyle: TextStyle(color: AppColors.secondary, fontSize: 18),
            ),
          ),
        ),
        const VerticalDivider(
          color: AppColors.secondary,
          thickness: 1,
          indent: 7,
          endIndent: 7,
        ),
        const SizedBox(
          width: 10,
        ),
        SvgPicture.asset(
          AppSVGs.icVoice,
          height: 22,
          width: 16,
        )
      ]),
    );
  }
}
